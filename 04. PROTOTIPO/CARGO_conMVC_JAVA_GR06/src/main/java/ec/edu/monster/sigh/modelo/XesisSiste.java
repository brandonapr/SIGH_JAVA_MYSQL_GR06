package ec.edu.monster.sigh.modelo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "XESIS_SISTE")
public class XesisSiste implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "XESIS_CODIGO", length = 2, nullable = false)
    private String xesisCodigo;

    @Column(name = "XESIS_DESCRI", length = 50, nullable = false)
    private String xesisDescri;

    @OneToMany(mappedBy = "xesisCodigoNavigation")
    private List<XeopcOpcio> xeopcOpcios = new ArrayList<>();

    public String getXesisCodigo() { return xesisCodigo == null ? "" : xesisCodigo.trim(); }
    public void setXesisCodigo(String xesisCodigo) { this.xesisCodigo = xesisCodigo; }
    public String getXesisDescri() { return xesisDescri == null ? "" : xesisDescri.trim(); }
    public void setXesisDescri(String xesisDescri) { this.xesisDescri = xesisDescri; }
    public List<XeopcOpcio> getXeopcOpcios() { return xeopcOpcios; }
    public void setXeopcOpcios(List<XeopcOpcio> xeopcOpcios) { this.xeopcOpcios = xeopcOpcios; }
}
