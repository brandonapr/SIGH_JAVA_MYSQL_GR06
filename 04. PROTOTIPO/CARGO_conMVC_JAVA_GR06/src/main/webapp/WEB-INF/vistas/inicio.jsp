<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="color-scheme" content="light"><meta name="theme-color" content="#132f3b">
  <title>Bienvenido | Monster Salud · SIGH_GR06</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/departamentos.css">
  <script src="${pageContext.request.contextPath}/js/site.js" defer></script>
</head>
<body class="welcome-page">
  <a class="skip-link" href="#contenido">Ir al contenido principal</a>
  <%@ include file="fragmentos/cabecera.jspf" %>
  <main id="contenido" class="welcome-main">
    <div class="welcome-overline"><span class="eyebrow">SISTEMA INTEGRAL DE GESTIÓN HOSPITALARIA</span><span class="session-badge"><span aria-hidden="true"></span>Sesión activa</span></div>
    <section class="welcome-panel" aria-labelledby="welcome-heading">
      <div class="welcome-copy"><span class="eyebrow">ACCESO CONFIRMADO</span><h1 id="welcome-heading">Bienvenido,<br><span><c:out value="${sessionScope.usuarioSesion.nombreCompleto}"/></span></h1><p>Ha iniciado sesión en Hospital General Monster Salud. Su cuenta está lista para trabajar en el sistema SIGH_GR06.</p><div class="online-label"><span aria-hidden="true"></span>En línea</div></div>
      <div class="identity-card"><div class="identity-icon" aria-hidden="true"><svg viewBox="0 0 48 48" fill="none"><circle cx="24" cy="17" r="8" stroke="currentColor" stroke-width="2"/><path d="M9 42v-4a15 15 0 0 1 30 0v4" stroke="currentColor" stroke-width="2" stroke-linecap="round"/></svg></div><h2>Datos de su sesión</h2><dl><div><dt>Código de usuario</dt><dd><c:out value="${sessionScope.usuarioSesion.codigo}"/></dd></div><div><dt>Personal</dt><dd><c:out value="${sessionScope.usuarioSesion.nombreCompleto}"/></dd></div><div><dt>Rol o perfil</dt><dd><c:out value="${sessionScope.usuarioSesion.rol}"/></dd></div></dl></div>
    </section>
    <a class="dept-nav-card" href="${pageContext.request.contextPath}/departamentos"><span class="dept-nav-icon" aria-hidden="true"><svg viewBox="0 0 32 32" fill="none"><path d="M7 28V6h18v22M3 28h26M12 28v-7h8v7M12 11h2m4 0h2m-8 5h2m4 0h2" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg></span><div class="dept-nav-copy"><span class="eyebrow">GESTIÓN DE PERSONAL</span><h2>Gestionar Departamentos Hospitalarios (PEDEP_DEPAR)</h2><p>Crear, consultar, actualizar y eliminar áreas del hospital.</p></div><svg class="dept-nav-arrow" viewBox="0 0 24 24" fill="none" aria-hidden="true"><path d="M5 12h14m-5-5 5 5-5 5" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round"/></svg></a>
    <a class="dept-nav-card" href="${pageContext.request.contextPath}/cargos">
      <span class="dept-nav-icon" aria-hidden="true">
        <svg viewBox="0 0 32 32" fill="none">
          <path d="M5 10h22a2 2 0 0 1 2 2v13a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V12a2 2 0 0 1 2-2Zm6 0V7a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v3M3 17a40 40 0 0 0 26 0M14 19v2h4v-2" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
        </svg>
      </span>
      <div class="dept-nav-copy">
        <h2>Mantenimiento de Cargos (PECAR_CARGO)</h2>
      </div>
      <svg class="dept-nav-arrow" viewBox="0 0 24 24" fill="none" aria-hidden="true">
        <path d="M5 12h14m-5-5 5 5-5 5" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round" />
      </svg>
    </a>
    <a class="dept-nav-card" href="${pageContext.request.contextPath}/persona">
      <span class="dept-nav-icon" aria-hidden="true"><svg viewBox="0 0 32 32" fill="none"><circle cx="16" cy="10" r="5" stroke="currentColor" stroke-width="1.7"/><path d="M6 28v-3a10 10 0 0 1 20 0v3H6Z" stroke="currentColor" stroke-width="1.7" stroke-linejoin="round"/></svg></span>
      <div class="dept-nav-copy"><span class="eyebrow">GESTIÓN DE PERSONAL</span><h2>Mantenimiento de Personal (PEPER_PERSON)</h2><p>Registrar y consultar personal mediante pestañas de datos laborales y contacto.</p></div>
      <svg class="dept-nav-arrow" viewBox="0 0 24 24" fill="none" aria-hidden="true"><path d="M5 12h14m-5-5 5 5-5 5" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round"/></svg>
    </a>
    <a class="dept-nav-card" href="${pageContext.request.contextPath}/reportes"><span class="dept-nav-icon" aria-hidden="true"><svg viewBox="0 0 32 32" fill="none"><path d="M8 3h12l5 5v21H8zM12 14h9m-9 5h9m-9 5h6" stroke="currentColor" stroke-width="1.6" stroke-linejoin="round"/></svg></span><div class="dept-nav-copy"><span class="eyebrow">CONSULTAS Y REPORTES</span><h2>Reportes hospitalarios</h2><p>Generar reportes, imprimir o guardar PDF.</p></div><svg class="dept-nav-arrow" viewBox="0 0 24 24" fill="none"><path d="M5 12h14m-5-5 5 5-5 5" stroke="currentColor" stroke-width="1.7"/></svg></a>
    <section class="session-advice" aria-labelledby="session-advice-heading"><span class="advice-icon" aria-hidden="true"><svg viewBox="0 0 24 24" fill="none"><path d="m12 3 8 3v6c0 4-4 7-8 9-4-2-8-5-8-9V6l8-3Z" stroke="currentColor" stroke-width="1.6"/><path d="m8.5 12 2.5 2.5 4.5-5" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"/></svg></span><div><h2 id="session-advice-heading">Cuide la seguridad de su sesión</h2><p>Al terminar, utilice <strong>Cerrar sesión</strong>, especialmente si trabaja en un equipo compartido.</p></div><span class="session-system">SIGH_GR06</span></section>
  </main>
  <%@ include file="fragmentos/pie.jspf" %>
</body>
</html>
