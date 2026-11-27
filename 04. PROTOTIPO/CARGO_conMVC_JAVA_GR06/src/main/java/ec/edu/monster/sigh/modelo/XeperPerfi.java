package ec.edu.monster.sigh.modelo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "XEPER_PERFI")
public class XeperPerfi implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "XEPER_CODIGO", length = 8, nullable = false)
    private String xeperCodigo;

    @Column(name = "XEPER_DESCRI", length = 100, nullable = false)
    private String xeperDescri;

    @Lob
    @Column(name = "XEPER_OBSERV")
    private String xeperObserv;

    @OneToMany(mappedBy = "xeperCodigoNavigation")
    private List<XeuxpUsupe> xeuxpUsupes = new ArrayList<>();

    public String getXeperCodigo() { return xeperCodigo == null ? "" : xeperCodigo.trim(); }
    public void setXeperCodigo(String xeperCodigo) { this.xeperCodigo = xeperCodigo; }
    public String getXeperDescri() { return xeperDescri == null ? "" : xeperDescri.trim(); }
    public void setXeperDescri(String xeperDescri) { this.xeperDescri = xeperDescri; }
    public String getXeperObserv() { return xeperObserv; }
    public void setXeperObserv(String xeperObserv) { this.xeperObserv = xeperObserv; }
    public List<XeuxpUsupe> getXeuxpUsupes() { return xeuxpUsupes; }
    public void setXeuxpUsupes(List<XeuxpUsupe> xeuxpUsupes) { this.xeuxpUsupes = xeuxpUsupes; }
}
