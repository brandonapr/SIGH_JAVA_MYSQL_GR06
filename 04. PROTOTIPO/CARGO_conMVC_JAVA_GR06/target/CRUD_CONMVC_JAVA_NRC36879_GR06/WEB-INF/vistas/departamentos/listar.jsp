<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="es">
<head>
 <meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
 <meta name="color-scheme" content="light"><meta name="theme-color" content="#132f3b">
 <title>Departamentos hospitalarios | Monster Salud · SIGH_GR06</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/departamentos.css">
 <script src="${pageContext.request.contextPath}/js/departamentos.js" defer></script>
</head>
<body class="welcome-page dept-page">
 <a class="skip-link" href="#contenido">Ir al contenido principal</a>
 <%@ include file="../fragmentos/cabecera.jspf" %>
 <main id="contenido" class="dept-main">
  <nav class="dept-breadcrumb" aria-label="Ubicación"><a href="${pageContext.request.contextPath}/inicio">Inicio</a><span aria-hidden="true">/</span><span aria-current="page">Departamentos</span></nav>
  <div class="dept-page-heading">
   <div><span class="eyebrow dept-eyebrow">PERSONAL · CATÁLOGO</span><h1>Departamentos hospitalarios</h1><p>Administre las áreas de Hospital General Monster Salud.</p></div>
   <div class="dept-heading-actions">
    <a class="button dept-button-secondary" href="${pageContext.request.contextPath}/inicio">← Volver al Inicio</a>
    <a class="button button-primary" href="${pageContext.request.contextPath}/departamentos/crear">＋ Nuevo Departamento</a>
   </div>
  </div>
  <c:if test="${not empty mensaje}"><div class="dept-alert dept-alert-success" role="status"><p><c:out value="${mensaje}"/></p></div></c:if>
  <c:if test="${not empty error}"><div class="dept-alert dept-alert-error" role="alert"><p><c:out value="${error}"/></p></div></c:if>
  <section class="dept-catalog" aria-labelledby="catalogo-heading">
   <div class="dept-catalog-heading"><div><h2 id="catalogo-heading">Catálogo de departamentos</h2><span class="dept-table-id">PEDEP_DEPAR</span></div><c:if test="${empty errorCarga}"><span class="dept-count">${fn:length(departamentos)} registros</span></c:if></div>
   <c:choose>
    <c:when test="${not empty errorCarga}">
     <div class="dept-empty dept-load-error" role="alert"><span class="dept-empty-icon" aria-hidden="true">!</span><h3>No fue posible cargar el catálogo</h3><p><c:out value="${errorCarga}"/></p><a class="button dept-button-secondary" href="${pageContext.request.contextPath}/departamentos">Volver a intentar</a></div>
    </c:when>
    <c:when test="${empty departamentos}">
     <div class="dept-empty"><span class="dept-empty-icon" aria-hidden="true">＋</span><h3>Aún no hay departamentos registrados</h3><p>Agregue el primer departamento para iniciar el catálogo de áreas hospitalarias.</p><a class="button button-primary" href="${pageContext.request.contextPath}/departamentos/crear">Crear primer departamento</a></div>
    </c:when>
    <c:otherwise>
     <div class="dept-table-wrap"><table class="dept-table">
      <caption class="dept-sr-only">Departamentos hospitalarios registrados y acciones de mantenimiento</caption>
      <thead><tr><th scope="col" class="dept-code-column">Código</th><th scope="col">Descripción</th><th scope="col" class="dept-actions-column">Acciones</th></tr></thead>
      <tbody>
       <c:forEach items="${departamentos}" var="departamento">
        <tr><th scope="row" data-label="Código"><span class="dept-code"><c:out value="${departamento.pedepCodigo}"/></span></th>
         <td class="dept-description" data-label="Descripción"><c:out value="${departamento.pedepDescri}"/></td>
         <td data-label="Acciones"><div class="dept-row-actions">
          <a class="dept-action dept-action-edit" href="${pageContext.request.contextPath}/departamentos/editar?id=<c:out value='${departamento.pedepCodigo}'/>">✎ Editar</a>
          <form action="${pageContext.request.contextPath}/departamentos/eliminar" method="post" data-dept-delete data-dept-code="<c:out value='${departamento.pedepCodigo}'/>" data-dept-description="<c:out value='${departamento.pedepDescri}'/>">
           <input type="hidden" name="tokenCsrf" value="<c:out value='${tokenCsrf}'/>">
           <input type="hidden" name="id" value="<c:out value='${departamento.pedepCodigo}'/>">
           <button class="dept-action dept-action-delete" type="submit">▤ Eliminar</button>
          </form>
         </div></td></tr>
       </c:forEach>
      </tbody>
     </table></div>
     <div class="dept-catalog-foot"><p>Los departamentos con personal o cargos asociados deben conservarse en el catálogo.</p></div>
    </c:otherwise>
   </c:choose>
  </section>
 </main>
 <%@ include file="../fragmentos/pie.jspf" %>
</body></html>
