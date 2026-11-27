package ec.edu.monster.sigh.controlador;

import ec.edu.monster.sigh.dao.DepartamentoDAO;
import ec.edu.monster.sigh.dao.DepartamentoDAO.EstadoCreacion;
import ec.edu.monster.sigh.dao.DepartamentoDAO.EstadoEdicion;
import ec.edu.monster.sigh.dao.DepartamentoDAO.EstadoEliminacion;
import ec.edu.monster.sigh.modelo.PedepDepar;
import ec.edu.monster.sigh.util.SeguridadFormulario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(urlPatterns = {"/departamentos", "/departamentos/crear", "/departamentos/editar", "/departamentos/eliminar"})
public class ControladorDepartamento extends HttpServlet {
    private static final Logger REGISTRO = Logger.getLogger(ControladorDepartamento.class.getName());
    private static final String ERROR_DEPENDENCIAS = "No se puede eliminar el departamento porque tiene personal o cargos asociados.";
    private final DepartamentoDAO departamentoDAO = new DepartamentoDAO();

    @Override
    protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {
        solicitud.setAttribute("tokenCsrf", SeguridadFormulario.token(solicitud.getSession()));
        switch (solicitud.getServletPath()) {
            case "/departamentos" -> listar(solicitud, respuesta);
            case "/departamentos/crear" -> mostrarFormulario(solicitud, respuesta, new PedepDepar("", ""), false, null);
            case "/departamentos/editar" -> cargarEdicion(solicitud, respuesta);
            default -> respuesta.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        }
    }

    @Override
    protected void doPost(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {
        if (!SeguridadFormulario.comprobar(solicitud)) {
            respuesta.sendError(HttpServletResponse.SC_FORBIDDEN, "El formulario no es válido.");
            return;
        }
        switch (solicitud.getServletPath()) {
            case "/departamentos/crear" -> crear(solicitud, respuesta);
            case "/departamentos/editar" -> editar(solicitud, respuesta);
            case "/departamentos/eliminar" -> eliminar(solicitud, respuesta);
            default -> respuesta.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        }
    }

    private void listar(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {
        HttpSession sesion = solicitud.getSession();
        solicitud.setAttribute("mensaje", sesion.getAttribute("mensajeTemporal"));
        solicitud.setAttribute("error", sesion.getAttribute("errorTemporal"));
        sesion.removeAttribute("mensajeTemporal");
        sesion.removeAttribute("errorTemporal");

        try {
            solicitud.setAttribute("departamentos", departamentoDAO.listar());
        } catch (RuntimeException ex) {
            REGISTRO.log(Level.SEVERE, "Error al consultar catálogo de departamentos", ex);
            solicitud.setAttribute("errorCarga", "No fue posible cargar los departamentos. Intente nuevamente en unos minutos.");
        }
        solicitud.getRequestDispatcher("/WEB-INF/vistas/departamentos/listar.jsp").forward(solicitud, respuesta);
    }

    private void cargarEdicion(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {
        String codigo = normalizar(solicitud.getParameter("id"));
        if (!codigoValido(codigo)) {
            respuesta.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        try {
            PedepDepar departamento = departamentoDAO.buscar(codigo);
            if (departamento == null) {
                respuesta.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
            mostrarFormulario(solicitud, respuesta, departamento, true, null);
        } catch (RuntimeException ex) {
            REGISTRO.log(Level.SEVERE, "Error al cargar edición de departamento", ex);
            mensajeTemporal(solicitud, "errorTemporal", "No fue posible cargar el departamento. Intente nuevamente en unos minutos.");
            redirigirLista(solicitud, respuesta);
        }
    }

    private void crear(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {
        PedepDepar departamento = leerDepartamento(solicitud);
        String error = validar(departamento);
        if (error != null) {
            mostrarFormulario(solicitud, respuesta, departamento, false, error);
            return;
        }
        try {
            EstadoCreacion resultado = departamentoDAO.crear(departamento);
            if (resultado == EstadoCreacion.DUPLICADO) {
                mostrarFormulario(solicitud, respuesta, departamento, false, "Ya existe un departamento con este código.");
                return;
            }
            mensajeTemporal(solicitud, "mensajeTemporal", "El departamento " + departamento.getPedepCodigo() + " se creó correctamente.");
            redirigirLista(solicitud, respuesta);
        } catch (RuntimeException ex) {
            REGISTRO.log(Level.SEVERE, "Error al crear departamento", ex);
            mostrarFormulario(solicitud, respuesta, departamento, false, "No fue posible guardar el departamento. Intente nuevamente en unos minutos.");
        }
    }

    private void editar(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {
        PedepDepar departamento = leerDepartamento(solicitud);
        String error = validar(departamento);
        String original = SeguridadFormulario.leerDescripcion(solicitud.getSession(),
                departamento.getPedepCodigo(), solicitud.getParameter("version"));
        if (original == null) {
            mensajeTemporal(solicitud, "errorTemporal", "El formulario de edición no es válido. Vuelva a abrir el departamento para continuar.");
            redirigirLista(solicitud, respuesta);
            return;
        }
        solicitud.setAttribute("versionReutilizada", solicitud.getParameter("version"));
        if (error != null) {
            mostrarFormulario(solicitud, respuesta, departamento, true, error);
            return;
        }
        try {
            EstadoEdicion resultado = departamentoDAO.editar(departamento, original);
            if (resultado == EstadoEdicion.CORRECTO) {
                mensajeTemporal(solicitud, "mensajeTemporal", "El departamento " + departamento.getPedepCodigo() + " se actualizó correctamente.");
                redirigirLista(solicitud, respuesta);
            } else if (resultado == EstadoEdicion.NO_EXISTE) {
                respuesta.sendError(HttpServletResponse.SC_NOT_FOUND);
            } else {
                PedepDepar actual = departamentoDAO.buscar(departamento.getPedepCodigo());
                if (actual != null) {
                    solicitud.setAttribute("descripcionActual", actual.getPedepDescri());
                    solicitud.setAttribute("versionReutilizada", SeguridadFormulario.version(
                            solicitud.getSession(), actual.getPedepCodigo(), actual.getPedepDescri()));
                }
                mostrarFormulario(solicitud, respuesta, departamento, true,
                        "Otro usuario modificó este departamento. Revise la descripción actual y vuelva a guardar si desea aplicar sus cambios.");
            }
        } catch (RuntimeException ex) {
            REGISTRO.log(Level.SEVERE, "Error al editar departamento", ex);
            mostrarFormulario(solicitud, respuesta, departamento, true,
                    "No fue posible actualizar el departamento. Intente nuevamente en unos minutos.");
        }
    }

    private void eliminar(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws IOException {
        String codigo = normalizar(solicitud.getParameter("id"));
        if (!codigoValido(codigo)) {
            mensajeTemporal(solicitud, "errorTemporal", "Seleccione un departamento válido para eliminar.");
            redirigirLista(solicitud, respuesta);
            return;
        }
        try {
            EstadoEliminacion resultado = departamentoDAO.eliminar(codigo);
            switch (resultado) {
                case ELIMINADO -> mensajeTemporal(solicitud, "mensajeTemporal", "El departamento " + codigo + " se eliminó correctamente.");
                case NO_EXISTE -> mensajeTemporal(solicitud, "errorTemporal", "El departamento ya no existe.");
                case TIENE_DEPENDENCIAS -> mensajeTemporal(solicitud, "errorTemporal", ERROR_DEPENDENCIAS);
            }
        } catch (RuntimeException ex) {
            REGISTRO.log(Level.SEVERE, "Error al eliminar departamento", ex);
            mensajeTemporal(solicitud, "errorTemporal", "No fue posible eliminar el departamento. Intente nuevamente en unos minutos.");
        }
        redirigirLista(solicitud, respuesta);
    }

    private void mostrarFormulario(HttpServletRequest solicitud, HttpServletResponse respuesta,
                                   PedepDepar departamento, boolean edicion, String error)
            throws ServletException, IOException {
        solicitud.setAttribute("departamento", departamento);
        solicitud.setAttribute("edicion", edicion);
        solicitud.setAttribute("error", error);
        if (edicion) {
            Object reutilizada = solicitud.getAttribute("versionReutilizada");
            String version = reutilizada instanceof String texto
                    ? texto
                    : SeguridadFormulario.version(solicitud.getSession(), departamento.getPedepCodigo(), departamento.getPedepDescri());
            solicitud.setAttribute("version", version);
        }
        solicitud.setAttribute("tokenCsrf", SeguridadFormulario.token(solicitud.getSession()));
        solicitud.getRequestDispatcher("/WEB-INF/vistas/departamentos/formulario.jsp").forward(solicitud, respuesta);
    }

    private static PedepDepar leerDepartamento(HttpServletRequest solicitud) {
        return new PedepDepar(normalizar(solicitud.getParameter("codigo")),
                normalizar(solicitud.getParameter("descripcion")));
    }

    private static String normalizar(String texto) {
        return texto == null ? "" : texto.trim().toUpperCase(Locale.ROOT);
    }

    private static boolean codigoValido(String codigo) {
        return codigo != null && codigo.length() >= 1 && codigo.length() <= 3;
    }

    private static String validar(PedepDepar departamento) {
        if (!codigoValido(departamento.getPedepCodigo())) {
            return "El código debe tener como máximo 3 caracteres.";
        }
        if (departamento.getPedepDescri().isBlank() || departamento.getPedepDescri().length() > 50) {
            return "Ingrese la descripción del departamento (máximo 50 caracteres).";
        }
        return null;
    }

    private static void mensajeTemporal(HttpServletRequest solicitud, String nombre, String mensaje) {
        solicitud.getSession().setAttribute(nombre, mensaje);
    }

    private static void redirigirLista(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws IOException {
        respuesta.sendRedirect(solicitud.getContextPath() + "/departamentos");
    }
}
