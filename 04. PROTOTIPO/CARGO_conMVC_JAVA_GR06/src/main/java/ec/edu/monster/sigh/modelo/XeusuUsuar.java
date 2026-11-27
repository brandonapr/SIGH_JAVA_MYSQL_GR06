package ec.edu.monster.sigh.modelo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "XEUSU_USUAR")
public class XeusuUsuar implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "XEUSU_CODIGO", length = 20, nullable = false)
    private String xeusuCodigo;

    @Column(name = "XEEST_CODIGO", length = 1, nullable = false)
    private String xeestCodigo;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "XEEST_CODIGO", insertable = false, updatable = false)
    private XeestEstad xeestCodigoNavigation;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "PEPER_CODIGO", nullable = false)
    private PeperPerson peperCodigoNavigation;

    @Column(name = "XEUSU_PASSWO", length = 256, nullable = false)
    private String xeusuPasswo;

    @Column(name = "XEUSU_FECCRE", nullable = false)
    private LocalDateTime xeusuFeccre;

    @Column(name = "XEUSU_FECMOD")
    private LocalDateTime xeusuFecmod;

    @Column(name = "XEUSU_INTFAL", nullable = false)
    private int xeusuIntfal;

    @OneToMany(mappedBy = "xeusuCodigoNavigation")
    private List<XeuxpUsupe> xeuxpUsupes = new ArrayList<>();

    public String getXeusuCodigo() { return xeusuCodigo == null ? "" : xeusuCodigo.trim(); }
    public void setXeusuCodigo(String xeusuCodigo) { this.xeusuCodigo = xeusuCodigo; }
    public String getXeestCodigo() { return xeestCodigo == null ? "" : xeestCodigo.trim(); }
    public void setXeestCodigo(String xeestCodigo) { this.xeestCodigo = xeestCodigo; }
    public XeestEstad getXeestCodigoNavigation() { return xeestCodigoNavigation; }
    public void setXeestCodigoNavigation(XeestEstad xeestCodigoNavigation) { this.xeestCodigoNavigation = xeestCodigoNavigation; }
    public PeperPerson getPeperCodigoNavigation() { return peperCodigoNavigation; }
    public void setPeperCodigoNavigation(PeperPerson peperCodigoNavigation) { this.peperCodigoNavigation = peperCodigoNavigation; }
    public String getXeusuPasswo() { return xeusuPasswo; }
    public void setXeusuPasswo(String xeusuPasswo) { this.xeusuPasswo = xeusuPasswo; }
    public LocalDateTime getXeusuFeccre() { return xeusuFeccre; }
    public void setXeusuFeccre(LocalDateTime xeusuFeccre) { this.xeusuFeccre = xeusuFeccre; }
    public LocalDateTime getXeusuFecmod() { return xeusuFecmod; }
    public void setXeusuFecmod(LocalDateTime xeusuFecmod) { this.xeusuFecmod = xeusuFecmod; }
    public int getXeusuIntfal() { return xeusuIntfal; }
    public void setXeusuIntfal(int xeusuIntfal) { this.xeusuIntfal = xeusuIntfal; }
    public List<XeuxpUsupe> getXeuxpUsupes() { return xeuxpUsupes; }
    public void setXeuxpUsupes(List<XeuxpUsupe> xeuxpUsupes) { this.xeuxpUsupes = xeuxpUsupes; }
}
