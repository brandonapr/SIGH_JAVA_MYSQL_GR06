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
import java.time.LocalDate;

@Entity
@Table(name = "XEUXP_USUPE")
public class XeuxpUsupe implements Serializable {
    private static final long serialVersionUID = 1L;

    @EmbeddedId
    private XeuxpUsupeId id = new XeuxpUsupeId();

    @Column(name = "XEUXP_FECRET")
    private LocalDate xeuxpFecret;

    @MapsId("xeusuCodigo")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "XEUSU_CODIGO", nullable = false)
    private XeusuUsuar xeusuCodigoNavigation;

    @MapsId("xeperCodigo")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "XEPER_CODIGO", nullable = false)
    private XeperPerfi xeperCodigoNavigation;

    public XeuxpUsupeId getId() { return id; }
    public void setId(XeuxpUsupeId id) { this.id = id; }
    public LocalDate getXeuxpFecasi() { return id == null ? null : id.getXeuxpFecasi(); }
    public LocalDate getXeuxpFecret() { return xeuxpFecret; }
    public void setXeuxpFecret(LocalDate xeuxpFecret) { this.xeuxpFecret = xeuxpFecret; }
    public XeusuUsuar getXeusuCodigoNavigation() { return xeusuCodigoNavigation; }
    public void setXeusuCodigoNavigation(XeusuUsuar xeusuCodigoNavigation) { this.xeusuCodigoNavigation = xeusuCodigoNavigation; }
    public XeperPerfi getXeperCodigoNavigation() { return xeperCodigoNavigation; }
    public void setXeperCodigoNavigation(XeperPerfi xeperCodigoNavigation) { this.xeperCodigoNavigation = xeperCodigoNavigation; }
}
