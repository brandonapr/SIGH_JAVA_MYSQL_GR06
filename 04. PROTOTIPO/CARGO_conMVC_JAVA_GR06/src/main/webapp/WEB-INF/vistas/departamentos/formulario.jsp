<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
 <meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
 <meta name="color-scheme" content="light"><meta name="theme-color" content="#132f3b">
 <title><c:choose><c:when test="${edicion}">Editar</c:when><c:otherwise>Nuevo</c:otherwise></c:choose> departamento | Monster Salud · SIGH_GR06</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/departamentos.css">
 <script src="${pageContext.request.contextPath}/js/departamentos.js" defer></script>
</head>
<body class="welcome-page dept-page">
 <a class="skip-link" href="#contenido">Ir al contenido principal</a>
 <%@ include file="../fragmentos/cabecera.jspf" %>
 <main id="contenido" class="dept-main">
  <nav class="dept-breadcrumb" aria-label="Ubicación"><a href="${pageContext.request.contextPath}/inicio">Inicio</a><span aria-hidden="true">/</span><a href="${pageContext.request.contextPath}/departamentos">Departamentos</a><span aria-hidden="true">/</span><span aria-current="page"><c:choose><c:when test="${edicion}">Editar</c:when><c:otherwise>Nuevo</c:otherwise></c:choose></span></nav>
  <div class="dept-page-heading"><div><span class="eyebrow dept-eyebrow">PERSONAL · CATÁLOGO</span><h1><c:choose><c:when test="${edicion}">Editar departamento</c:when><c:otherwise>Nuevo departamento</c:otherwise></c:choose></h1><p><c:choose><c:when test="${edicion}">Actualice la descripción del área. El código se conserva.</c:when><c:otherwise>Registre un área de Hospital General Monster Salud.</c:otherwise></c:choose></p></div></div>
  <div class="dept-form-layout">
   <section class="dept-form-card" aria-labelledby="formulario-heading"><div class="dept-form-heading"><h2 id="formulario-heading">Información del departamento</h2><p>Todos los campos son obligatorios.</p></div>
    <c:set var="accionFormulario" value="crear" />
    <c:if test="${edicion}"><c:set var="accionFormulario" value="editar" /></c:if>
    <form action="${pageContext.request.contextPath}/departamentos/${accionFormulario}" method="post" class="dept-form" data-dept-form>
     <input type="hidden" name="tokenCsrf" value="<c:out value='${tokenCsrf}'/>">
     <c:if test="${edicion}"><input type="hidden" name="version" value="<c:out value='${version}'/>"></c:if>
     <c:if test="${not empty error}"><div class="dept-validation-summary validation-summary-errors" role="alert"><p><c:out value="${error}"/></p></div></c:if>
     <c:if test="${not empty descripcionActual}"><div class="dept-concurrency" role="status"><span>Descripción actual en el catálogo</span><p><c:out value="${descripcionActual}"/></p><small>Revise la descripción antes de volver a guardar.</small></div></c:if>
     <div class="dept-field"><label for="codigo">Código del departamento <span aria-hidden="true">*</span></label>
      <div class="dept-readonly-wrap">
       <input id="codigo" name="codigo" type="text" required maxlength="3" autocomplete="off" autocapitalize="characters" spellcheck="false" placeholder="Ej. D04" class="dept-code-input" value="<c:out value='${departamento.pedepCodigo}'/>" ${edicion ? "readonly" : ""}>
      </div>
      <p class="dept-field-hint"><c:choose><c:when test="${edicion}">Identificador de solo lectura.</c:when><c:otherwise>De 1 a 3 letras o números. Debe ser único.</c:otherwise></c:choose></p>
     </div>
     <div class="dept-field"><label for="descripcion">Descripción del departamento <span aria-hidden="true">*</span></label>
      <input id="descripcion" name="descripcion" type="text" required maxlength="50" autocomplete="off" placeholder="Ej. CONSULTA EXTERNA" value="<c:out value='${departamento.pedepDescri}'/>">
      <p class="dept-field-hint">Nombre del área hospitalaria. Máximo 50 caracteres.</p>
     </div>
     <div class="dept-form-actions"><a class="button dept-button-secondary" href="${pageContext.request.contextPath}/departamentos">Cancelar</a><button class="button button-primary" type="submit" data-dept-submit><svg viewBox="0 0 24 24" fill="none" aria-hidden="true"><path d="m5 12 4 4L19 6" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/></svg><span data-dept-submit-label><c:choose><c:when test="${edicion}">Actualizar</c:when><c:otherwise>Guardar Departamento</c:otherwise></c:choose></span></button></div>
    </form>
   </section>
   <aside class="dept-form-aside"><span class="dept-aside-icon" aria-hidden="true"><svg viewBox="0 0 32 32" fill="none"><path d="M7 28V6h18v22M3 28h26M12 28v-7h8v7M12 11h2m4 0h2m-8 5h2m4 0h2" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg></span><h2><c:choose><c:when test="${edicion}">Un catálogo consistente</c:when><c:otherwise>Organización hospitalaria</c:otherwise></c:choose></h2><p>El código identifica al departamento y la descripción permite reconocer el área.</p><p>Los datos se guardarán en mayúsculas para mantener un catálogo uniforme.</p><span class="dept-aside-label">Hospital General Monster Salud</span></aside>
  </div>
 </main>
 <%@ include file="../fragmentos/pie.jspf" %>
</body></html>
