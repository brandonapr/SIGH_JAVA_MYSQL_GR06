package ec.edu.monster.sigh.filtro;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/*")
public class FiltroCodificacion implements Filter {
    @Override
    public void doFilter(ServletRequest solicitud, ServletResponse respuesta, FilterChain cadena)
            throws IOException, ServletException {
        solicitud.setCharacterEncoding("UTF-8");
        respuesta.setCharacterEncoding("UTF-8");
        if (respuesta instanceof HttpServletResponse http) {
            http.setHeader("X-Content-Type-Options", "nosniff");
        }
        cadena.doFilter(solicitud, respuesta);
    }
}
