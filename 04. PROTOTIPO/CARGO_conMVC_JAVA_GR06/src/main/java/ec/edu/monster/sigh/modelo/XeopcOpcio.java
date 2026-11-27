package ec.edu.monster.sigh.modelo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "XEOPC_OPCIO")
public class XeopcOpcio implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "XEOPC_CODIGO", length = 3, nullable = false)
    private String xeopcCodigo;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "XESIS_CODIGO", nullable = false)
    private XesisSiste xesisCodigoNavigation;

    @Column(name = "XEOPC_DESCRI", length = 100, nullable = false)
    private String xeopcDescri;

    public String getXeopcCodigo() { return xeopcCodigo == null ? "" : xeopcCodigo.trim(); }
    public void setXeopcCodigo(String xeopcCodigo) { this.xeopcCodigo = xeopcCodigo; }
    public XesisSiste getXesisCodigoNavigation() { return xesisCodigoNavigation; }
    public void setXesisCodigoNavigation(XesisSiste xesisCodigoNavigation) { this.xesisCodigoNavigation = xesisCodigoNavigation; }
    public String getXeopcDescri() { return xeopcDescri == null ? "" : xeopcDescri.trim(); }
    public void setXeopcDescri(String xeopcDescri) { this.xeopcDescri = xeopcDescri; }
}
