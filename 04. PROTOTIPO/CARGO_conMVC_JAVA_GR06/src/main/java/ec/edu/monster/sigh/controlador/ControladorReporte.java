package ec.edu.monster.sigh.controlador;

import ec.edu.monster.sigh.dao.*;
import ec.edu.monster.sigh.modelo.*;
import ec.edu.monster.sigh.util.SeguridadFormulario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.Normalizer;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.*;
import java.util.logging.*;

@WebServlet(urlPatterns={"/reportes", "/reportes/cargos", "/reportes/persona", "/reportes/usuarios", "/reportes/citas", "/reportes/facturas"})
public class ControladorReporte extends HttpServlet {
    private final ReporteDAO dao = new ReporteDAO();
    private final CargoDAO cargos = new CargoDAO();
    private final PersonaDAO personas = new PersonaDAO();
    private static final Logger LOG = Logger.getLogger(ControladorReporte.class.getName());
    private static final Map<String,String> PERMISOS = Map.of("cargos","P04","persona","P03","usuarios","S05","citas","H03","facturas","F03");
    private static final Map<String,String> TITULOS = Map.of("cargos","Cargos laborales por departamento","persona","Ficha de empleado","usuarios","Usuarios por perfil","citas","Citas por período","facturas","Facturas y saldos");
    @Override protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException {
        req.setAttribute("tokenCsrf", SeguridadFormulario.token(req.getSession()));
        String tipo=req.getServletPath().substring("/reportes".length()).replace("/","");
        UsuarioSesion usuario=(UsuarioSesion)req.getSession().getAttribute("usuarioSesion");
        if (usuario==null) {res.sendRedirect(req.getContextPath()+"/login");return;}
        if (tipo.isEmpty()) {
            Map<String,String> menu=new LinkedHashMap<>();
            try { for (String k:List.of("cargos","persona","usuarios","citas","facturas")) if(dao.autorizado(usuario.getCodigo(),PERMISOS.get(k))) menu.put(k,TITULOS.get(k)); }
            catch(RuntimeException ex) { LOG.log(Level.SEVERE,"Error consultando permisos",ex); res.sendError(503,"No se pudo consultar la base de datos.");return; }
            req.setAttribute("menu",menu); req.getRequestDispatcher("/WEB-INF/vistas/reportes/menu.jsp").forward(req,res);return;
        }
        req.setAttribute("tipo",tipo);req.setAttribute("titulo",TITULOS.get(tipo));
        List<Map<String,Object>> campos=new ArrayList<>(); List<Object[]> filas=new ArrayList<>();
        req.setAttribute("campos",campos);
        try {
            if (!dao.autorizado(usuario.getCodigo(),PERMISOS.get(tipo))) {res.sendError(403,"No dispone de permiso para este reporte.");return;}
            switch(tipo) {
                case "cargos" -> {
                    String dep=param(req,"departamento",3).toUpperCase(Locale.ROOT), cod=param(req,"codigo",3), desc=param(req,"descripcion",50);
                    List<Object[]> deps=cargos.listarDepartamentos().stream().map(d->new Object[]{d.getPedepCodigo(),d.getPedepCodigo()+" — "+d.getPedepDescri()}).toList();
                    campo(campos,"departamento","Departamento","select",dep,deps);campo(campos,"codigo","Código","text",cod,null);campo(campos,"descripcion","Descripción","text",desc,null);
                    req.setAttribute("columnas",List.of("Departamento","Código","Descripción"));
                    for(PecarCargo c:cargos.listar()) if((dep.isEmpty()||c.getPedepCodigo().equalsIgnoreCase(dep)) && normal(c.getPecarCodigo()).contains(normal(cod)) && normal(c.getPecarDescri()).contains(normal(desc))) filas.add(new Object[]{c.getPedepCodigo()+" — "+c.getPedepCodigoNavigation().getPedepDescri(),c.getPecarCodigo(),c.getPecarDescri()});
                }
                case "persona" -> {
                    String codigo=param(req,"codigo",6).toUpperCase(Locale.ROOT); List<PeperPerson> lista=personas.listar();
                    campo(campos,"codigo","Empleado","select",codigo,lista.stream().map(p->new Object[]{p.getPeperCodigo(),p.getPeperCodigo()+" — "+p.getPeperApelli()+", "+p.getPeperNombre()}).toList());
                    req.setAttribute("columnas",List.of("Campo","Valor"));
                    if(codigo.isEmpty()) req.setAttribute("aviso","Seleccione un empleado para consultar su ficha.");
                    else {PeperPerson p=lista.stream().filter(x->x.getPeperCodigo().equalsIgnoreCase(codigo)).findFirst().orElseThrow(()->new IllegalArgumentException("Empleado no encontrado."));
                        filas.add(new Object[]{"Código",p.getPeperCodigo()});filas.add(new Object[]{"Apellidos",p.getPeperApelli()});filas.add(new Object[]{"Nombres",p.getPeperNombre()});filas.add(new Object[]{"Departamento",p.getPedepCodigoNavigation()==null?"Sin asignar":p.getPedepCodigoNavigation().getPedepDescri()});filas.add(new Object[]{"Correo institucional",p.getPeperEmail()});}
                }
                case "usuarios" -> {
                    String perfil=param(req,"perfil",8).toUpperCase(Locale.ROOT), fecha=param(req,"fecha",10); if(fecha.isEmpty())fecha=LocalDate.now().toString();
                    List<Object[]> perfiles=dao.perfiles();campo(campos,"perfil","Perfil","select",perfil,perfiles);campo(campos,"fecha","Fecha de vigencia","date",fecha,null);
                    req.setAttribute("columnas",List.of("Usuario","Empleado","Estado actual","Asignado desde"));
                    LocalDate dia=LocalDate.parse(fecha); if(perfil.isEmpty())req.setAttribute("aviso","Seleccione un perfil.");else {validarOpcion(perfiles,perfil);filas=dao.usuarios(perfil,dia);}
                }
                case "citas","facturas" -> {
                    if(!dao.extensionInstalada()){req.setAttribute("aviso","Ejecute SIGH_GR06_TG23_Reportes_MySQL.sql para habilitar los reportes de citas y facturas.");break;}
                    String desde=param(req,"desde",10),hasta=param(req,"hasta",10),estado=param(req,"estado",30).toUpperCase(Locale.ROOT);
                    campo(campos,"desde","Desde","date",desde,null);campo(campos,"hasta","Hasta","date",hasta,null);
                    if(tipo.equals("citas")){
                        String prof=param(req,"profesionalId",10),esp=param(req,"especialidadId",10);
                        List<Object[]> profesionales=dao.consultar("SELECT PROFESIONAL_ID_PROFESIONAL,CONCAT(PROFESIONAL_APELLIDOS,', ',PROFESIONAL_NOMBRES) FROM PROFESIONAL ORDER BY PROFESIONAL_APELLIDOS");
                        List<Object[]> especialidades=dao.consultar("SELECT ESPECIALIDAD_ID_ESPECIALIDAD,ESPECIALIDAD_NOMBRE FROM ESPECIALIDAD ORDER BY ESPECIALIDAD_NOMBRE");
                        campo(campos,"profesionalId","Profesional","select",prof,profesionales);campo(campos,"especialidadId","Especialidad","select",esp,especialidades);campo(campos,"estado","Estado","select",estado,opciones("PROGRAMADA","CONFIRMADA","ATENDIDA","NO_ASISTIO","CANCELADA"));
                        periodo(desde,hasta);validarOpcion(profesionales,prof);validarOpcion(especialidades,esp);validarOpcion(opciones("PROGRAMADA","CONFIRMADA","ATENDIDA","NO_ASISTIO","CANCELADA"),estado);
                        req.setAttribute("columnas",List.of("Fecha y hora","Paciente","Profesional","Especialidad","Consultorio","Estado"));filas=dao.citas(desde,hasta,prof,esp,estado);
                    }else{
                        String numero=param(req,"numero",60),paciente=param(req,"pacienteId",10);
                        List<Object[]> pacientes=dao.consultar("SELECT PACIENTE_ID_PACIENTE,CONCAT(PACIENTE_APELLIDOS,', ',PACIENTE_NOMBRES) FROM PACIENTE ORDER BY PACIENTE_APELLIDOS");
                        campo(campos,"numero","Comprobante","text",numero,null);campo(campos,"pacienteId","Paciente","select",paciente,pacientes);campo(campos,"estado","Estado","select",estado,opciones("EMITIDA","ANULADA"));
                        periodo(desde,hasta);validarOpcion(pacientes,paciente);validarOpcion(opciones("EMITIDA","ANULADA"),estado);
                        req.setAttribute("columnas",List.of("Comprobante","Emisión","Paciente","Estado","Total (USD)","Pagos (USD)","Saldo (USD)"));filas=dao.facturas(desde,hasta,numero,paciente,estado);
                        BigDecimal emitido=BigDecimal.ZERO,pagado=BigDecimal.ZERO,saldo=BigDecimal.ZERO;
                        for(Object[] f:filas){if(!"ANULADA".equals(f[3]))emitido=emitido.add(decimal(f[4]));pagado=pagado.add(decimal(f[5]));saldo=saldo.add(decimal(f[6]));for(int i=4;i<7;i++)f[i]=decimal(f[i]).setScale(2).toPlainString();}
                        req.setAttribute("totales","Total emitido: "+emitido.setScale(2)+" USD · Pagos registrados: "+pagado.setScale(2)+" USD · Saldo: "+saldo.setScale(2)+" USD");
                    }
                }
            }
            if(req.getAttribute("aviso")==null) LOG.info("GENERAR_REPORTE "+PERMISOS.get(tipo)+" usuario="+usuario.getCodigo());
        } catch(IllegalArgumentException | DateTimeParseException ex){req.setAttribute("error","Revise los filtros. Seleccione valores válidos y un período inicial anterior o igual al final.");}
        catch(RuntimeException ex){LOG.log(Level.SEVERE,"Error generando reporte "+tipo,ex);req.setAttribute("error","No fue posible consultar el reporte. Verifique la conexión y los scripts de GR06.");}
        req.setAttribute("filas",filas);req.setAttribute("total",filas.size());
        req.getRequestDispatcher("/WEB-INF/vistas/reportes/reporte.jsp").forward(req,res);
    }
    private static String param(HttpServletRequest r,String n,int max){String s=Objects.toString(r.getParameter(n),"").trim();if(s.length()>max)throw new IllegalArgumentException();return s;}
    private static String normal(String s){return Normalizer.normalize(s.trim(),Normalizer.Form.NFD).replaceAll("\\p{M}","").toLowerCase(Locale.ROOT);}
    private static void campo(List<Map<String,Object>> campos,String nombre,String etiqueta,String tipo,String valor,List<Object[]> opciones){Map<String,Object> m=new LinkedHashMap<>();m.put("nombre",nombre);m.put("etiqueta",etiqueta);m.put("tipo",tipo);m.put("valor",valor);m.put("opciones",opciones==null?List.of():opciones.stream().map(o->new Object[]{o[0].toString().trim(),o[1]}).toList());m.put("max",nombre.equals("codigo")?3:nombre.equals("descripcion")?50:60);campos.add(m);}
    private static List<Object[]> opciones(String... valores){return Arrays.stream(valores).map(x->new Object[]{x,x}).toList();}
    private static void validarOpcion(List<Object[]> opciones,String valor){if(!valor.isEmpty()&&opciones.stream().noneMatch(x->x[0].toString().trim().equalsIgnoreCase(valor)))throw new IllegalArgumentException();}
    private static void periodo(String desde,String hasta){LocalDate d=desde.isEmpty()?null:LocalDate.parse(desde),h=hasta.isEmpty()?null:LocalDate.parse(hasta);if(d!=null&&h!=null&&d.isAfter(h))throw new IllegalArgumentException();}
    private static BigDecimal decimal(Object x){return new BigDecimal(x.toString());}
}
