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
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "PEPER_PERSON")
public class PeperPerson implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "PEPER_CODIGO", length = 6, nullable = false)
    private String peperCodigo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PEDEP_CODIGO")
    private PedepDepar pedepCodigoNavigation;

    @Column(name = "PEPER_APELLI", length = 50, nullable = false)
    private String peperApelli;

    @Column(name = "PEPER_NOMBRE", length = 50, nullable = false)
    private String peperNombre;

    @Column(name = "PEPER_EMAIL", length = 100, nullable = false, unique = true)
    private String peperEmail;

    @OneToMany(mappedBy = "peperCodigoNavigation")
    private List<XeusuUsuar> xeusuUsuars = new ArrayList<>();

    public String getPeperCodigo() { return peperCodigo == null ? "" : peperCodigo.trim(); }
    public void setPeperCodigo(String peperCodigo) { this.peperCodigo = peperCodigo; }
    public PedepDepar getPedepCodigoNavigation() { return pedepCodigoNavigation; }
    public void setPedepCodigoNavigation(PedepDepar pedepCodigoNavigation) { this.pedepCodigoNavigation = pedepCodigoNavigation; }
    public String getPeperApelli() { return peperApelli == null ? "" : peperApelli.trim(); }
    public void setPeperApelli(String peperApelli) { this.peperApelli = peperApelli; }
    public String getPeperNombre() { return peperNombre == null ? "" : peperNombre.trim(); }
    public void setPeperNombre(String peperNombre) { this.peperNombre = peperNombre; }
    public String getPeperEmail() { return peperEmail == null ? "" : peperEmail.trim(); }
    public void setPeperEmail(String peperEmail) { this.peperEmail = peperEmail; }
    public List<XeusuUsuar> getXeusuUsuars() { return xeusuUsuars; }
    public void setXeusuUsuars(List<XeusuUsuar> xeusuUsuars) { this.xeusuUsuars = xeusuUsuars; }
}
