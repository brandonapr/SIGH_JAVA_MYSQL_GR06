"use strict";

(() => {
    document.querySelectorAll("[data-dept-delete]").forEach((form) => {
        form.addEventListener("submit", (event) => {
            const code = form.dataset.deptCode || "";
            const description = form.dataset.deptDescription || "";
            const accepted = window.confirm(`¿Desea eliminar el departamento ${code} — ${description}?\n\nEsta acción quitará el registro del catálogo.`);
            if (!accepted) {
                event.preventDefault();
            }
        });
    });

    document.querySelectorAll("[data-dept-form]").forEach((form) => {
        const button = form.querySelector("[data-dept-submit]");
        const label = form.querySelector("[data-dept-submit-label]");
        if (!button || !label) return;
        const originalLabel = label.textContent;
        form.addEventListener("submit", (event) => {
            if (form.getAttribute("aria-busy") === "true") {
                event.preventDefault();
                return;
            }
            form.setAttribute("aria-busy", "true");
            button.disabled = true;
            label.textContent = "Guardando…";
        });
        window.addEventListener("pageshow", () => {
            form.removeAttribute("aria-busy");
            button.disabled = false;
            label.textContent = originalLabel;
        });
    });
})();
