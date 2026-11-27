package ec.edu.monster.sigh.modelo;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "PECAR_CARGO")
public class PecarCargo implements Serializable {
    private static final long serialVersionUID = 1L;

    @EmbeddedId
    private PecarCargoId id = new PecarCargoId();

    @Column(name = "PECAR_DESCRI", length = 50, nullable = false)
    private String pecarDescri = "";

    @MapsId("pedepCodigo")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "PEDEP_CODIGO", referencedColumnName = "PEDEP_CODIGO", nullable = false)
    private PedepDepar pedepCodigoNavigation;

    public PecarCargo() {}

    public PecarCargo(String pedepCodigo, String pecarCodigo, String pecarDescri) {
        this.id = new PecarCargoId(pedepCodigo, pecarCodigo);
        this.pecarDescri = pecarDescri;
    }

    public PecarCargoId getId() {
        return id;
    }

    public void setId(PecarCargoId id) {
        this.id = id;
    }

    public String getPedepCodigo() {
        return id == null ? "" : id.getPedepCodigo();
    }

    public void setPedepCodigo(String pedepCodigo) {
        if (this.id == null) this.id = new PecarCargoId();
        this.id.setPedepCodigo(pedepCodigo);
    }

    public String getPecarCodigo() {
        return id == null ? "" : id.getPecarCodigo();
    }

    public void setPecarCodigo(String pecarCodigo) {
        if (this.id == null) this.id = new PecarCargoId();
        this.id.setPecarCodigo(pecarCodigo);
    }

    public String getPecarDescri() {
        return pecarDescri == null ? "" : pecarDescri.trim();
    }

    public void setPecarDescri(String pecarDescri) {
        this.pecarDescri = pecarDescri;
    }

    public PedepDepar getPedepCodigoNavigation() {
        return pedepCodigoNavigation;
    }

    public void setPedepCodigoNavigation(PedepDepar pedepCodigoNavigation) {
        this.pedepCodigoNavigation = pedepCodigoNavigation;
    }
}
