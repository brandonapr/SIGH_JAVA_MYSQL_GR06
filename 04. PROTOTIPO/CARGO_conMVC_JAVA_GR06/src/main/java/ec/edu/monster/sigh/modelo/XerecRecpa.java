package ec.edu.monster.sigh.modelo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "XEREC_RECPAS")
public class XerecRecpa implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "XEREC_CODIGO", nullable = false)
    private Long xerecCodigo;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "XEUSU_CODIGO", nullable = false)
    private XeusuUsuar xeusuCodigoNavigation;

    @Column(name = "XEREC_TOKEN", length = 64, nullable = false, unique = true)
    private String xerecToken;

    @Column(name = "XEREC_FECEXP", nullable = false)
    private LocalDateTime xerecFecexp;

    @Column(name = "XEREC_USADO", nullable = false)
    private boolean xerecUsado;

    @Column(name = "XEREC_FECCRE", nullable = false)
    private LocalDateTime xerecFeccre;

    public Long getXerecCodigo() { return xerecCodigo; }
    public void setXerecCodigo(Long xerecCodigo) { this.xerecCodigo = xerecCodigo; }
    public XeusuUsuar getXeusuCodigoNavigation() { return xeusuCodigoNavigation; }
    public void setXeusuCodigoNavigation(XeusuUsuar xeusuCodigoNavigation) { this.xeusuCodigoNavigation = xeusuCodigoNavigation; }
    public String getXerecToken() { return xerecToken; }
    public void setXerecToken(String xerecToken) { this.xerecToken = xerecToken; }
    public LocalDateTime getXerecFecexp() { return xerecFecexp; }
    public void setXerecFecexp(LocalDateTime xerecFecexp) { this.xerecFecexp = xerecFecexp; }
    public boolean isXerecUsado() { return xerecUsado; }
    public void setXerecUsado(boolean xerecUsado) { this.xerecUsado = xerecUsado; }
    public LocalDateTime getXerecFeccre() { return xerecFeccre; }
    public void setXerecFeccre(LocalDateTime xerecFeccre) { this.xerecFeccre = xerecFeccre; }
}
