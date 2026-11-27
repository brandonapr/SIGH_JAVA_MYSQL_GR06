package ec.edu.monster.sigh.controlador;

import ec.edu.monster.sigh.conexion.JpaUtil;
import ec.edu.monster.sigh.dao.DepartamentoDAO;
import ec.edu.monster.sigh.dao.UsuarioDAO;
import ec.edu.monster.sigh.modelo.PedepDepar;
import ec.edu.monster.sigh.modelo.XeusuUsuar;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/api/TestOrm/status", "/api/TestOrm/usuarios", "/api/TestOrm/departamentos"})
public class ControladorTestOrm extends HttpServlet {
    private final UsuarioDAO usuarioDAO = new UsuarioDAO();
    private final DepartamentoDAO departamentoDAO = new DepartamentoDAO();

    @Override
    protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta) throws IOException {
        respuesta.setContentType("application/json; charset=UTF-8");
        String ruta = solicitud.getServletPath();

        if ("/api/TestOrm/status".equals(ruta)) {
            boolean conectado = JpaUtil.verificarConexion();
            String mensaje = conectado
                    ? "Conexión ORM exitosa con Jakarta Persistence (EclipseLink)"
                    : "No se pudo conectar con MariaDB/MySQL";
            respuesta.getWriter().printf(
                    "{\"mensaje\":\"%s\",\"baseDatos\":\"SIGH_GR06\",\"conectado\":%s}",
                    escaparJson(mensaje), conectado);
            return;
        }

        if ("/api/TestOrm/usuarios".equals(ruta)) {
            List<XeusuUsuar> usuarios = usuarioDAO.listarConPersona();
            StringBuilder json = new StringBuilder("[");
            for (int i = 0; i < usuarios.size(); i++) {
                XeusuUsuar u = usuarios.get(i);
                String empleado = (u.getPeperCodigoNavigation().getPeperNombre() + " "
                        + u.getPeperCodigoNavigation().getPeperApelli()).trim();
                if (i > 0) json.append(',');
                json.append(String.format(
                        "{\"codigo\":\"%s\",\"estado\":\"%s\",\"empleado\":\"%s\",\"email\":\"%s\",\"fechaCreacion\":\"%s\"}",
                        escaparJson(u.getXeusuCodigo()),
                        escaparJson(u.getXeestCodigo()),
                        escaparJson(empleado),
                        escaparJson(u.getPeperCodigoNavigation().getPeperEmail()),
                        escaparJson(String.valueOf(u.getXeusuFeccre()))));
            }
            json.append(']');
            respuesta.getWriter().write(json.toString());
            return;
        }

        List<PedepDepar> departamentos = departamentoDAO.listar();
        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < departamentos.size(); i++) {
            PedepDepar d = departamentos.get(i);
            if (i > 0) json.append(',');
            json.append(String.format(
                    "{\"pedepCodigo\":\"%s\",\"pedepDescri\":\"%s\"}",
                    escaparJson(d.getPedepCodigo()),
                    escaparJson(d.getPedepDescri())));
        }
        json.append(']');
        respuesta.getWriter().write(json.toString());
    }

    private static String escaparJson(String texto) {
        if (texto == null) return "";
        return texto.replace("\\", "\\\\").replace("\"", "\\\"").replace("\r", "").replace("\n", "\\n");
    }
}
