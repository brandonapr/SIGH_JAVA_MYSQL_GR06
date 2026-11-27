# SIGH_JAVA_MYSQL_GR06

Módulo web de mantenimiento de cargos hospitalarios para el Sistema Integral de Gestión Hospitalaria (SIGH). Desarrollado bajo el patrón arquitectónico **Modelo-Vista-Controlador (MVC)** en Java Web, integra en una sola interfaz la consulta dinámica mediante un **ListBox** con filtros combinados en tiempo real y el formulario de operaciones CRUD.

## Especificaciones Técnicas

* **Lenguaje:** Java (compilación Java 17 / JDK 21)
* **Plataforma Web:** Jakarta EE 11 (Servlets, JSP, JSTL)
* **Persistencia (ORM):** Jakarta Persistence (JPA / EclipseLink)
* **Base de Datos:** MariaDB / MySQL
* **Frontend:** HTML5, CSS3 y JavaScript (ES6)
* **Gestión de Dependencias y Empaquetado:** Apache Maven (WAR)
* **Servidor de Aplicaciones:** Payara Server 7

## Características Principales

* **Arquitectura MVC en Capas:** Separación estructurada entre entidades/modelos, objetos de acceso a datos (DAO), controladores Servlet, filtros y vistas JSP.
* **ListBox con Filtros Combinados:** Filtrado instantáneo en el cliente por descripción, código y departamento, ignorando tildes y mayúsculas, con carga automática de datos al seleccionar un registro.
* **Operaciones CRUD y PRG:** Creación, consulta, actualización y eliminación de registros aplicando el patrón Post-Redirect-Get (PRG) para evitar reenvíos duplicados de formularios.
* **Integridad de Datos:** Soporte para clave primaria compuesta (departamento y código de cargo), validación de duplicados y protección referencial respecto al catálogo de departamentos.
* **Seguridad:** Control de acceso mediante filtros de sesión y validación anti-CSRF en las peticiones de escritura.

