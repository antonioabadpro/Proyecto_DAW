<%@include  file="templates/header.jspf"%>

<div class="login-card">
    <h3 class="text-center mb-4">Iniciar Sesión</h3>

    <form action="${pageContext.request.contextPath}/sesion/login" method="post">
        <div class="mb-3">
            <label for="usuario" class="form-label">Usuario</label>
            <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Introduce tu usuario" required>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Contraseña</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Introduce tu contraseña" required>
        </div>

        <button type="submit" class="btn btn-primary w-100">Entrar</button>

        <%-- Mensaje de error opcional --%>
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
        <div class="alert alert-danger mt-3 text-center">
            <%= error%>
        </div>
        <% }%>

        <p class="text-center mt-3 mb-0">
            ¿No tienes cuenta?
            <a href="${pageContext.request.contextPath}/sesion/registrar">Regístrate</a>
        </p>
    </form>
</div>

<%@include file="templates/footer.jspf"%>


