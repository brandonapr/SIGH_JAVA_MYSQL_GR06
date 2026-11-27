package ec.edu.monster.sigh.dao;

import ec.edu.monster.sigh.conexion.JpaUtil;
import ec.edu.monster.sigh.modelo.PeperPerson;
import ec.edu.monster.sigh.modelo.ResultadoAcceso;
import ec.edu.monster.sigh.modelo.UsuarioSesion;
import ec.edu.monster.sigh.modelo.XeusuUsuar;
import ec.edu.monster.sigh.modelo.XeuxpUsupe;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.LockModeType;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public class UsuarioDAO {

    public ResultadoAcceso ingresar(String codigo, String clave) {
        if (codigo == null || clave == null) {
            return ResultadoAcceso.error("Revise los datos de acceso e ingrese los campos requeridos.");
        }

        try (EntityManager em = JpaUtil.crearEntityManager()) {
            EntityTransaction tx = em.getTransaction();
            tx.begin();
            try {
                XeusuUsuar usuario = em.find(XeusuUsuar.class, codigo, LockModeType.PESSIMISTIC_WRITE);
                if (usuario == null) {
                    tx.commit();
                    return ResultadoAcceso.error("El usuario ingresado no existe. Verifique sus datos.");
                }

                String estado = usuario.getXeestCodigo();
                if ("B".equals(estado)) {
                    tx.commit();
                    return ResultadoAcceso.error("La cuenta está bloqueada por exceso de intentos fallidos. Comuníquese con el administrador.");
                }
                if ("I".equals(estado)) {
                    tx.commit();
                    return ResultadoAcceso.error("La cuenta está inactiva. Comuníquese con el administrador.");
                }
                if (!"A".equals(estado)) {
                    tx.commit();
                    return ResultadoAcceso.error("La cuenta no está habilitada para iniciar sesión. Comuníquese con el administrador.");
                }

                boolean claveCorrecta = MessageDigest.isEqual(
                        usuario.getXeusuPasswo().getBytes(StandardCharsets.UTF_8),
                        clave.getBytes(StandardCharsets.UTF_8));

                if (!claveCorrecta) {
                    int intentos = Math.min(3, usuario.getXeusuIntfal() + 1);
                    usuario.setXeusuIntfal(intentos);
                    usuario.setXeestCodigo(intentos >= 3 ? "B" : "A");
                    usuario.setXeusuFecmod(LocalDateTime.now());
                    tx.commit();

                    if (intentos >= 3) {
                        return ResultadoAcceso.error("La cuenta ha sido bloqueada tras tres intentos fallidos consecutivos. Comuníquese con el administrador.");
                    }
                    int restantes = Math.max(0, 3 - intentos);
                    String mensaje = restantes == 1
                            ? "Contraseña incorrecta. Le queda 1 intento antes del bloqueo."
                            : "Contraseña incorrecta. Le quedan " + restantes + " intentos antes del bloqueo.";
                    return ResultadoAcceso.error(mensaje);
                }

                usuario.setXeusuIntfal(0);
                usuario.setXeusuFecmod(LocalDateTime.now());

                LocalDate hoy = LocalDate.now();
                List<String> perfiles = usuario.getXeuxpUsupes().stream()
                        .filter(asig -> !asig.getXeuxpFecasi().isAfter(hoy)
                                && (asig.getXeuxpFecret() == null || !asig.getXeuxpFecret().isBefore(hoy)))
                        .map(XeuxpUsupe::getXeperCodigoNavigation)
                        .map(perfil -> perfil.getXeperDescri().isBlank() ? perfil.getXeperCodigo() : perfil.getXeperDescri())
                        .filter(nombre -> !nombre.isBlank())
                        .distinct()
                        .sorted(String::compareToIgnoreCase)
                        .toList();

                PeperPerson persona = usuario.getPeperCodigoNavigation();
                String nombre = (persona.getPeperNombre() + " " + persona.getPeperApelli()).trim();
                String rol = perfiles.isEmpty() ? "Sin perfil asignado" : String.join(", ", perfiles);

                tx.commit();
                return ResultadoAcceso.correcto(new UsuarioSesion(
                        usuario.getXeusuCodigo(),
                        nombre.isBlank() ? usuario.getXeusuCodigo() : nombre,
                        rol));
            } catch (RuntimeException ex) {
                if (tx.isActive()) tx.rollback();
                throw ex;
            }
        }
    }

    public List<XeusuUsuar> listarConPersona() {
        try (EntityManager em = JpaUtil.crearEntityManager()) {
            return em.createQuery(
                    "SELECT u FROM XeusuUsuar u JOIN FETCH u.peperCodigoNavigation ORDER BY u.xeusuCodigo",
                    XeusuUsuar.class)
                    .getResultList();
        }
    }
}
