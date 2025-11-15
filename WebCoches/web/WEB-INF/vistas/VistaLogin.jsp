<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="templates/header.jspf"%>
<div  class="container-fluid notebook-paper">
    <!-- Encabezado -->
    <div class="container mb-3">
        <div class="row">
            <div class="col text-center">
                <div class="bg-dark text-white d-inline-block px-4 py-2 rounded w-100">
                    <strong>INICIO DE SESIÓN</strong>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <form name="formSesion" method="POST" action="${pageContext.request.contextPath}/sesion/login">
                    <div class="mb-3">
                        <label for="formGroupExampleInput" class="form-label">Usuario:</label>
                        <input type="text" class="form-control" name="nomUsuario" id="nomUsuario" placeholder="Usuario">
                    </div>
                    <div class="mb-3">
                        <label for="formGroupExampleInput" class="form-label">Contraseña:</label>
                        <input type="password" class="form-control" name="password" id="password" placeholder="Contraseña">
                    </div>
                    <div class="mb-3">
                        <input type="submit" button class="btn btn-primary btn-custom" name="enviaSesion" value="Iniciar Sesión">
                    </div>
                    <hr>
                    <div class="mb-3">
                        <h5 class="h5">¿Aún no estás registrado?</h4>
                            <a href="${pageContext.request.contextPath}/sesion/registrar" button class="btn btn-primary btn-custom">Registrarse</a>
                            <a href="${pageContext.request.contextPath}/inicio" button class="btn btn-secondary btn-custom">Cerrar</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@include  file="templates/footer.jspf"%>