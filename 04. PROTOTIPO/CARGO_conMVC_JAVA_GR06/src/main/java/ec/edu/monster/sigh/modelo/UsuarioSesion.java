package ec.edu.monster.sigh.modelo;

import java.io.Serializable;

public class UsuarioSesion implements Serializable {
    private final String codigo;
    private final String nombreCompleto;
    private final String rol;

    public UsuarioSesion(String codigo, String nombreCompleto, String rol) {
        this.codigo = codigo;
        this.nombreCompleto = nombreCompleto;
        this.rol = rol;
    }

    public String getCodigo() { return codigo; }
    public String getNombreCompleto() { return nombreCompleto; }
    public String getRol() { return rol; }
}
