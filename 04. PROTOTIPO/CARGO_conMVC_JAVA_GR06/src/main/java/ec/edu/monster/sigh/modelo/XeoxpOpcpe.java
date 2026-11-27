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
@Table(name = "XEOXP_OPCPE")
public class XeoxpOpcpe implements Serializable {
    private static final long serialVersionUID = 1L;

    @EmbeddedId
    private XeoxpOpcpeId id = new XeoxpOpcpeId();

    @Column(name = "XEOXP_FECRET")
    private LocalDate xeoxpFecret;

    @MapsId("xeopcCodigo")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "XEOPC_CODIGO", nullable = false)
    private XeopcOpcio xeopcCodigoNavigation;

    @MapsId("xeperCodigo")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "XEPER_CODIGO", nullable = false)
    private XeperPerfi xeperCodigoNavigation;

    public XeoxpOpcpeId getId() { return id; }
    public void setId(XeoxpOpcpeId id) { this.id = id; }
    public LocalDate getXeoxpFecret() { return xeoxpFecret; }
    public void setXeoxpFecret(LocalDate xeoxpFecret) { this.xeoxpFecret = xeoxpFecret; }
    public XeopcOpcio getXeopcCodigoNavigation() { return xeopcCodigoNavigation; }
    public void setXeopcCodigoNavigation(XeopcOpcio xeopcCodigoNavigation) { this.xeopcCodigoNavigation = xeopcCodigoNavigation; }
    public XeperPerfi getXeperCodigoNavigation() { return xeperCodigoNavigation; }
    public void setXeperCodigoNavigation(XeperPerfi xeperCodigoNavigation) { this.xeperCodigoNavigation = xeperCodigoNavigation; }
}
