package ec.edu.monster.sigh.util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Base64;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

/** Token CSRF de sesión y comprobación firmada de versión de edición. */
public final class SeguridadFormulario {
    private static final SecureRandom ALEATORIO = new SecureRandom();
    private SeguridadFormulario() {}

    private static byte[] llave(HttpSession sesion) {
        byte[] clave = (byte[]) sesion.getAttribute("llaveFormulario");
        if (clave == null) {
            synchronized (sesion) {
                clave = (byte[]) sesion.getAttribute("llaveFormulario");
                if (clave == null) {
                    clave = new byte[32];
                    ALEATORIO.nextBytes(clave);
                    sesion.setAttribute("llaveFormulario", clave);
                }
            }
        }
        return clave;
    }

    private static String firmar(HttpSession sesion, String texto) {
        try {
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(new SecretKeySpec(llave(sesion), "HmacSHA256"));
            return Base64.getUrlEncoder().withoutPadding().encodeToString(
                    mac.doFinal(texto.getBytes(StandardCharsets.UTF_8)));
        } catch (Exception ex) {
            throw new IllegalStateException("No fue posible proteger el formulario", ex);
        }
    }

    public static String token(HttpSession sesion) {
        return firmar(sesion, "SIGH-CSRF");
    }

    public static boolean comprobar(HttpServletRequest solicitud) {
        HttpSession sesion = solicitud.getSession(false);
        String recibido = solicitud.getParameter("tokenCsrf");
        return sesion != null && recibido != null && MessageDigest.isEqual(
                token(sesion).getBytes(StandardCharsets.UTF_8),
                recibido.getBytes(StandardCharsets.UTF_8));
    }

    public static String version(HttpSession sesion, String codigo, String descripcion) {
        String datos = Base64.getUrlEncoder().withoutPadding().encodeToString(
                descripcion.getBytes(StandardCharsets.UTF_8));
        return datos + "." + firmar(sesion, codigo + ":" + datos);
    }

    public static String leerDescripcion(HttpSession sesion, String codigo, String version) {
        if (sesion == null || version == null || version.length() > 400) return null;
        int separador = version.lastIndexOf('.');
        if (separador <= 0) return null;
        String datos = version.substring(0, separador);
        String firma = version.substring(separador + 1);
        if (!MessageDigest.isEqual(firmar(sesion, codigo + ":" + datos).getBytes(StandardCharsets.UTF_8),
                firma.getBytes(StandardCharsets.UTF_8))) return null;
        try {
            return new String(Base64.getUrlDecoder().decode(datos), StandardCharsets.UTF_8);
        } catch (IllegalArgumentException ex) {
            return null;
        }
    }
}
