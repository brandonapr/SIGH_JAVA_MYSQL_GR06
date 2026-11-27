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
@Table(name = "PEDEP_DEPAR")
public class PedepDepar implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "PEDEP_CODIGO", length = 3, nullable = false)
    private String pedepCodigo = "";

    @Column(name = "PEDEP_DESCRI", length = 50, nullable = false)
    private String pedepDescri = "";

    @OneToMany(mappedBy = "pedepCodigoNavigation")
    private List<PecarCargo> pecarCargos = new ArrayList<>();

    @OneToMany(mappedBy = "pedepCodigoNavigation")
    private List<PeperPerson> peperPeople = new ArrayList<>();

    public PedepDepar() {}

    public PedepDepar(String pedepCodigo, String pedepDescri) {
        this.pedepCodigo = pedepCodigo;
        this.pedepDescri = pedepDescri;
    }

    public String getPedepCodigo() {
        return pedepCodigo == null ? "" : pedepCodigo.trim();
    }

    public void setPedepCodigo(String pedepCodigo) {
        this.pedepCodigo = pedepCodigo;
    }

    public String getPedepDescri() {
        return pedepDescri == null ? "" : pedepDescri.trim();
    }

    public void setPedepDescri(String pedepDescri) {
        this.pedepDescri = pedepDescri;
    }

    public List<PecarCargo> getPecarCargos() {
        return pecarCargos;
    }

    public void setPecarCargos(List<PecarCargo> pecarCargos) {
        this.pecarCargos = pecarCargos;
    }

    public List<PeperPerson> getPeperPeople() {
        return peperPeople;
    }

    public void setPeperPeople(List<PeperPerson> peperPeople) {
        this.peperPeople = peperPeople;
    }
}
