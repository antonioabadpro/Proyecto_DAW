# 🚗 ToniCar – Catálogo Web de Vehículos

![Java](https://img.shields.io/badge/Java-JDK%2021-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-Java%20Web-ED8B00?style=for-the-badge&logo=java&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)
![IDE](https://img.shields.io/badge/IDE-NetBeans%2022-1B6AC6?style=for-the-badge&logo=apache-netbeans-ide&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)

**ToniCar** es una aplicación web desarrollada como proyecto académico para la asignatura **Desarrollo de Aplicaciones Web (DAW)**.  
El objetivo es simular el funcionamiento de un **concesionario online**, permitiendo consultar un catálogo de coches, gestionar usuarios y enviar solicitudes de información mediante una arquitectura **MVC** basada en **Java EE / Jakarta EE**.

---

## 📌 Funcionalidades

- Catálogo de vehículos con vista de detalle.
- Página principal con carousel informativo.
- Registro e inicio de sesión de usuarios.
- Gestión de sesión con `HttpSession`.
- Acceso restringido según autenticación.
- Envío de solicitudes de información.
- Separación de responsabilidades (Modelo–Vista–Controlador).

---

## 🗂️ Diagrama de Clases

El siguiente diagrama representa las entidades principales del sistema y sus relaciones (Persistencia con JPA/EclipseLink):

```mermaid
classDiagram
    namespace enum {
        class TipoRol {
            <<enumeration>>
            Cliente
            Admin
        }

        class TipoCombustible {
            <<enumeration>>
            Gasolina
            Diesel
            Electrico
            Hibrido
        }

        class TipoCambio {
            <<enumeration>>
            Manual
            Automatico
        }

        class TipoEstado {
            <<enumeration>>
            Nuevo
            ComoNuevo
            Usado
            PorReparar
        }
    }

    namespace modelos {
        class Usuario {
            - idUsuario : Long
            - dni : String
            - nombre : String
            - nomUsuario : String
            - correo : String
            - password : String
            - telefono : String
            - direccion : String
            - codigoPostal : String
            - provincia : String
            - rol : TipoRol
            - listaCompras : List~Compra~
            + Usuario()
            + getters()
            + setters()
            + equals()
            + toString()
        }

        class Coche {
            - idCoche : Long
            - nombreModelo : String
            - matricula : String
            - descripcion : String
            - precio : float
            - descuento : int
            - cv : int
            - consumo : float
            - combustible : TipoCombustible
            - color : String
            - fecha : String
            - km : int
            - cajaCambios : TipoCambio
            - foto1 : String
            - foto2 : String
            - estado : TipoEstado
            - marca : Marca
            - compra : Compra
            + Coche()
            + getters()
            + setters()
            + equals()
            + toString()
        }

        class Marca {
            - idMarca : Long
            - nombre : String
            - logo : String
            - listaCoches : List~Coche~
            + Marca()
            + getters()
            + setters()
            + equals()
            + toString()
        }

        class Compra {
            - idCompra : Long
            - usuario : Usuario
            - coche : Coche
            + Compra()
            + getters()
            + setters()
            + equals()
            + toString()
        }
    }

    %% Relaciones
    Usuario "1" -- "0..*" Compra : realiza
    Coche "1" -- "0..1" Compra : puedeComprarse
    Marca "1" -- "0..*" Coche : pertenece
```

---

## 🧱 Arquitectura (MVC)

### Modelo
- Entidades: `Usuario`, `Coche`, `Marca`, `Compra`
- Utilidades de conexión a base de datos.

### Controlador
- **Servlets** para gestionar peticiones HTTP.
- Validación de datos y control de navegación.

### Vista
- **JSP** con **JSTL** y **EL**.
- Componentes reutilizables (`header`, `footer`).
- Interfaz responsive con **Bootstrap**.

---

## 🛠️ Tecnologías

### Frontend:

- HTML5
- CSS3 para el estilo visual de la web
- JavaScript para la validación de datos.
- Bootstrap v5.3.8 para un diseño responsivo.
- Plantillas JSP para reutilizar encabezados, menús y pies de página en las diferentes vistas.
- JSTL para renderizar contenido dinámico en tablas y tarjetas.

### Backend:

- Java 21 (Jakarta EE 10)
- Servlets para los controladores.
- JSP como tecnología de las vistas.
- JSTL y expresiones EL para la parte dinámica (comunicación entre los controladores y las vistas).
- JavaDB/Java Derby como base de datos.
- JDBC para la comunicación con la base de datos.
- EclipseLink como ORM (mapeo objeto-relacional) que implementa JPA (Java Persistence API) como proveedor de persistencia (para manejar la unidad de persistencia).
- Gestión de sesiones HTTP con HttpSession.

### Servidor y Entorno de desarrollo (IDE):

- Eclipse GlassFish v7.0.14 como servidor de aplicaciones web (servidor local)
- NetBeans 22 como IDE
- Arquitectura MVC (Modelo-Vista-Controlador)
---

## ▶️ Ejecución

1. Importar el proyecto en **NetBeans**.
2. Configurar **Eclipse GlassFish**.
3. Crear la base de datos y cargar el script SQL.
4. Ajustar credenciales de BD en la clase de conexión.
5. Ejecutar el proyecto desde NetBeans.

---

## 🎓 Objetivo Académico

- Aplicar el patrón MVC en aplicaciones web Java.
- Implementar autenticación y gestión de sesiones.
- Separar lógica de negocio y presentación.
- Desarrollar una aplicación web funcional y mantenible.

---

## 📑 Documentación y Memoria Técnica del Proyecto

[![Memoria Técnica](https://img.shields.io/badge/PDF-Ver_Memoria_Técnica-EC1C24?style=for-the-badge&logo=adobeacrobatreader&logoColor=white)](https://github.com/antonioabadpro/Proyecto_DAW/blob/main/Documentaci%C3%B3n%20ToniCar%20DAW_AAHG.pdf)

> **Nota:** Haz clic en el botón de arriba para visualizar o descargar la memoria técnica completa en PDF.

---

## 👤 Autor

**Antonio Abad Hernández Gálvez**
* GitHub: [@antonioabadpro](https://github.com/antonioabadpro)
* *Proyecto realizado para la Universidad de Huelva (UHU)*

---

## ©️​ Licencia y Derechos de Autor

**© 2025. Antonio Abad Hernández Gálvez**. <br>
Todos los derechos reservados.

Este proyecto es propiedad intelectual de su autor. <br>
El código se proporciona únicamente con fines de **consulta y demostración de portfolio**.

El código fuente de este proyecto es propiedad exclusiva de su autor. 
Se permite su visualización con fines educativos y de evaluación académica.

⛔ **Prohibido su uso:** Queda estrictamente prohibida su reproducción total o parcial, modificación, distribución o uso para fines comerciales o académicos por parte de terceros sin la autorización expresa y por escrito del autor.

Este proyecto es el resultado de una evaluación académica para la Universidad de Huelva. <br>
El plagio o uso indebido de este código en otros proyectos académicos será reportado.
