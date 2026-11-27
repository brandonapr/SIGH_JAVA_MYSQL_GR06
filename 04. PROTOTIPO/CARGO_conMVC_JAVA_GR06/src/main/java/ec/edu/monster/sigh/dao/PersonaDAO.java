package ec.edu.monster.sigh.dao;

import ec.edu.monster.sigh.conexion.JpaUtil;
import ec.edu.monster.sigh.modelo.PeperPerson;
import ec.edu.monster.sigh.modelo.PedepDepar;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.LockModeType;
import java.util.List;
import java.util.Locale;

/** Mantenimiento de PEPER_PERSON con la unidad de persistencia original de GR06. */
public class PersonaDAO {
    public enum Resultado { CORRECTO, NO_EXISTE, EMAIL_DUPLICADO, DEPARTAMENTO_INVALIDO, EN_USO, SIN_CODIGOS, CONFLICTO }

    public List<PeperPerson> listar() {
        try (EntityManager em = JpaUtil.crearEntityManager()) {
            return em.createQuery("SELECT p FROM PeperPerson p LEFT JOIN FETCH p.pedepCodigoNavigation ORDER BY p.peperCodigo", PeperPerson.class).getResultList();
        }
    }

    public static String siguienteCodigo(List<String> codigos) {
        int maximo = 0;
        for (String codigo : codigos) {
            String valor = codigo.trim().toUpperCase(Locale.ROOT);
            if (valor.matches("P[0-9]{5}")) {
                maximo = Math.max(maximo, Integer.parseInt(valor.substring(1)));
            }
        }
        return maximo >= 99999 ? "" : String.format(Locale.ROOT, "P%05d", maximo + 1);
    }

    public Resultado guardar(PeperPerson datos, String departamento, boolean nuevo) {
        try (EntityManager em = JpaUtil.crearEntityManager()) {
            EntityTransaction tx = em.getTransaction();
            tx.begin();
            try {
                PeperPerson actual = nuevo ? new PeperPerson() : em.find(PeperPerson.class, datos.getPeperCodigo(), LockModeType.PESSIMISTIC_WRITE);
                if (actual == null) { tx.rollback(); return Resultado.NO_EXISTE; }
                PedepDepar area = departamento.isEmpty() ? null : em.find(PedepDepar.class, departamento);
                if (!departamento.isEmpty() && area == null) { tx.rollback(); return Resultado.DEPARTAMENTO_INVALIDO; }
                Long repetidos = em.createQuery("SELECT COUNT(p) FROM PeperPerson p WHERE LOWER(p.peperEmail) = LOWER(:email) AND p.peperCodigo <> :codigo", Long.class)
                        .setParameter("email", datos.getPeperEmail()).setParameter("codigo", nuevo ? "" : datos.getPeperCodigo()).getSingleResult();
                if (repetidos > 0) { tx.rollback(); return Resultado.EMAIL_DUPLICADO; }
                if (nuevo) {
                    String codigo = siguienteCodigo(em.createQuery("SELECT p.peperCodigo FROM PeperPerson p", String.class).getResultList());
                    if (codigo.isEmpty()) { tx.rollback(); return Resultado.SIN_CODIGOS; }
                    actual.setPeperCodigo(codigo);
                }
                actual.setPeperApelli(datos.getPeperApelli());
                actual.setPeperNombre(datos.getPeperNombre());
                actual.setPeperEmail(datos.getPeperEmail());
                actual.setPedepCodigoNavigation(area);
                if (nuevo) em.persist(actual);
                tx.commit();
                return Resultado.CORRECTO;
            } catch (RuntimeException ex) {
                if (tx.isActive()) tx.rollback();
                if (esRestriccion(ex)) return Resultado.CONFLICTO;
                throw ex;
            }
        }
    }

    public Resultado eliminar(String codigo) {
        try (EntityManager em = JpaUtil.crearEntityManager()) {
            EntityTransaction tx = em.getTransaction();
            tx.begin();
            try {
                PeperPerson actual = em.find(PeperPerson.class, codigo, LockModeType.PESSIMISTIC_WRITE);
                if (actual == null) { tx.rollback(); return Resultado.NO_EXISTE; }
                long usuarios = em.createQuery("SELECT COUNT(u) FROM XeusuUsuar u WHERE u.peperCodigoNavigation.peperCodigo = :codigo", Long.class)
                        .setParameter("codigo", codigo).getSingleResult();
                if (usuarios > 0) { tx.rollback(); return Resultado.EN_USO; }
                em.remove(actual);
                tx.commit();
                return Resultado.CORRECTO;
            } catch (RuntimeException ex) {
                if (tx.isActive()) tx.rollback();
                if (esRestriccion(ex)) return Resultado.EN_USO;
                throw ex;
            }
        }
    }

    private boolean esRestriccion(Throwable ex) {
        for (Throwable causa = ex; causa != null; causa = causa.getCause()) {
            if (causa instanceof java.sql.SQLException sql && sql.getSQLState() != null && sql.getSQLState().startsWith("23")) return true;
        }
        return false;
    }
}
