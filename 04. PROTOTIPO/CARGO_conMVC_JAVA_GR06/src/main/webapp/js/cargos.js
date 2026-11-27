"use strict";

(() => {
    const formulario = document.getElementById("cargo-form");
    if (!formulario) return;

    const lista = document.getElementById("lista-cargos");
    const filtroDescripcion = document.getElementById("filtro-descripcion");
    const filtroCodigo = document.getElementById("filtro-codigo");
    const filtroDepartamento = document.getElementById("filtro-departamento");
    const resultados = document.getElementById("cargos-resultados");
    const departamento = document.getElementById("cargo-departamento");
    const departamentoClave = document.getElementById("departamento-clave");
    const codigo = document.getElementById("cargo-codigo");
    const descripcion = document.getElementById("cargo-descripcion");
    const guardar = document.getElementById("cargo-guardar");
    const eliminar = document.getElementById("cargo-eliminar");
    const formularioEliminar = document.getElementById("cargo-eliminar-form");
    const eliminarDepartamento = formularioEliminar.elements.namedItem("dep");
    const eliminarCodigo = formularioEliminar.elements.namedItem("cargo");

    const normalizarBusqueda = (texto) => texto.trim().normalize("NFD").replace(/\p{Diacritic}/gu, "").toLowerCase();
    const cargos = Array.from(lista.options, (opcion) => ({
        opcion,
        codigo: normalizarBusqueda(opcion.dataset.codigo),
        descripcion: normalizarBusqueda(opcion.dataset.descripcion),
        departamento: opcion.dataset.departamento
    }));

    function mostrarCargo(opcion) {
        const editando = Boolean(opcion);
        const datos = opcion?.dataset;
        departamentoClave.value = datos?.departamento ?? "";
        departamento.value = departamentoClave.value;
        departamento.disabled = editando;
        departamentoClave.disabled = !editando;
        codigo.value = datos?.codigo ?? "";
        codigo.readOnly = editando;
        descripcion.value = datos?.descripcion ?? "";

        formulario.action = editando ? formulario.dataset.editarUrl : formulario.dataset.crearUrl;
        guardar.textContent = editando ? "Actualizar" : "Crear";
        eliminar.disabled = !editando;
        eliminarDepartamento.value = departamentoClave.value;
        eliminarCodigo.value = codigo.value;

        formulario.querySelectorAll(".field-validation-error, .validation-summary-errors").forEach((mensaje) => {
            mensaje.hidden = true;
        });
    }

    function filtrarCargos() {
        const texto = normalizarBusqueda(filtroDescripcion.value);
        const textoCodigo = normalizarBusqueda(filtroCodigo.value);
        const codigoDepartamento = filtroDepartamento.value;
        const seleccion = lista.selectedOptions[0];
        const coincidencias = cargos.filter((cargo) => cargo.descripcion.includes(texto)
            && cargo.codigo.includes(textoCodigo)
            && (!codigoDepartamento || cargo.departamento === codigoDepartamento));

        const opciones = document.createDocumentFragment();
        coincidencias.forEach((cargo) => opciones.append(cargo.opcion));
        lista.replaceChildren(opciones);

        const conservarSeleccion = seleccion && lista.contains(seleccion);
        lista.selectedIndex = conservarSeleccion ? seleccion.index : -1;
        if (seleccion && !conservarSeleccion) mostrarCargo();

        resultados.textContent = coincidencias.length ? `Resultados: ${coincidencias.length}` : "No hay cargos que coincidan con los filtros.";
        if (!cargos.length) resultados.textContent = "Aún no hay cargos registrados.";
    }

    filtroDescripcion.addEventListener("input", filtrarCargos);
    filtroCodigo.addEventListener("input", filtrarCargos);
    filtroDepartamento.addEventListener("change", filtrarCargos);
    lista.addEventListener("change", () => mostrarCargo(lista.selectedOptions[0]));

    document.getElementById("cargo-limpiar").addEventListener("click", (event) => {
        event.preventDefault();
        filtroDescripcion.value = "";
        filtroCodigo.value = "";
        filtroDepartamento.value = "";
        lista.selectedIndex = -1;
        mostrarCargo();
        filtrarCargos();
        departamento.focus();
    });

    formularioEliminar.addEventListener("submit", (event) => {
        if (eliminar.disabled || !window.confirm(`¿Desea eliminar el cargo ${eliminarCodigo.value} del departamento ${eliminarDepartamento.value}?`)) {
            event.preventDefault();
        }
    });
})();
