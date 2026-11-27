<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="color-scheme" content="dark" />
    <meta name="theme-color" content="#0f172a" />
    <title>Cargos hospitalarios | Monster Salud · SIGH_GR06</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/departamentos.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cargos.css" />
    <script src="${pageContext.request.contextPath}/js/cargos.js" defer></script>
</head>
<body class="welcome-page dept-page cargos-page">
    <a class="skip-link" href="#contenido">Ir al contenido principal</a>
    <%@ include file="../fragmentos/cabecera.jspf" %>
    <main id="contenido" class="dept-main">
        <nav class="dept-breadcrumb" aria-label="Ubicación">
            <a href="${pageContext.request.contextPath}/inicio">Inicio</a>
            <span aria-hidden="true">/</span>
            <span aria-current="page">Cargos</span>
        </nav>
        <div class="dept-page-heading">
            <h1 id="cargos-heading">Cargos hospitalarios</h1>
            <div class="dept-heading-actions">
                <a class="button dept-button-secondary" href="${pageContext.request.contextPath}/inicio">
                    <svg viewBox="0 0 24 24" fill="none" aria-hidden="true"><path d="m11 6-6 6 6 6M5 12h14" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round" /></svg>
                    Volver al Inicio
                </a>
            </div>
        </div>
        <c:if test="${not empty mensaje}">
            <div class="dept-alert dept-alert-success" role="status"><p><c:out value="${mensaje}"/></p></div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="dept-alert dept-alert-error" role="alert"><p><c:out value="${error}"/></p></div>
        </c:if>
        <c:choose>
            <c:when test="${not empty errorCarga}">
                <section class="dept-catalog" aria-labelledby="cargos-heading">
                    <div class="dept-empty" role="alert">
                        <p><c:out value="${errorCarga}"/></p>
                        <a class="button dept-button-secondary" href="${pageContext.request.contextPath}/cargos">Volver a intentar</a>
                    </div>
                </section>
            </c:when>
            <c:otherwise>
                <div class="cargo-workspace">
                    <section class="dept-catalog cargo-consulta" aria-labelledby="cargo-consulta-heading">
                        <h2 id="cargo-consulta-heading">Consultar cargos</h2>
                        <div class="cargo-filtros">
                            <div class="dept-field">
                                <label for="filtro-descripcion">Descripción</label>
                                <input id="filtro-descripcion" type="search" autocomplete="off" />
                            </div>
                            <div class="dept-field">
                                <label for="filtro-codigo">Código</label>
                                <input id="filtro-codigo" type="search" autocomplete="off" />
                            </div>
                            <div class="dept-field">
                                <label for="filtro-departamento">Departamento</label>
                                <select id="filtro-departamento">
                                    <option value="">Todos los departamentos</option>
                                    <c:forEach items="${modelo.departamentos}" var="departamento">
                                        <option value="${departamento.pedepCodigo}"><c:out value="${departamento.pedepCodigo}"/> - <c:out value="${departamento.pedepDescri}"/></option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="dept-field cargo-resultados">
                            <label for="lista-cargos">Cargos registrados</label>
                            <select id="lista-cargos" size="9" aria-describedby="cargos-resultados">
                                <c:forEach items="${modelo.cargos}" var="cargo">
                                    <c:set var="seleccionado" value="${modelo.editando && cargo.pedepCodigo == modelo.cargo.pedepCodigo && cargo.pecarCodigo == modelo.cargo.pecarCodigo}" />
                                    <option data-departamento="<c:out value='${cargo.pedepCodigo}'/>"
                                            data-codigo="<c:out value='${cargo.pecarCodigo}'/>"
                                            data-descripcion="<c:out value='${cargo.pecarDescri}'/>"
                                            ${seleccionado ? 'selected' : ''}><c:out value="${cargo.pecarCodigo}"/> · <c:out value="${cargo.pecarDescri}"/> (<c:out value="${cargo.pedepCodigo}"/> — <c:out value="${cargo.pedepCodigoNavigation.pedepDescri}"/>)</option>
                                </c:forEach>
                            </select>
                            <p id="cargos-resultados" class="dept-field-hint" role="status">
                                <c:choose>
                                    <c:when test="${empty modelo.cargos}">Aún no hay cargos registrados.</c:when>
                                    <c:otherwise>Resultados: ${fn:length(modelo.cargos)}</c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                    </section>
                    <section class="dept-form-card" aria-labelledby="cargo-form-heading">
                        <div class="dept-form-heading">
                            <h2 id="cargo-form-heading">Datos del cargo</h2>
                        </div>
                        <c:set var="accionForm" value="${modelo.editando ? '/cargos/editar' : '/cargos/crear'}" />
                        <form id="cargo-form"
                              action="${pageContext.request.contextPath}${accionForm}"
                              method="post"
                              class="dept-form"
                              data-crear-url="${pageContext.request.contextPath}/cargos/crear"
                              data-editar-url="${pageContext.request.contextPath}/cargos/editar">
                            <input type="hidden" name="tokenCsrf" value="<c:out value='${tokenCsrf}'/>" />
                            <input type="hidden" name="desdeCatalogo" value="true" />
                            <input id="departamento-clave" type="hidden" name="PedepCodigo" value="<c:out value='${modelo.cargo.pedepCodigo}'/>" ${!modelo.editando ? 'disabled' : ''} />
                            <c:if test="${not empty errorGeneral}">
                                <div class="dept-validation-summary validation-summary-errors" role="alert"><p><c:out value="${errorGeneral}"/></p></div>
                            </c:if>
                            <div class="dept-field">
                                <label for="cargo-departamento">Departamento asignado</label>
                                <select id="cargo-departamento" name="PedepCodigo" required ${modelo.editando ? 'disabled' : ''} aria-describedby="departamento-error">
                                    <option value="">Seleccione un departamento</option>
                                    <c:forEach items="${modelo.departamentos}" var="departamento">
                                        <option value="${departamento.pedepCodigo}" ${departamento.pedepCodigo == modelo.cargo.pedepCodigo ? 'selected' : ''}><c:out value="${departamento.pedepCodigo}"/> - <c:out value="${departamento.pedepDescri}"/></option>
                                    </c:forEach>
                                </select>
                                <c:if test="${not empty errorDep}">
                                    <span id="departamento-error" class="dept-field-error field-validation-error"><c:out value="${errorDep}"/></span>
                                </c:if>
                            </div>
                            <div class="dept-field">
                                <label for="cargo-codigo">Código del cargo</label>
                                <input id="cargo-codigo" name="PecarCodigo" value="<c:out value='${modelo.cargo.pecarCodigo}'/>" type="text"
                                       required ${modelo.editando ? 'readonly' : ''} maxlength="3" autocomplete="off" autocapitalize="characters"
                                       spellcheck="false" class="dept-code-input" aria-describedby="codigo-ayuda codigo-error" />
                                <p id="codigo-ayuda" class="dept-field-hint">Hasta 3 caracteres. El código es único dentro del departamento.</p>
                                <c:if test="${not empty errorCodigo}">
                                    <span id="codigo-error" class="dept-field-error field-validation-error"><c:out value="${errorCodigo}"/></span>
                                </c:if>
                            </div>
                            <div class="dept-field">
                                <label for="cargo-descripcion">Descripción del cargo</label>
                                <input id="cargo-descripcion" name="PecarDescri" value="<c:out value='${modelo.cargo.pecarDescri}'/>" type="text"
                                       required maxlength="50" autocomplete="off" aria-describedby="descripcion-error" />
                                <c:if test="${not empty errorDescri}">
                                    <span id="descripcion-error" class="dept-field-error field-validation-error"><c:out value="${errorDescri}"/></span>
                                </c:if>
                            </div>
                            <div class="dept-form-actions">
                                <button id="cargo-guardar" class="button button-primary" type="submit">${modelo.editando ? 'Actualizar' : 'Crear'}</button>
                                <a id="cargo-limpiar" class="button dept-button-secondary" href="${pageContext.request.contextPath}/cargos">Limpiar</a>
                                <button id="cargo-eliminar" class="button dept-action dept-action-delete" type="submit"
                                        form="cargo-eliminar-form" ${!modelo.editando ? 'disabled' : ''}>Eliminar</button>
                            </div>
                        </form>
                        <form id="cargo-eliminar-form" action="${pageContext.request.contextPath}/cargos/eliminar" method="post">
                            <input type="hidden" name="tokenCsrf" value="<c:out value='${tokenCsrf}'/>" />
                            <input type="hidden" name="dep" value="<c:out value='${modelo.editando ? modelo.cargo.pedepCodigo : ""}'/>" />
                            <input type="hidden" name="cargo" value="<c:out value='${modelo.editando ? modelo.cargo.pecarCodigo : ""}'/>" />
                        </form>
                    </section>
                </div>
            </c:otherwise>
        </c:choose>
    </main>
    <%@ include file="../fragmentos/pie.jspf" %>
</body>
</html>
