"use strict";

(() => {
    const passwordToggle = document.querySelector("[data-password-toggle]");
    const passwordInput = document.getElementById("Clave");

    if (passwordToggle && passwordInput) {
        passwordToggle.addEventListener("click", () => {
            const visible = passwordInput.type === "password";
            passwordInput.type = visible ? "text" : "password";
            passwordToggle.setAttribute("aria-pressed", String(visible));
            passwordToggle.setAttribute("aria-label", visible ? "Ocultar contraseña" : "Mostrar contraseña");
        });
    }

    const loginForm = document.querySelector("[data-login-form]");
    const submitButton = document.querySelector("[data-submit-button]");
    const submitLabel = document.querySelector("[data-submit-label]");

    if (loginForm && submitButton && submitLabel) {
        loginForm.addEventListener("submit", (event) => {
            if (loginForm.getAttribute("aria-busy") === "true") {
                event.preventDefault();
                return;
            }
            loginForm.setAttribute("aria-busy", "true");
            submitButton.disabled = true;
            submitLabel.textContent = "Validando acceso…";
        });
        window.addEventListener("pageshow", () => {
            loginForm.removeAttribute("aria-busy");
            submitButton.disabled = false;
            submitLabel.textContent = "Ingresar al sistema";
        });
    }

    const errorMessage = document.querySelector("[data-login-error]");
    if (errorMessage) {
        errorMessage.focus({ preventScroll: true });
    }
})();
