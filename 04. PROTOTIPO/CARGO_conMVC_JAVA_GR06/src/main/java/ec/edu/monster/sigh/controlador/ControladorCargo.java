package ec.edu.monster.sigh.controlador;

import ec.edu.monster.sigh.dao.CargoDAO;
import ec.edu.monster.sigh.dao.CargoDAO.EstadoCreacion;
import ec.edu.monster.sigh.dao.CargoDAO.EstadoEliminacion;
import ec.edu.monster.sigh.modelo.CargosIndexViewModel;
import ec.edu.monster.sigh.modelo.PecarCargo;
import ec.edu.monster.sigh.modelo.PedepDepar;
import ec.edu.monster.sigh.util.SeguridadFormulario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(urlPatterns = {"/cargos", "/cargos/crear", "/cargos/editar", "/cargos/eliminar"})
public class ControladorCargo extends HttpServlet {
    private static final Logger REGISTRO = Logger.getLogger(ControladorCargo.class.getName());
    private static final String DEPARTAMENTO_NO_EXISTE = "El departamento seleccionado ya no existe.";
    private static final String CARGO_DUPLICADO = "Ya existe un cargo con este código en el departamento seleccionado.";
    private final CargoDAO cargoDAO = new CargoDAO();

    @Override
    protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {
        solicitud.setAttribute("tokenCsrf", SeguridadFormulario.token(solicitud.getSession()));
        switch (solicitud.getServletPath()) {
            case "/cargos" -> mostrarCatalogo(solicitud, respuesta, new PecarCargo(), false);
            case "/cargos/crear" -> mostrarFormulario(solicitud, respuesta, new PecarCargo(), false, false);
            case "/cargos/editar" -> cargarEdicion(solicitud, respuesta);
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
        solicitud.setAttribute("tokenCsrf", SeguridadFormulario.token(solicitud.getSession()));
        switch (solicitud.getServletPath()) {
            case "/cargos/crear" -> crear(solicitud, respuesta);
            case "/cargos/editar" -> editar(solicitud, respuesta);
            case "/cargos/eliminar" -> eliminar(solicitud, respuesta);
            default -> respuesta.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        }
    }

    private void cargarEdicion(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {
        String codigoDep = normalizar(solicitud.getParameter("dep"));
        String codigoCargo = normalizar(solicitud.getParameter("cargo"));
        if (!esCodigoValido(codigoDep) || !esCodigoValido(codigoCargo)) {
            respuesta.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        try {
            PecarCargo registro = cargoDAO.buscar(codigoDep, codigoCargo);
            if (registro == null) {
                respuesta.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
            mostrarFormulario(solicitud, respuesta, registro, false, true);
        } catch (RuntimeException ex) {
            REGISTRO.log(Level.SEVERE, "No se pudo cargar el cargo para su edición", ex);
            mensajeTemporal(solicitud, "errorTemporal", "No fue posible cargar el cargo. Intente nuevamente en unos minutos.");
            respuesta.sendRedirect(solicitud.getContextPath() + "/cargos");
        }
    }

    private void crear(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {
        PecarCargo cargo = leerCargo(solicitud);
        boolean desdeCatalogo = "true".equalsIgnoreCase(solicitud.getParameter("desdeCatalogo"));

        if (!normalizarYValidar(solicitud, cargo)) {
            mostrarFormulario(solicitud, respuesta, cargo, desdeCatalogo, false);
            return;
        }

        try {
            EstadoCreacion resultado = cargoDAO.crear(cargo);
            if (resultado == EstadoCreacion.DEPARTAMENTO_NO_EXISTE) {
                solicitud.setAttribute("errorDep", DEPARTAMENTO_NO_EXISTE);
                mostrarFormulario(solicitud, respuesta, cargo, desdeCatalogo, false);
                return;
            }
            if (resultado == EstadoCreacion.DUPLICADO) {
                solicitud.setAttribute("errorCodigo", CARGO_DUPLICADO);
                mostrarFormulario(solicitud, respuesta, cargo, desdeCatalogo, false);
                return;
            }

            mensajeTemporal(solicitud, "mensajeTemporal", "El cargo " + cargo.getPecarCodigo() + " se creó correctamente.");
            respuesta.sendRedirect(solicitud.getContextPath() + "/cargos");
        } catch (RuntimeException ex) {
            REGISTRO.log(Level.SEVERE, "No se pudo crear el cargo", ex);
            solicitud.setAttribute("errorGeneral", "No fue posible guardar el cargo. Intente nuevamente en unos minutos.");
            mostrarFormulario(solicitud, respuesta, cargo, desdeCatalogo, false);
        }
    }

    private void editar(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {
        PecarCargo cargo = leerCargo(solicitud);
        boolean desdeCatalogo = "true".equalsIgnoreCase(solicitud.getParameter("desdeCatalogo"));

        if (!normalizarYValidar(solicitud, cargo)) {
            mostrarFormulario(solicitud, respuesta, cargo, desdeCatalogo, true);
            return;
        }

        try {
            if (!cargoDAO.editar(cargo)) {
                respuesta.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
            mensajeTemporal(solicitud, "mensajeTemporal", "El cargo " + cargo.getPecarCodigo() + " se actualizó correctamente.");
            respuesta.sendRedirect(solicitud.getContextPath() + "/cargos");
        } catch (RuntimeException ex) {
            REGISTRO.log(Level.SEVERE, "No se pudo actualizar el cargo", ex);
            solicitud.setAttribute("errorGeneral", "No fue posible actualizar el cargo. Intente nuevamente en unos minutos.");
            mostrarFormulario(solicitud, respuesta, cargo, desdeCatalogo, true);
        }
    }

    private void eliminar(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws IOException {
        String codigoDep = normalizar(solicitud.getParameter("dep"));
        String codigoCargo = normalizar(solicitud.getParameter("cargo"));
        if (!esCodigoValido(codigoDep) || !esCodigoValido(codigoCargo)) {
            mensajeTemporal(solicitud, "errorTemporal", "Seleccione un cargo válido para eliminar.");
            respuesta.sendRedirect(solicitud.getContextPath() + "/cargos");
            return;
        }

        try {
            EstadoEliminacion resultado = cargoDAO.eliminar(codigoDep, codigoCargo);
            switch (resultado) {
                case ELIMINADO -> mensajeTemporal(solicitud, "mensajeTemporal", "El cargo " + codigoCargo + " se eliminó correctamente.");
                case NO_EXISTE -> mensajeTemporal(solicitud, "errorTemporal", "El cargo ya no existe.");
                case TIENE_DEPENDENCIAS -> mensajeTemporal(solicitud, "errorTemporal", "No se puede eliminar el cargo porque tiene personal asociado.");
            }
        } catch (RuntimeException ex) {
            REGISTRO.log(Level.SEVERE, "No se pudo eliminar el cargo", ex);
            mensajeTemporal(solicitud, "errorTemporal", "No fue posible eliminar el cargo. Intente nuevamente en unos minutos.");
        }
        respuesta.sendRedirect(solicitud.getContextPath() + "/cargos");
    }

    private void mostrarCatalogo(HttpServletRequest solicitud, HttpServletResponse respuesta,
                                 PecarCargo cargo, boolean editando)
            throws ServletException, IOException {
        HttpSession sesion = solicitud.getSession();
        solicitud.setAttribute("mensaje", sesion.getAttribute("mensajeTemporal"));
        solicitud.setAttribute("error", sesion.getAttribute("errorTemporal"));
        sesion.removeAttribute("mensajeTemporal");
        sesion.removeAttribute("errorTemporal");

        try {
            List<PecarCargo> cargos = cargoDAO.listar();
            List<PedepDepar> departamentos = cargoDAO.listarDepartamentos();
            solicitud.setAttribute("modelo", new CargosIndexViewModel(cargos, departamentos, cargo, editando));
        } catch (RuntimeException ex) {
            REGISTRO.log(Level.SEVERE, "No se pudo consultar el catálogo de cargos", ex);
            solicitud.setAttribute("errorCarga", "No fue posible cargar el catálogo de cargos. Intente nuevamente en unos minutos.");
            solicitud.setAttribute("modelo", new CargosIndexViewModel(List.of(), List.of(), cargo, editando));
        }

        solicitud.getRequestDispatcher("/WEB-INF/vistas/cargos/index.jsp").forward(solicitud, respuesta);
    }

    private void mostrarFormulario(HttpServletRequest solicitud, HttpServletResponse respuesta,
                                   PecarCargo cargo, boolean desdeCatalogo, boolean editando)
            throws ServletException, IOException {
        if (desdeCatalogo) {
            mostrarCatalogo(solicitud, respuesta, cargo, editando);
            return;
        }

        try {
            solicitud.setAttribute("departamentos", cargoDAO.listarDepartamentos());
        } catch (RuntimeException ex) {
            REGISTRO.log(Level.SEVERE, "No se pudo cargar la lista de departamentos", ex);
            solicitud.setAttribute("errorGeneral", "No fue posible cargar los departamentos. Intente nuevamente en unos minutos.");
            solicitud.setAttribute("departamentos", List.of());
        }
        solicitud.setAttribute("cargo", cargo);
        String vista = editando ? "/WEB-INF/vistas/cargos/editar.jsp" : "/WEB-INF/vistas/cargos/crear.jsp";
        solicitud.getRequestDispatcher(vista).forward(solicitud, respuesta);
    }

    private static PecarCargo leerCargo(HttpServletRequest solicitud) {
        return new PecarCargo(
                normalizar(solicitud.getParameter("PedepCodigo")),
                normalizar(solicitud.getParameter("PecarCodigo")),
                normalizar(solicitud.getParameter("PecarDescri")));
    }

    private static boolean normalizarYValidar(HttpServletRequest solicitud, PecarCargo cargo) {
        cargo.setPedepCodigo(normalizar(cargo.getPedepCodigo()));
        cargo.setPecarCodigo(normalizar(cargo.getPecarCodigo()));
        cargo.setPecarDescri(normalizar(cargo.getPecarDescri()));

        boolean valido = true;
        if (!esCodigoValido(cargo.getPedepCodigo())) {
            solicitud.setAttribute("errorDep", "Seleccione un departamento válido.");
            valido = false;
        }
        if (!esCodigoValido(cargo.getPecarCodigo())) {
            solicitud.setAttribute("errorCodigo", "Ingrese un código de cargo de 1 a 3 caracteres.");
            valido = false;
        }
        if (cargo.getPecarDescri().isEmpty() || cargo.getPecarDescri().length() > 50) {
            solicitud.setAttribute("errorDescri", "Ingrese una descripción de 1 a 50 caracteres.");
            valido = false;
        }
        return valido;
    }

    private static boolean esCodigoValido(String codigo) {
        return codigo != null && codigo.length() >= 1 && codigo.length() <= 3;
    }

    private static String normalizar(String valor) {
        return valor == null ? "" : valor.trim().toUpperCase(Locale.ROOT);
    }

    private static void mensajeTemporal(HttpServletRequest solicitud, String nombre, String mensaje) {
        solicitud.getSession().setAttribute(nombre, mensaje);
    }
}
