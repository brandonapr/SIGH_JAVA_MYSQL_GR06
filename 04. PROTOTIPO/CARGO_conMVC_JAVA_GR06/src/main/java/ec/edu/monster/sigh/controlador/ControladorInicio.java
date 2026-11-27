package ec.edu.monster.sigh.controlador;

import ec.edu.monster.sigh.util.SeguridadFormulario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/inicio")
public class ControladorInicio extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {
        solicitud.setAttribute("tokenCsrf", SeguridadFormulario.token(solicitud.getSession()));
        solicitud.getRequestDispatcher("/WEB-INF/vistas/inicio.jsp").forward(solicitud, respuesta);
    }
}
