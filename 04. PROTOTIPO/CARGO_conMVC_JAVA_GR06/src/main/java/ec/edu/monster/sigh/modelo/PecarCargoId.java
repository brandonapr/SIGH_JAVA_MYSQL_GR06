package ec.edu.monster.sigh.modelo;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class PecarCargoId implements Serializable {
    private static final long serialVersionUID = 1L;

    @Column(name = "PEDEP_CODIGO", length = 3, nullable = false)
    private String pedepCodigo = "";

    @Column(name = "PECAR_CODIGO", length = 3, nullable = false)
    private String pecarCodigo = "";

    public PecarCargoId() {}

    public PecarCargoId(String pedepCodigo, String pecarCodigo) {
        this.pedepCodigo = pedepCodigo;
        this.pecarCodigo = pecarCodigo;
    }

    public String getPedepCodigo() {
        return pedepCodigo == null ? "" : pedepCodigo.trim();
    }

    public void setPedepCodigo(String pedepCodigo) {
        this.pedepCodigo = pedepCodigo;
    }

    public String getPecarCodigo() {
        return pecarCodigo == null ? "" : pecarCodigo.trim();
    }

    public void setPecarCodigo(String pecarCodigo) {
        this.pecarCodigo = pecarCodigo;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof PecarCargoId otro)) return false;
        return Objects.equals(getPedepCodigo(), otro.getPedepCodigo())
                && Objects.equals(getPecarCodigo(), otro.getPecarCodigo());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getPedepCodigo(), getPecarCodigo());
    }
}
