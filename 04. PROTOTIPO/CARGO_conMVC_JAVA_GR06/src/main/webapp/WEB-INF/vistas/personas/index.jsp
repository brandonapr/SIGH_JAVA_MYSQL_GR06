<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="base" value="${pageContext.request.contextPath}"/>
<c:set var="cod" value="${nuevo or bloqueado ? '' : persona.peperCodigo}"/>
<!DOCTYPE html>
<html lang="es">
<head>
 <meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
 <meta name="color-scheme" content="light"><meta name="theme-color" content="#132f3b">
 <title>Mantenimiento de Personal | Monster Salud · SIGH_GR06</title>
 <link rel="stylesheet" href="${base}/css/site.css">
 <link rel="stylesheet" href="${base}/css/departamentos.css">
 <link rel="stylesheet" href="${base}/css/personas.css">
 <script src="${base}/js/personas.js" defer></script>
</head>
<body class="welcome-page dept-page">
 <a class="skip-link" href="#contenido">Ir al contenido principal</a>
 <%@ include file="../fragmentos/cabecera.jspf" %>
 <main id="contenido" class="dept-main">
  <nav class="dept-breadcrumb" aria-label="Ubicación"><a href="${base}/inicio">Inicio</a><span aria-hidden="true">/</span><span aria-current="page">Personal</span></nav>
  <div class="dept-page-heading"><div><span class="eyebrow dept-eyebrow">PERSONAL · MANTENIMIENTO</span><h1>Mantenimiento de Personal</h1><p>Registre y actualice los datos del personal de Hospital General Monster Salud.</p></div><a class="button dept-button-secondary" href="${base}/inicio">Volver al inicio</a></div>
  <c:if test="${not empty mensaje}"><div class="dept-alert dept-alert-success" role="status"><p><c:out value="${mensaje}"/></p></div></c:if>
  <c:if test="${not empty error}"><div class="dept-alert dept-alert-error" role="alert"><p><c:out value="${error}"/></p></div></c:if>
  <c:if test="${not errorCarga}">
  <div class="dept-form-layout persona-layout">
   <section class="dept-form-card" aria-labelledby="ficha-heading">
    <div class="dept-form-heading"><h2 id="ficha-heading">Ficha del personal <span class="dept-table-id">PEPER_PERSON</span></h2><p><c:choose><c:when test="${bloqueado}">Pulse Nuevo, Listar o navegue para seleccionar una persona.</c:when><c:when test="${nuevo}">Complete los datos para registrar una persona.</c:when><c:otherwise>Edite los datos de la persona seleccionada.</c:otherwise></c:choose></p></div>
    <form class="dept-form" id="frmPersona" method="post" action="${base}/persona">
     <input type="hidden" name="tokenCsrf" value="<c:out value='${tokenCsrf}'/>">
     <input type="hidden" name="codigo" value="<c:out value='${cod}'/>">
     <input type="hidden" name="tab" id="tab" value="<c:out value='${tab}'/>">
     <fieldset class="persona-fields" ${bloqueado ? 'disabled' : ''}>
      <div class="dept-field"><label for="codigoVisible">Código</label><input class="dept-code-input" id="codigoVisible" readonly value="<c:out value='${nuevo ? siguienteCodigo : cod}'/>"><c:if test="${nuevo}"><p class="dept-field-hint">Código automático; se confirma al guardar.</p></c:if></div>
      <div class="persona-nombres">
       <div class="dept-field"><label for="apellidos">Apellidos <span>*</span></label><input id="apellidos" name="apellidos" required maxlength="50" value="<c:out value='${persona.peperApelli}'/>"></div>
       <div class="dept-field"><label for="nombres">Nombres <span>*</span></label><input id="nombres" name="nombres" required maxlength="50" value="<c:out value='${persona.peperNombre}'/>"></div>
      </div>
     </fieldset>
     <div class="persona-tabs" role="tablist" aria-label="Datos del personal" hidden>
      <button type="button" role="tab" id="t-laborales" aria-controls="laborales" data-panel="laborales">Datos laborales</button>
      <button type="button" role="tab" id="t-contacto" aria-controls="contacto" data-panel="contacto">Contacto</button>
     </div>
     <section class="persona-panel" id="laborales" role="tabpanel" aria-labelledby="t-laborales">
      <h3 class="persona-panel-title">Datos laborales</h3>
      <fieldset class="persona-fields" ${bloqueado ? 'disabled' : ''}>
       <div class="dept-field"><label for="departamento">Departamento</label>
        <select id="departamento" name="departamento"><option value="">Sin departamento asignado</option>
         <c:forEach var="d" items="${departamentos}"><option value="<c:out value='${d.pedepCodigo}'/>" ${d.pedepCodigo eq departamentoSeleccionado ? 'selected' : ''}><c:out value="${d.pedepCodigo} — ${d.pedepDescri}"/></option></c:forEach>
        </select><p class="dept-field-hint">Seleccione un departamento del catálogo PEDEP_DEPAR (opcional).</p>
       </div>
      </fieldset>
     </section>
     <section class="persona-panel" id="contacto" role="tabpanel" aria-labelledby="t-contacto">
      <h3 class="persona-panel-title">Contacto</h3>
      <fieldset class="persona-fields" ${bloqueado ? 'disabled' : ''}>
       <div class="dept-field"><label for="email">Correo electrónico <span>*</span></label><input id="email" name="email" type="email" required maxlength="100" autocomplete="email" value="<c:out value='${persona.peperEmail}'/>"><p class="dept-field-hint">Debe ser único para cada persona.</p></div>
      </fieldset>
     </section>
     <div class="dept-form-actions persona-actions">
      <c:url var="urlNuevo" value="/persona"><c:param name="modo" value="nuevo"/><c:param name="tab" value="${tab}"/></c:url>
      <c:url var="urlListar" value="/persona"><c:param name="modo" value="listar"/><c:param name="codigo" value="${cod}"/><c:param name="tab" value="${tab}"/></c:url>
      <a class="button dept-button-secondary" data-conservar-tab href="<c:out value='${urlNuevo}'/>">Nuevo</a>
      <a class="button dept-button-secondary" data-conservar-tab href="<c:out value='${urlListar}'/>#listado">Listar</a>
      <button type="submit" class="button button-primary" name="accion" value="guardar" ${bloqueado ? 'disabled' : ''}>${nuevo or bloqueado ? 'Guardar' : 'Actualizar'}</button>
      <c:if test="${not nuevo and not bloqueado}"><button class="button persona-delete" type="submit" name="accion" value="eliminar" formnovalidate data-confirmar>Eliminar</button></c:if>
     </div>
    </form>
   </section>
   <aside class="dept-form-aside">
    <span class="dept-aside-icon" aria-hidden="true"><svg viewBox="0 0 32 32" fill="none"><circle cx="16" cy="10" r="5" stroke="currentColor" stroke-width="1.7"/><path d="M6 28v-3a10 10 0 0 1 20 0v3H6Z" stroke="currentColor" stroke-width="1.7"/></svg></span>
    <h2>Navegación de registros</h2><p>Consulte el primer, anterior, siguiente o último registro. La pestaña seleccionada se conserva.</p>
    <nav class="persona-nav" aria-label="Navegación del personal">
     <c:forEach var="n" items="${['primero','anterior','siguiente','ultimo']}">
      <c:url var="urlNav" value="/persona"><c:param name="nav" value="${n}"/><c:param name="codigo" value="${cod}"/><c:param name="tab" value="${tab}"/></c:url>
      <a class="button dept-button-secondary" data-conservar-tab href="<c:out value='${urlNav}'/>" title="${n}" aria-label="${n}">${n eq 'primero' ? '⏮' : n eq 'anterior' ? '◀' : n eq 'siguiente' ? '▶' : '⏭'}</a>
     </c:forEach>
    </nav>
    <p class="persona-total">Registros: <strong><c:out value="${total}"/></strong></p><span class="dept-aside-label">Hospital General Monster Salud</span>
   </aside>
  </div>
  <c:if test="${listar}">
   <section id="listado" class="dept-catalog persona-listado" aria-labelledby="listado-heading">
    <div class="dept-catalog-heading"><div><h2 id="listado-heading">Personal registrado</h2><span class="dept-table-id">PEPER_PERSON</span></div><span class="dept-count"><c:out value="${total}"/> registros</span></div>
    <div class="dept-table-wrap"><table class="dept-table"><thead><tr><th scope="col">Código</th><th scope="col">Apellidos</th><th scope="col">Nombres</th><th scope="col">Departamento</th><th scope="col">Correo</th><th scope="col">Acción</th></tr></thead><tbody>
     <c:forEach var="p" items="${personas}"><c:url var="urlPersona" value="/persona"><c:param name="codigo" value="${p.peperCodigo}"/><c:param name="tab" value="${tab}"/></c:url>
      <tr><th scope="row"><span class="dept-code"><c:out value="${p.peperCodigo}"/></span></th><td><c:out value="${p.peperApelli}"/></td><td><c:out value="${p.peperNombre}"/></td><td><c:out value="${p.pedepCodigoNavigation.pedepDescri}" default="Sin asignar"/></td><td><c:out value="${p.peperEmail}"/></td><td><a class="dept-action dept-action-edit" data-conservar-tab href="<c:out value='${urlPersona}'/>">Seleccionar</a></td></tr>
     </c:forEach>
     <c:if test="${empty personas}"><tr><td colspan="6">No hay personal registrado.</td></tr></c:if>
    </tbody></table></div>
   </section>
  </c:if>
  </c:if>
 </main>
 <%@ include file="../fragmentos/pie.jspf" %>
</body></html>
