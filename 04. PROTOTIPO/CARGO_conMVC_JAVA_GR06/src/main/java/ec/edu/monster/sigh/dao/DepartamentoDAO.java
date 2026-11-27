package ec.edu.monster.sigh.dao;

import ec.edu.monster.sigh.conexion.JpaUtil;
import ec.edu.monster.sigh.modelo.PedepDepar;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.LockModeType;
import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

public class DepartamentoDAO {
    public enum EstadoCreacion { CORRECTO, DUPLICADO }
    public enum EstadoEdicion { CORRECTO, NO_EXISTE, MODIFICADO }
    public enum EstadoEliminacion { ELIMINADO, NO_EXISTE, TIENE_DEPENDENCIAS }

    public List<PedepDepar> listar() {
        try (EntityManager em = JpaUtil.crearEntityManager()) {
            return em.createQuery("SELECT d FROM PedepDepar d ORDER BY d.pedepCodigo", PedepDepar.class)
                    .getResultList();
        }
    }

    public PedepDepar buscar(String codigo) {
        try (EntityManager em = JpaUtil.crearEntityManager()) {
            return em.find(PedepDepar.class, codigo);
        }
    }

    public EstadoCreacion crear(PedepDepar departamento) {
        try (EntityManager em = JpaUtil.crearEntityManager()) {
            EntityTransaction tx = em.getTransaction();
            tx.begin();
            try {
                if (em.find(PedepDepar.class, departamento.getPedepCodigo()) != null) {
                    tx.commit();
                    return EstadoCreacion.DUPLICADO;
                }
                em.persist(new PedepDepar(departamento.getPedepCodigo(), departamento.getPedepDescri()));
                tx.commit();
                return EstadoCreacion.CORRECTO;
            } catch (RuntimeException ex) {
                if (tx.isActive()) tx.rollback();
                if (esErrorSql(ex, 1062)) {
                    return EstadoCreacion.DUPLICADO;
                }
                throw ex;
            }
        }
    }

    public EstadoEdicion editar(PedepDepar actualizado, String descripcionOriginal) {
        try (EntityManager em = JpaUtil.crearEntityManager()) {
            EntityTransaction tx = em.getTransaction();
            tx.begin();
            try {
                // Bloqueo pesimista para validar concurrencia respecto a la versión abierta.
                PedepDepar actual = em.find(PedepDepar.class, actualizado.getPedepCodigo(), LockModeType.PESSIMISTIC_WRITE);
                if (actual == null) {
                    tx.commit();
                    return EstadoEdicion.NO_EXISTE;
                }
                if (!Objects.equals(actual.getPedepDescri(), descripcionOriginal)) {
                    tx.commit();
                    return EstadoEdicion.MODIFICADO;
                }
                actual.setPedepDescri(actualizado.getPedepDescri());
                tx.commit();
                return EstadoEdicion.CORRECTO;
            } catch (RuntimeException ex) {
                if (tx.isActive()) tx.rollback();
                throw ex;
            }
        }
    }

    public EstadoEliminacion eliminar(String codigo) {
        try (EntityManager em = JpaUtil.crearEntityManager()) {
            EntityTransaction tx = em.getTransaction();
            tx.begin();
            try {
                PedepDepar actual = em.find(PedepDepar.class, codigo, LockModeType.PESSIMISTIC_WRITE);
                if (actual == null) {
                    tx.commit();
                    return EstadoEliminacion.NO_EXISTE;
                }

                long personas = em.createQuery(
                        "SELECT COUNT(p) FROM PeperPerson p WHERE p.pedepCodigoNavigation.pedepCodigo = :cod", Long.class)
                        .setParameter("cod", codigo)
                        .getSingleResult();
                long cargos = em.createQuery(
                        "SELECT COUNT(c) FROM PecarCargo c WHERE c.id.pedepCodigo = :cod", Long.class)
                        .setParameter("cod", codigo)
                        .getSingleResult();

                if (personas > 0 || cargos > 0) {
                    tx.commit();
                    return EstadoEliminacion.TIENE_DEPENDENCIAS;
                }

                em.remove(actual);
                tx.commit();
                return EstadoEliminacion.ELIMINADO;
            } catch (RuntimeException ex) {
                if (tx.isActive()) tx.rollback();
                if (esErrorSql(ex, 1451)) {
                    return EstadoEliminacion.TIENE_DEPENDENCIAS;
                }
                throw ex;
            }
        }
    }

    private static boolean esErrorSql(Throwable ex, int codigoMySql) {
        for (Throwable actual = ex; actual != null; actual = actual.getCause()) {
            if (actual instanceof SQLException sqlEx && sqlEx.getErrorCode() == codigoMySql) {
                return true;
            }
        }
        return false;
    }
}
