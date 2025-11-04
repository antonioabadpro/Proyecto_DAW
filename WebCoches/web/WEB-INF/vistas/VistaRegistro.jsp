<%-- 
    Document   : VistaRegistro
    Created on : 3 nov 2025, 20:10:42
    Author     : AAHG-PORTATIL
--%>
<%@include file="header.jspf"%>

    <div class="register-card">
    <h3 class="text-center mb-4">Crear Cuenta</h3>

    <form action="${pageContext.request.contextPath}/sesion/registrar" method="post">

        <div class="mb-3">
            <label for="nombre" class="form-label">Nombre completo</label>
            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ej. Antonio Abad" required>
        </div>

        <div class="mb-3">
            <label for="dni" class="form-label">DNI</label>
            <input type="text" class="form-control" id="dni" name="dni" placeholder="12345678A" required pattern="[0-9]{8}[A-Za-z]{1}">
        </div>

            <div class="mb-3">
                <label for="correo" class="form-label">Correo electrónico</label>
                <input type="email" class="form-control" id="correo" name="correo" placeholder="ejemplo@correo.com" required>
            </div>

            <div class="mb-3">
                <label for="telefono" class="form-label">Teléfono</label>
                <input type="tel" class="form-control" id="telefono" name="telefono" placeholder="600123456" required pattern="[0-9]{9}">
            </div>

            <div class="mb-3">
                <label for="direccion" class="form-label">Dirección</label>
                <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Calle, número, ciudad" required>
            </div>

            <button type="submit" class="btn btn-primary w-100 mt-3">Registrarse</button>

            <%-- Mensaje de error opcional --%>
            <%
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
            <div class="alert alert-danger mt-3 text-center">
                <%= error %>
            </div>
            <% } %>

            <p class="text-center mt-3 mb-0">
                ¿Ya tienes cuenta?
                <a href="${pageContext.request.contextPath}/sesion/login">Inicia sesión</a>
            </p>
        </form>
    </div>
</body>

<%@include file="footer.jspf"%>
