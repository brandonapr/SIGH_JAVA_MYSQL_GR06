package ec.edu.monster.sigh.modelo;

public class ResultadoAcceso {
    private final UsuarioSesion usuario;
    private final String mensaje;

    private ResultadoAcceso(UsuarioSesion usuario, String mensaje) {
        this.usuario = usuario;
        this.mensaje = mensaje;
    }

    public static ResultadoAcceso correcto(UsuarioSesion usuario) {
        return new ResultadoAcceso(usuario, "");
    }

    public static ResultadoAcceso error(String mensaje) {
        return new ResultadoAcceso(null, mensaje);
    }

    public boolean isCorrecto() { return usuario != null; }
    public UsuarioSesion getUsuario() { return usuario; }
    public String getMensaje() { return mensaje; }
}
