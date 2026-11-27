package ec.edu.monster.sigh.controlador;

import ec.edu.monster.sigh.dao.PersonaDAO;
import ec.edu.monster.sigh.dao.PersonaDAO.Resultado;
import ec.edu.monster.sigh.dao.DepartamentoDAO;
import ec.edu.monster.sigh.modelo.PeperPerson;
import ec.edu.monster.sigh.util.SeguridadFormulario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/persona")
public class ControladorPersona extends HttpServlet {
    private static final Logger REGISTRO = Logger.getLogger(ControladorPersona.class.getName());
    private static final String VISTA = "/WEB-INF/vistas/personas/index.jsp";
    private final PersonaDAO personaDAO = new PersonaDAO();
    private final DepartamentoDAO departamentoDAO = new DepartamentoDAO();

    @Override
    protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        try {
            List<PeperPerson> personas = personaDAO.listar();
            String codigo = codigo(solicitud);
            String modo = valor(solicitud, "modo");
            String nav = valor(solicitud, "nav");
            boolean nuevo = "nuevo".equals(modo);
            boolean listar = "listar".equals(modo);
            int indice = -1;
            for (int i = 0; i < personas.size(); i++) {
                if (personas.get(i).getPeperCodigo().equalsIgnoreCase(codigo)) { indice = i; break; }
            }
            if (!nuevo && !personas.isEmpty()) {
                indice = switch (nav) {
                    case "primero" -> 0;
                    case "ultimo" -> personas.size() - 1;
                    case "anterior" -> indice < 0 ? personas.size() - 1 : Math.max(0, indice - 1);
                    case "siguiente" -> Math.min(personas.size() - 1, indice + 1);
                    default -> indice;
                };
            }
            PeperPerson actual = nuevo || indice < 0 ? null : personas.get(indice);
            String error = !nuevo && !codigo.isEmpty() && actual == null ? "La persona no existe." : null;
            String mensaje = (String) solicitud.getSession().getAttribute("mensajePersona");
            solicitud.getSession().removeAttribute("mensajePersona");
            solicitud.setAttribute("mensaje", mensaje);
            mostrar(solicitud, respuesta, personas, actual, departamento(actual), nuevo, listar, error);
        } catch (RuntimeException ex) { errorCarga(solicitud, respuesta, ex); }
    }

    @Override
    protected void doPost(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        if (!SeguridadFormulario.comprobar(solicitud)) { respuesta.sendError(403); return; }
        String accion = valor(solicitud, "accion");
        String codigo = codigo(solicitud);
        boolean nuevo = codigo.isEmpty();
        PeperPerson datos = new PeperPerson();
        datos.setPeperCodigo(codigo);
        datos.setPeperApelli(valor(solicitud, "apellidos"));
        datos.setPeperNombre(valor(solicitud, "nombres"));
        datos.setPeperEmail(valor(solicitud, "email"));
        String departamento = valor(solicitud, "departamento").toUpperCase(Locale.ROOT);
        try {
            Resultado resultado;
            if ("eliminar".equals(accion) && !nuevo) {
                resultado = personaDAO.eliminar(codigo);
                if (resultado != Resultado.CORRECTO) {
                    List<PeperPerson> lista = personaDAO.listar();
                    PeperPerson actual = lista.stream().filter(p -> p.getPeperCodigo().equalsIgnoreCase(codigo)).findFirst().orElse(null);
                    mostrar(solicitud, respuesta, lista, actual, departamento(actual), false, false, mensaje(resultado));
                    return;
                }
            } else if ("guardar".equals(accion)) {
                String error = validar(datos, departamento);
                if (error == null) {
                    resultado = personaDAO.guardar(datos, departamento, nuevo);
                    if (resultado != Resultado.CORRECTO) error = mensaje(resultado);
                }
                if (error != null) {
                    mostrar(solicitud, respuesta, personaDAO.listar(), datos, departamento, nuevo, false, error);
                    return;
                }
            } else { respuesta.sendError(400); return; }
            solicitud.getSession().setAttribute("mensajePersona", "eliminar".equals(accion) ? "La persona se eliminó correctamente." : nuevo ? "La persona se registró correctamente." : "La persona se actualizó correctamente.");
            respuesta.setStatus(HttpServletResponse.SC_SEE_OTHER);
            respuesta.setHeader("Location", solicitud.getContextPath() + "/persona?tab=" + pestana(solicitud));
        } catch (RuntimeException ex) { errorCarga(solicitud, respuesta, ex); }
    }

    private void mostrar(HttpServletRequest s, HttpServletResponse r, List<PeperPerson> personas, PeperPerson actual, String departamento, boolean nuevo, boolean listar, String error) throws ServletException, IOException {
        s.setAttribute("tokenCsrf", SeguridadFormulario.token(s.getSession()));
        s.setAttribute("persona", actual);
        s.setAttribute("departamentoSeleccionado", departamento);
        s.setAttribute("departamentos", departamentoDAO.listar());
        s.setAttribute("nuevo", nuevo);
        s.setAttribute("bloqueado", actual == null && !nuevo);
        s.setAttribute("listar", listar);
        s.setAttribute("personas", listar ? personas : List.of());
        s.setAttribute("total", personas.size());
        s.setAttribute("siguienteCodigo", nuevo ? PersonaDAO.siguienteCodigo(personas.stream().map(PeperPerson::getPeperCodigo).toList()) : "");
        s.setAttribute("tab", pestana(s));
        s.setAttribute("error", error);
        s.getRequestDispatcher(VISTA).forward(s, r);
    }

    private void errorCarga(HttpServletRequest s, HttpServletResponse r, RuntimeException ex) throws ServletException, IOException {
        REGISTRO.log(Level.SEVERE, "Error en mantenimiento de personal", ex);
        s.setAttribute("tokenCsrf", SeguridadFormulario.token(s.getSession()));
        s.setAttribute("bloqueado", true);
        s.setAttribute("errorCarga", true);
        s.setAttribute("tab", pestana(s));
        s.setAttribute("error", "No fue posible completar la operación. Revise la conexión a la base de datos e intente nuevamente.");
        s.getRequestDispatcher(VISTA).forward(s, r);
    }

    private static String departamento(PeperPerson p) { return p == null || p.getPedepCodigoNavigation() == null ? "" : p.getPedepCodigoNavigation().getPedepCodigo(); }
    private static String valor(HttpServletRequest s, String n) { String v = s.getParameter(n); return v == null ? "" : v.strip(); }
    private static String codigo(HttpServletRequest s) { return valor(s, "codigo"); }
    private static String pestana(HttpServletRequest s) { return "contacto".equals(valor(s, "tab")) ? "contacto" : "laborales"; }
    private static String validar(PeperPerson p, String d) {
        if (p.getPeperCodigo().length() > 6) return "Código inválido.";
        if (p.getPeperApelli().isEmpty() || p.getPeperApelli().length() > 50) return "Ingrese apellidos de hasta 50 caracteres.";
        if (p.getPeperNombre().isEmpty() || p.getPeperNombre().length() > 50) return "Ingrese nombres de hasta 50 caracteres.";
        if (p.getPeperEmail().length() > 100 || !p.getPeperEmail().matches("[^\\s@]+@[^\\s@]+\\.[^\\s@]+")) return "Ingrese un correo electrónico válido de hasta 100 caracteres.";
        if (d.length() > 3) return "Departamento inválido.";
        return null;
    }
    private static String mensaje(Resultado r) {
        return switch (r) {
            case NO_EXISTE -> "La persona no existe.";
            case EMAIL_DUPLICADO -> "El correo electrónico ya está registrado.";
            case DEPARTAMENTO_INVALIDO -> "El departamento seleccionado no existe.";
            case EN_USO -> "No se puede eliminar la persona porque tiene usuarios o registros asociados.";
            case SIN_CODIGOS -> "No hay códigos de personal disponibles.";
            case CONFLICTO -> "Los datos entran en conflicto con otro registro. Revise el correo y vuelva a intentar.";
            default -> "No se pudo completar la operación.";
        };
    }
}
