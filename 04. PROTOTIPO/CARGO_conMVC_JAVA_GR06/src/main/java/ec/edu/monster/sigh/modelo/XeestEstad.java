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
@Table(name = "XEEST_ESTAD")
public class XeestEstad implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "XEEST_CODIGO", length = 1, nullable = false)
    private String xeestCodigo;

    @Column(name = "XEEST_DESCRI", length = 50, nullable = false)
    private String xeestDescri;

    @OneToMany(mappedBy = "xeestCodigoNavigation")
    private List<XeusuUsuar> xeusuUsuars = new ArrayList<>();

    public String getXeestCodigo() { return xeestCodigo == null ? "" : xeestCodigo.trim(); }
    public void setXeestCodigo(String xeestCodigo) { this.xeestCodigo = xeestCodigo; }
    public String getXeestDescri() { return xeestDescri == null ? "" : xeestDescri.trim(); }
    public void setXeestDescri(String xeestDescri) { this.xeestDescri = xeestDescri; }
    public List<XeusuUsuar> getXeusuUsuars() { return xeusuUsuars; }
    public void setXeusuUsuars(List<XeusuUsuar> xeusuUsuars) { this.xeusuUsuars = xeusuUsuars; }
}
