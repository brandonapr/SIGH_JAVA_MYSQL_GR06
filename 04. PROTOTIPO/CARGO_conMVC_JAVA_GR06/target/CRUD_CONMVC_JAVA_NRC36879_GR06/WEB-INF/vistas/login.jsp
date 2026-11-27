<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="color-scheme" content="light"><meta name="theme-color" content="#132f3b">
  <title>Iniciar sesión | Monster Salud · SIGH_GR06</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site.css">
  <script src="${pageContext.request.contextPath}/js/site.js" defer></script>
</head>
<body class="auth-page">
  <a class="skip-link" href="#login-form">Ir al formulario de acceso</a>
  <header class="masthead">
    <div class="brand" aria-label="Hospital General Monster Salud">
      <span class="brand-mark" aria-hidden="true"><svg viewBox="0 0 32 32" fill="none"><path d="M12 5h8v7h7v8h-7v7h-8v-7H5v-8h7V5Z" fill="currentColor" /></svg></span>
      <span class="brand-name">Monster Salud<span>Hospital General</span></span>
    </div>
    <span class="masthead-label">Sistema Integral de Gestión Hospitalaria</span>
  </header>
  <main class="auth-main">
    <section class="auth-shell" aria-labelledby="login-heading">
      <div class="auth-intro">
        <div class="intro-top"><span class="eyebrow">PLATAFORMA INSTITUCIONAL</span><span class="system-id">SIGH_GR06</span></div>
        <div class="intro-content">
          <div class="intro-emblem" aria-hidden="true"><svg viewBox="0 0 80 80" fill="none"><rect x="1" y="1" width="78" height="78" rx="23" stroke="currentColor" stroke-opacity=".35"/><path d="M31 18h18v13h13v18H49v13H31V49H18V31h13V18Z" fill="currentColor" /></svg></div>
          <h1 id="login-heading">Acceso al sistema<br>hospitalario.</h1>
          <p>Un espacio de trabajo para el personal de Hospital General Monster Salud.</p>
        </div>
        <div class="intro-bottom"><span class="small-line" aria-hidden="true"></span><p>Gestión de personal y seguridad<br><strong>Grupo 06 · Desarrollo Web Avanzado</strong></p></div>
      </div>
      <div class="auth-card">
        <div class="form-heading"><span class="eyebrow">BIENVENIDO</span><h2>Iniciar sesión</h2><p>Ingrese sus credenciales institucionales para continuar.</p></div>
        <c:if test="${not empty error}">
          <div class="alert-error" role="alert" tabindex="-1" data-login-error>
            <svg viewBox="0 0 24 24" fill="none" aria-hidden="true"><circle cx="12" cy="12" r="9" stroke="currentColor" stroke-width="1.7"/><path d="M12 7v6m0 3v.1" stroke="currentColor" stroke-width="1.7" stroke-linecap="round"/></svg>
            <p><c:out value="${error}"/></p>
          </div>
        </c:if>
        <form id="login-form" action="${pageContext.request.contextPath}/login" method="post" data-login-form>
          <input type="hidden" name="tokenCsrf" value="<c:out value='${tokenCsrf}'/>">
          <div class="field-group">
            <label for="usuarioLogin">Código de usuario</label>
            <div class="input-wrap"><svg viewBox="0 0 24 24" fill="none" aria-hidden="true"><circle cx="12" cy="8" r="3.5" stroke="currentColor" stroke-width="1.6"/><path d="M5 20v-2a7 7 0 0 1 14 0v2" stroke="currentColor" stroke-width="1.6" stroke-linecap="round"/></svg>
              <input id="usuarioLogin" name="usuarioLogin" type="text" maxlength="20" required autocomplete="username" autocapitalize="none" spellcheck="false" value="<c:out value='${usuarioIngresado}'/>" aria-describedby="usuario-help" placeholder="Ingrese su código">
            </div>
            <p id="usuario-help" class="field-hint">Utilice el código asignado a su cuenta.</p>
          </div>
          <div class="field-group">
            <label for="Clave">Contraseña</label>
            <div class="input-wrap password-wrap"><svg viewBox="0 0 24 24" fill="none" aria-hidden="true"><rect x="5" y="10" width="14" height="11" rx="2" stroke="currentColor" stroke-width="1.6"/><path d="M8 10V7a4 4 0 0 1 8 0v3" stroke="currentColor" stroke-width="1.6" stroke-linecap="round"/></svg>
              <input id="Clave" name="clave" type="password" maxlength="256" autocomplete="current-password" required placeholder="Ingrese su contraseña">
              <button class="password-toggle" type="button" aria-label="Mostrar contraseña" aria-controls="Clave" aria-pressed="false" data-password-toggle>
                <svg class="eye-open" viewBox="0 0 24 24" fill="none" aria-hidden="true"><path d="M2 12s3.5-7 10-7 10 7 10 7-3.5 7-10 7S2 12 2 12Z" stroke="currentColor" stroke-width="1.6"/><circle cx="12" cy="12" r="3" stroke="currentColor" stroke-width="1.6"/></svg>
                <svg class="eye-closed" viewBox="0 0 24 24" fill="none" aria-hidden="true"><path d="m3 3 18 18M10.6 5.1A12 12 0 0 1 12 5c6.5 0 10 7 10 7a18 18 0 0 1-4.1 4.8M6.2 6.2A20 20 0 0 0 2 12s3.5 7 10 7c1.8 0 3.4-.5 4.7-1.3M10 10a3 3 0 0 0 4.2 4.2" stroke="currentColor" stroke-width="1.6" stroke-linecap="round"/></svg>
              </button>
            </div>
          </div>
          <button class="button button-primary login-submit" type="submit" data-submit-button><span data-submit-label>Ingresar al sistema</span><svg viewBox="0 0 24 24" fill="none" aria-hidden="true"><path d="M5 12h14m-5-5 5 5-5 5" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/></svg></button>
        </form>
        <div class="access-note"><svg viewBox="0 0 24 24" fill="none" aria-hidden="true"><path d="m12 3 8 3v6c0 4-4 7-8 9-4-2-8-5-8-9V6l8-3Z" stroke="currentColor" stroke-width="1.6"/><path d="m8.5 12 2.5 2.5 4.5-5" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"/></svg><p>Acceso exclusivo para personal autorizado.<br>Proteja sus credenciales de acceso.</p></div>
      </div>
    </section>
  </main>
  <%@ include file="fragmentos/pie.jspf" %>
</body>
</html>
