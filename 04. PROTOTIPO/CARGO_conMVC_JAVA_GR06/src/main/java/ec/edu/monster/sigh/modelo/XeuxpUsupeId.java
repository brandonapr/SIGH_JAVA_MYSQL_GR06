package ec.edu.monster.sigh.modelo;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

@Embeddable
public class XeuxpUsupeId implements Serializable {
    private static final long serialVersionUID = 1L;

    @Column(name = "XEUSU_CODIGO", length = 20, nullable = false)
    private String xeusuCodigo;

    @Column(name = "XEPER_CODIGO", length = 8, nullable = false)
    private String xeperCodigo;

    @Column(name = "XEUXP_FECASI", nullable = false)
    private LocalDate xeuxpFecasi;

    public XeuxpUsupeId() {}

    public String getXeusuCodigo() { return xeusuCodigo == null ? "" : xeusuCodigo.trim(); }
    public void setXeusuCodigo(String xeusuCodigo) { this.xeusuCodigo = xeusuCodigo; }
    public String getXeperCodigo() { return xeperCodigo == null ? "" : xeperCodigo.trim(); }
    public void setXeperCodigo(String xeperCodigo) { this.xeperCodigo = xeperCodigo; }
    public LocalDate getXeuxpFecasi() { return xeuxpFecasi; }
    public void setXeuxpFecasi(LocalDate xeuxpFecasi) { this.xeuxpFecasi = xeuxpFecasi; }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof XeuxpUsupeId otro)) return false;
        return Objects.equals(getXeusuCodigo(), otro.getXeusuCodigo())
                && Objects.equals(getXeperCodigo(), otro.getXeperCodigo())
                && Objects.equals(xeuxpFecasi, otro.xeuxpFecasi);
    }

    @Override
    public int hashCode() {
        return Objects.hash(getXeusuCodigo(), getXeperCodigo(), xeuxpFecasi);
    }
}
