<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="color-scheme" content="dark" />
    <meta name="theme-color" content="#0f172a" />
    <title>Nuevo cargo | Monster Salud · SIGH_GR06</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/departamentos.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cargos.css" />
    <script src="${pageContext.request.contextPath}/js/departamentos.js" defer></script>
</head>
<body class="welcome-page dept-page cargos-page">
    <a class="skip-link" href="#contenido">Ir al contenido principal</a>
    <%@ include file="../fragmentos/cabecera.jspf" %>
    <main id="contenido" class="dept-main">
        <nav class="dept-breadcrumb" aria-label="Ubicación">
            <a href="${pageContext.request.contextPath}/inicio">Inicio</a>
            <span aria-hidden="true">/</span>
            <a href="${pageContext.request.contextPath}/cargos">Cargos</a>
            <span aria-hidden="true">/</span>
            <span aria-current="page">Nuevo</span>
        </nav>
        <div class="dept-page-heading"><h1 id="cargo-heading">Nuevo cargo</h1></div>
        <section class="dept-form-card cargo-form-card" aria-labelledby="cargo-heading">
            <form action="${pageContext.request.contextPath}/cargos/crear" method="post" class="dept-form" data-dept-form>
                <input type="hidden" name="tokenCsrf" value="<c:out value='${tokenCsrf}'/>" />
                <c:if test="${not empty errorGeneral}">
                    <div class="dept-validation-summary validation-summary-errors" role="alert"><p><c:out value="${errorGeneral}"/></p></div>
                </c:if>
                <div class="dept-field">
                    <label for="cargo-departamento">Departamento asignado <span aria-hidden="true">*</span></label>
                    <select id="cargo-departamento" name="PedepCodigo" required aria-describedby="departamento-error">
                        <option value="">Seleccione un departamento</option>
                        <c:forEach items="${departamentos}" var="departamento">
                            <option value="${departamento.pedepCodigo}" ${departamento.pedepCodigo == cargo.pedepCodigo ? 'selected' : ''}><c:out value="${departamento.pedepCodigo}"/> - <c:out value="${departamento.pedepDescri}"/></option>
                        </c:forEach>
                    </select>
                    <c:if test="${not empty errorDep}"><span id="departamento-error" class="dept-field-error"><c:out value="${errorDep}"/></span></c:if>
                </div>
                <div class="dept-field">
                    <label for="cargo-codigo">Código del cargo <span aria-hidden="true">*</span></label>
                    <input id="cargo-codigo" name="PecarCodigo" value="<c:out value='${cargo.pecarCodigo}'/>" type="text" required maxlength="3" autocomplete="off" autocapitalize="characters"
                           spellcheck="false" placeholder="Ej. C01" class="dept-code-input" aria-describedby="codigo-ayuda codigo-error" />
                    <p id="codigo-ayuda" class="dept-field-hint">Máximo 3 caracteres. El código debe ser único dentro del departamento.</p>
                    <c:if test="${not empty errorCodigo}"><span id="codigo-error" class="dept-field-error"><c:out value="${errorCodigo}"/></span></c:if>
                </div>
                <div class="dept-field">
                    <label for="cargo-descripcion">Descripción del cargo <span aria-hidden="true">*</span></label>
                    <input id="cargo-descripcion" name="PecarDescri" value="<c:out value='${cargo.pecarDescri}'/>" type="text" required maxlength="50" autocomplete="off"
                           aria-describedby="descripcion-ayuda descripcion-error" />
                    <p id="descripcion-ayuda" class="dept-field-hint">Máximo 50 caracteres.</p>
                    <c:if test="${not empty errorDescri}"><span id="descripcion-error" class="dept-field-error"><c:out value="${errorDescri}"/></span></c:if>
                </div>
                <div class="dept-form-actions">
                    <a class="button dept-button-secondary" href="${pageContext.request.contextPath}/cargos">Cancelar</a>
                    <button class="button button-primary" type="submit" data-dept-submit>
                        <svg viewBox="0 0 24 24" fill="none" aria-hidden="true"><path d="m5 12 4 4L19 6" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" /></svg>
                        <span data-dept-submit-label>Guardar Cargo</span>
                    </button>
                </div>
            </form>
        </section>
    </main>
    <%@ include file="../fragmentos/pie.jspf" %>
</body>
</html>
