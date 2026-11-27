package ec.edu.monster.sigh.modelo;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

@Embeddable
public class XeoxpOpcpeId implements Serializable {
    private static final long serialVersionUID = 1L;

    @Column(name = "XEOPC_CODIGO", length = 3, nullable = false)
    private String xeopcCodigo;

    @Column(name = "XEPER_CODIGO", length = 8, nullable = false)
    private String xeperCodigo;

    @Column(name = "XEOXP_FECASI", nullable = false)
    private LocalDate xeoxpFecasi;

    public String getXeopcCodigo() { return xeopcCodigo == null ? "" : xeopcCodigo.trim(); }
    public void setXeopcCodigo(String xeopcCodigo) { this.xeopcCodigo = xeopcCodigo; }
    public String getXeperCodigo() { return xeperCodigo == null ? "" : xeperCodigo.trim(); }
    public void setXeperCodigo(String xeperCodigo) { this.xeperCodigo = xeperCodigo; }
    public LocalDate getXeoxpFecasi() { return xeoxpFecasi; }
    public void setXeoxpFecasi(LocalDate xeoxpFecasi) { this.xeoxpFecasi = xeoxpFecasi; }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof XeoxpOpcpeId otro)) return false;
        return Objects.equals(getXeopcCodigo(), otro.getXeopcCodigo())
                && Objects.equals(getXeperCodigo(), otro.getXeperCodigo())
                && Objects.equals(xeoxpFecasi, otro.xeoxpFecasi);
    }

    @Override
    public int hashCode() {
        return Objects.hash(getXeopcCodigo(), getXeperCodigo(), xeoxpFecasi);
    }
}
