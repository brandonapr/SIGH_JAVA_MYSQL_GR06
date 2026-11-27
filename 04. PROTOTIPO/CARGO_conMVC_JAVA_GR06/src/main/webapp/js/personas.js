"use strict";
// TabPage: cabecera fija, panel activo y conservación de la pestaña en navegación.
(() => {
    const formulario = document.getElementById("frmPersona");
    if (!formulario) return;
    const campo = document.getElementById("tab");
    const botones = Array.from(formulario.querySelectorAll("[role=tab]"));
    const paneles = botones.map(b => document.getElementById(b.dataset.panel));
    function activar(id, enfocar = false) {
        botones.forEach(b => {
            const activo = b.dataset.panel === id;
            b.setAttribute("aria-selected", String(activo));
            b.tabIndex = activo ? 0 : -1;
            if (activo && enfocar) b.focus();
        });
        paneles.forEach(p => { p.hidden = p.id !== id; });
        campo.value = id;
    }
    if (botones.length) {
        botones[0].parentElement.hidden = false;
        botones.forEach((b, i) => {
            b.addEventListener("click", () => activar(b.dataset.panel));
            b.addEventListener("keydown", e => {
                let indice;
                if (e.key === "ArrowRight") indice = (i + 1) % botones.length;
                else if (e.key === "ArrowLeft") indice = (i + botones.length - 1) % botones.length;
                else if (e.key === "Home") indice = 0;
                else if (e.key === "End") indice = botones.length - 1;
                else return;
                e.preventDefault();
                activar(botones[indice].dataset.panel, true);
            });
        });
        activar(botones.some(b => b.dataset.panel === campo.value) ? campo.value : botones[0].dataset.panel);
        formulario.addEventListener("invalid", e => {
            const panel = e.target.closest(".persona-panel");
            if (panel && panel.hidden) activar(panel.id);
        }, true);
        document.querySelectorAll("[data-conservar-tab]").forEach(a => {
            a.addEventListener("click", () => {
                const url = new URL(a.href);
                url.searchParams.set("tab", campo.value);
                a.href = url.toString();
            });
        });
    }
    formulario.addEventListener("submit", e => {
        if (e.submitter && e.submitter.hasAttribute("data-confirmar") && !window.confirm("¿Desea eliminar esta persona?")) e.preventDefault();
    });
})();
