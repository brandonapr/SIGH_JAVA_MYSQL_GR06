package ec.edu.monster.sigh.dao;

import ec.edu.monster.sigh.conexion.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.LinkedHashMap;
import java.util.Locale;

/** Consultas de solo lectura; los parámetros nunca se concatenan con SQL. */
public class ReporteDAO {
    @SuppressWarnings("unchecked")
    public List<Object[]> consultar(String sql, Object... parametros) {
        try (EntityManager em = JpaUtil.crearEntityManager()) {
            Query q = em.createNativeQuery(sql);
            for (int i = 0; i < parametros.length; i++) q.setParameter(i + 1, parametros[i]);
            return q.getResultList();
        }
    }

    public boolean autorizado(String usuario, String opcion) {
        try (EntityManager em = JpaUtil.crearEntityManager()) {
            Number n = (Number) em.createNativeQuery("SELECT COUNT(*) FROM XEUXP_USUPE a JOIN XEUSU_USUAR u ON u.XEUSU_CODIGO=a.XEUSU_CODIGO WHERE a.XEUSU_CODIGO=? AND u.XEEST_CODIGO='A' AND a.XEUXP_FECASI<=CURRENT_DATE AND (a.XEUXP_FECRET IS NULL OR a.XEUXP_FECRET>=CURRENT_DATE) AND (a.XEPER_CODIGO='ADMINSIS' OR EXISTS (SELECT 1 FROM XEOXP_OPCPE o WHERE o.XEPER_CODIGO=a.XEPER_CODIGO AND o.XEOPC_CODIGO=? AND o.XEOXP_FECASI<=CURRENT_DATE AND (o.XEOXP_FECRET IS NULL OR o.XEOXP_FECRET>=CURRENT_DATE)))")
                .setParameter(1, usuario).setParameter(2, opcion).getSingleResult();
            return n.longValue() > 0;
        }
    }

    public List<Object[]> perfiles() {
        return consultar("SELECT XEPER_CODIGO, CONCAT(XEPER_CODIGO,' — ',XEPER_DESCRI) FROM XEPER_PERFI ORDER BY XEPER_CODIGO");
    }
    public List<Object[]> usuarios(String perfil, LocalDate fecha) {
        List<Object[]> filas = consultar("SELECT u.XEUSU_CODIGO, CONCAT(p.PEPER_APELLI,' ',p.PEPER_NOMBRE), e.XEEST_DESCRI, DATE_FORMAT(a.XEUXP_FECASI,'%d/%m/%Y') FROM XEUXP_USUPE a JOIN XEUSU_USUAR u ON u.XEUSU_CODIGO=a.XEUSU_CODIGO JOIN PEPER_PERSON p ON p.PEPER_CODIGO=u.PEPER_CODIGO JOIN XEEST_ESTAD e ON e.XEEST_CODIGO=u.XEEST_CODIGO WHERE a.XEPER_CODIGO=? AND a.XEUXP_FECASI<=? AND (a.XEUXP_FECRET IS NULL OR a.XEUXP_FECRET>=?) ORDER BY u.XEUSU_CODIGO,a.XEUXP_FECASI", perfil, fecha.toString(), fecha.toString());
        LinkedHashMap<String,Object[]> unicos = new LinkedHashMap<>();
        for (Object[] fila : filas) unicos.putIfAbsent(fila[0].toString().trim().toUpperCase(Locale.ROOT), fila);
        return new ArrayList<>(unicos.values());
    }
    public boolean extensionInstalada() {
        try (EntityManager em = JpaUtil.crearEntityManager()) {
            Number n = (Number) em.createNativeQuery("SELECT COUNT(*) FROM information_schema.TABLES WHERE TABLE_SCHEMA=DATABASE() AND UPPER(TABLE_NAME) IN ('PACIENTE','PROFESIONAL','ESPECIALIDAD','CONSULTORIO','AGENDA_MEDICA','CITA','FACTURA','PAGO')").getSingleResult();
            return n.intValue() == 8;
        }
    }
    public List<Object[]> citas(String desde, String hasta, String profesional, String especialidad, String estado) {
        StringBuilder sql = new StringBuilder("SELECT DATE_FORMAT(c.CITA_FECHA_HORA,'%d/%m/%Y %H:%i'), CONCAT(p.PACIENTE_APELLIDOS,', ',p.PACIENTE_NOMBRES), CONCAT(m.PROFESIONAL_APELLIDOS,', ',m.PROFESIONAL_NOMBRES), e.ESPECIALIDAD_NOMBRE, co.CONSULTORIO_CODIGO,c.CITA_ESTADO FROM CITA c JOIN PACIENTE p ON p.PACIENTE_ID_PACIENTE=c.PACIENTE_ID_PACIENTE JOIN AGENDA_MEDICA a ON a.AGENDA_MEDICA_ID_AGENDA=c.AGENDA_MEDICA_ID_AGENDA JOIN PROFESIONAL m ON m.PROFESIONAL_ID_PROFESIONAL=a.PROFESIONAL_ID_PROFESIONAL JOIN ESPECIALIDAD e ON e.ESPECIALIDAD_ID_ESPECIALIDAD=a.ESPECIALIDAD_ID_ESPECIALIDAD JOIN CONSULTORIO co ON co.CONSULTORIO_ID_CONSULTORIO=a.CONSULTORIO_ID_CONSULTORIO WHERE 1=1");
        List<Object> args = new ArrayList<>();
        filtro(sql,args,"c.CITA_FECHA_HORA >= ?",desde);
        filtro(sql,args,"c.CITA_FECHA_HORA < DATE_ADD(?, INTERVAL 1 DAY)",hasta);
        filtro(sql,args,"m.PROFESIONAL_ID_PROFESIONAL = ?",profesional);
        filtro(sql,args,"e.ESPECIALIDAD_ID_ESPECIALIDAD = ?",especialidad);
        filtro(sql,args,"c.CITA_ESTADO = ?",estado);
        return consultar(sql.append(" ORDER BY c.CITA_FECHA_HORA,c.CITA_ID_CITA").toString(),args.toArray());
    }
    public List<Object[]> facturas(String desde, String hasta, String numero, String paciente, String estado) {
        StringBuilder sql = new StringBuilder("SELECT f.FACTURA_NUMERO_COMPROBANTE, DATE_FORMAT(f.FACTURA_FECHA_EMISION,'%d/%m/%Y'), CONCAT(p.PACIENTE_APELLIDOS,', ',p.PACIENTE_NOMBRES), f.FACTURA_ESTADO, f.FACTURA_TOTAL, COALESCE(pg.pagado,0), CASE WHEN f.FACTURA_ESTADO='ANULADA' THEN 0 ELSE f.FACTURA_TOTAL-COALESCE(pg.pagado,0) END FROM FACTURA f JOIN PACIENTE p ON p.PACIENTE_ID_PACIENTE=f.PACIENTE_ID_PACIENTE LEFT JOIN (SELECT FACTURA_ID_FACTURA,SUM(PAGO_MONTO) pagado FROM PAGO WHERE PAGO_ESTADO='REGISTRADO' GROUP BY FACTURA_ID_FACTURA) pg ON pg.FACTURA_ID_FACTURA=f.FACTURA_ID_FACTURA WHERE 1=1");
        List<Object> args = new ArrayList<>();
        filtro(sql,args,"f.FACTURA_FECHA_EMISION >= ?",desde);
        filtro(sql,args,"f.FACTURA_FECHA_EMISION < DATE_ADD(?, INTERVAL 1 DAY)",hasta);
        filtro(sql,args,"LOCATE(?, f.FACTURA_NUMERO_COMPROBANTE)>0",numero);
        filtro(sql,args,"p.PACIENTE_ID_PACIENTE = ?",paciente);
        filtro(sql,args,"f.FACTURA_ESTADO = ?",estado);
        return consultar(sql.append(" ORDER BY f.FACTURA_FECHA_EMISION,f.FACTURA_ID_FACTURA").toString(),args.toArray());
    }
    private static void filtro(StringBuilder sql,List<Object> args,String condicion,String valor) {
        if (!valor.isEmpty()) { sql.append(" AND ").append(condicion); args.add(valor); }
    }
}
