package ec.edu.monster.sigh.controlador;

import ec.edu.monster.sigh.dao.UsuarioDAO;
import ec.edu.monster.sigh.modelo.ResultadoAcceso;
import ec.edu.monster.sigh.util.SeguridadFormulario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(urlPatterns = {"/login", "/salir"})
public class ControladorLogin extends HttpServlet {
    private static final Logger REGISTRO = Logger.getLogger(ControladorLogin.class.getName());
    private final UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {
        if ("/salir".equals(solicitud.getServletPath())) {
            respuesta.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            return;
        }
        HttpSession sesion = solicitud.getSession(false);
        if (sesion != null && sesion.getAttribute("usuarioSesion") != null) {
            respuesta.sendRedirect(solicitud.getContextPath() + "/inicio");
            return;
        }
        solicitud.setAttribute("tokenCsrf", SeguridadFormulario.token(solicitud.getSession(true)));
        solicitud.getRequestDispatcher("/WEB-INF/vistas/login.jsp").forward(solicitud, respuesta);
    }

    @Override
    protected void doPost(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {
        if (!SeguridadFormulario.comprobar(solicitud)) {
            respuesta.sendError(HttpServletResponse.SC_FORBIDDEN, "Formulario caducado o inválido.");
            return;
        }
        if ("/salir".equals(solicitud.getServletPath())) {
            HttpSession sesion = solicitud.getSession(false);
            if (sesion != null) sesion.invalidate();
            respuesta.sendRedirect(solicitud.getContextPath() + "/login");
            return;
        }

        String usuario = solicitud.getParameter("usuarioLogin");
        String clave = solicitud.getParameter("clave");
        usuario = usuario == null ? "" : usuario.trim();
        clave = clave == null ? "" : clave;

        if (usuario.isBlank() || usuario.length() > 20 || clave.isBlank() || clave.length() > 256) {
            mostrarError(solicitud, respuesta, usuario, "Revise los datos de acceso e ingrese los campos requeridos.");
            return;
        }

        try {
            ResultadoAcceso resultado = usuarioDAO.ingresar(usuario, clave);
            if (!resultado.isCorrecto()) {
                mostrarError(solicitud, respuesta, usuario, resultado.getMensaje());
                return;
            }
            solicitud.changeSessionId();
            HttpSession sesion = solicitud.getSession();
            sesion.setAttribute("usuarioSesion", resultado.getUsuario());
            sesion.setMaxInactiveInterval(30 * 60);
            respuesta.sendRedirect(solicitud.getContextPath() + "/inicio");
        } catch (RuntimeException ex) {
            REGISTRO.log(Level.SEVERE, "Error de autenticación con JPA/MariaDB", ex);
            mostrarError(solicitud, respuesta, usuario,
                    "El servicio de autenticación no está disponible temporalmente. Intente nuevamente en unos minutos.");
        }
    }

    private void mostrarError(HttpServletRequest solicitud, HttpServletResponse respuesta,
                              String usuario, String mensaje) throws ServletException, IOException {
        solicitud.setAttribute("usuarioIngresado", usuario);
        solicitud.setAttribute("error", mensaje);
        solicitud.setAttribute("tokenCsrf", SeguridadFormulario.token(solicitud.getSession(true)));
        solicitud.getRequestDispatcher("/WEB-INF/vistas/login.jsp").forward(solicitud, respuesta);
    }
}
