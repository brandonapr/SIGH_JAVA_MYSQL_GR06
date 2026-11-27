package ec.edu.monster.sigh.conexion;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public final class JpaUtil {
    private static final String UNIDAD_PERSISTENCIA = "SIGH_GR06_PU";
    private static final Properties CONFIG = cargarPropiedades();
    private static volatile EntityManagerFactory fabrica;

    private JpaUtil() {}

    private static Properties cargarPropiedades() {
        Properties props = new Properties();
        try (InputStream entrada = JpaUtil.class.getClassLoader().getResourceAsStream("conexion.properties")) {
            if (entrada == null) {
                throw new IllegalStateException("No se encontró conexion.properties.");
            }
            props.load(entrada);
            return props;
        } catch (IOException ex) {
            throw new IllegalStateException("No fue posible cargar conexion.properties.", ex);
        }
    }

    private static String obtenerConfig(String env, String clave) {
        String valor = System.getenv(env);
        return valor != null ? valor : CONFIG.getProperty(clave, "");
    }

    private static EntityManagerFactory obtenerFabrica() {
        if (fabrica == null) {
            synchronized (JpaUtil.class) {
                if (fabrica == null) {
                    String url = obtenerConfig("SIGH_DB_URL", "url");
                    String usuario = obtenerConfig("SIGH_DB_USUARIO", "usuario");
                    String clave = obtenerConfig("SIGH_DB_CLAVE", "clave");
                    String driver = url.startsWith("jdbc:mysql://")
                            ? "com.mysql.cj.jdbc.Driver"
                            : "org.mariadb.jdbc.Driver";

                    // Permite alternar entre MariaDB (3307) y MySQL Server (3306) sin recompilar.
                    Map<String, Object> props = new HashMap<>();
                    props.put("jakarta.persistence.jdbc.url", url);
                    props.put("jakarta.persistence.jdbc.user", usuario);
                    props.put("jakarta.persistence.jdbc.password", clave);
                    props.put("jakarta.persistence.jdbc.driver", driver);
                    fabrica = Persistence.createEntityManagerFactory(UNIDAD_PERSISTENCIA, props);
                }
            }
        }
        return fabrica;
    }

    public static EntityManager crearEntityManager() {
        return obtenerFabrica().createEntityManager();
    }

    public static boolean verificarConexion() {
        try (EntityManager em = crearEntityManager()) {
            Object res = em.createNativeQuery("SELECT 1").getSingleResult();
            return res != null;
        } catch (RuntimeException ex) {
            return false;
        }
    }

    public static synchronized void cerrar() {
        if (fabrica != null && fabrica.isOpen()) {
            fabrica.close();
            fabrica = null;
        }
    }
}
