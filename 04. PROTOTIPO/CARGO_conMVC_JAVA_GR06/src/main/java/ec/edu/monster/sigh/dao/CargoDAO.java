package ec.edu.monster.sigh.dao;

import ec.edu.monster.sigh.conexion.JpaUtil;
import ec.edu.monster.sigh.modelo.PecarCargo;
import ec.edu.monster.sigh.modelo.PecarCargoId;
import ec.edu.monster.sigh.modelo.PedepDepar;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import java.sql.SQLException;
import java.util.List;

public class CargoDAO {
    public enum EstadoCreacion { CORRECTO, DEPARTAMENTO_NO_EXISTE, DUPLICADO }
    public enum EstadoEliminacion { ELIMINADO, NO_EXISTE, TIENE_DEPENDENCIAS }

    public List<PecarCargo> listar() {
        try (EntityManager em = JpaUtil.crearEntityManager()) {
            return em.createQuery(
                    "SELECT c FROM PecarCargo c JOIN FETCH c.pedepCodigoNavigation ORDER BY c.id.pedepCodigo, c.id.pecarCodigo",
                    PecarCargo.class)
                    .getResultList();
        }
    }

    public PecarCargo buscar(String pedepCodigo, String pecarCodigo) {
        try (EntityManager em = JpaUtil.crearEntityManager()) {
            return em.createQuery(
                    "SELECT c FROM PecarCargo c JOIN FETCH c.pedepCodigoNavigation WHERE c.id.pedepCodigo = :dep AND c.id.pecarCodigo = :cargo",
                    PecarCargo.class)
                    .setParameter("dep", pedepCodigo)
                    .setParameter("cargo", pecarCodigo)
                    .getResultStream()
                    .findFirst()
                    .orElse(null);
        }
    }

    public List<PedepDepar> listarDepartamentos() {
        try (EntityManager em = JpaUtil.crearEntityManager()) {
            return em.createQuery("SELECT d FROM PedepDepar d ORDER BY d.pedepCodigo", PedepDepar.class)
                    .getResultList();
        }
    }

    public EstadoCreacion crear(PecarCargo cargo) {
        try (EntityManager em = JpaUtil.crearEntityManager()) {
            EntityTransaction tx = em.getTransaction();
            tx.begin();
            try {
                PedepDepar depto = em.find(PedepDepar.class, cargo.getPedepCodigo());
                if (depto == null) {
                    tx.commit();
                    return EstadoCreacion.DEPARTAMENTO_NO_EXISTE;
                }

                PecarCargoId id = new PecarCargoId(cargo.getPedepCodigo(), cargo.getPecarCodigo());
                if (em.find(PecarCargo.class, id) != null) {
                    tx.commit();
                    return EstadoCreacion.DUPLICADO;
                }

                // Se enlaza la entidad padre gestionada para satisfacer @MapsId.
                PecarCargo nuevo = new PecarCargo(cargo.getPedepCodigo(), cargo.getPecarCodigo(), cargo.getPecarDescri());
                nuevo.setPedepCodigoNavigation(depto);
                em.persist(nuevo);
                tx.commit();
                return EstadoCreacion.CORRECTO;
            } catch (RuntimeException ex) {
                if (tx.isActive()) tx.rollback();
                if (esErrorSql(ex, 1062)) {
                    return EstadoCreacion.DUPLICADO;
                }
                if (esErrorSql(ex, 1452)) {
                    return EstadoCreacion.DEPARTAMENTO_NO_EXISTE;
                }
                throw ex;
            }
        }
    }

    public boolean editar(PecarCargo cargo) {
        try (EntityManager em = JpaUtil.crearEntityManager()) {
            EntityTransaction tx = em.getTransaction();
            tx.begin();
            try {
                PecarCargo actual = em.find(PecarCargo.class, new PecarCargoId(cargo.getPedepCodigo(), cargo.getPecarCodigo()));
                if (actual == null) {
                    tx.commit();
                    return false;
                }
                actual.setPecarDescri(cargo.getPecarDescri());
                tx.commit();
                return true;
            } catch (RuntimeException ex) {
                if (tx.isActive()) tx.rollback();
                throw ex;
            }
        }
    }

    public EstadoEliminacion eliminar(String pedepCodigo, String pecarCodigo) {
        try (EntityManager em = JpaUtil.crearEntityManager()) {
            EntityTransaction tx = em.getTransaction();
            tx.begin();
            try {
                PecarCargo actual = em.find(PecarCargo.class, new PecarCargoId(pedepCodigo, pecarCodigo));
                if (actual == null) {
                    tx.commit();
                    return EstadoEliminacion.NO_EXISTE;
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
