package ec.edu.monster.sigh.filtro;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {
    "/inicio",
    "/departamentos", "/departamentos/*",
    "/cargos", "/cargos/*",
    "/api/TestOrm/usuarios", "/api/TestOrm/departamentos"
})
public class FiltroSesion implements Filter {
    @Override
    public void doFilter(ServletRequest solicitud, ServletResponse respuesta, FilterChain cadena)
            throws IOException, ServletException {
        HttpServletRequest peticion = (HttpServletRequest) solicitud;
        HttpServletResponse salida = (HttpServletResponse) respuesta;
        salida.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        salida.setHeader("Pragma", "no-cache");

        HttpSession sesion = peticion.getSession(false);
        if (sesion == null || sesion.getAttribute("usuarioSesion") == null) {
            if (peticion.getServletPath().startsWith("/api/")) {
                salida.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            } else {
                salida.sendRedirect(peticion.getContextPath() + "/login");
            }
            return;
        }
        cadena.doFilter(solicitud, respuesta);
    }
}
