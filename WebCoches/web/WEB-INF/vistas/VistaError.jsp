<%@page isErrorPage="true" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="templates/header.jspf"%>

<div class="tarjetaError">
    <div class="errorHeader">
        <h2 class="m-0"><i class="bi bi-shield-exclamation"></i> ¡Vaya!</h2>
        <small>Ha ocurrido un problema</small>
    </div>

    <div class="errorBody">
        <div class="errorIcono">
            <img class="logoTonicar" src="${pageContext.request.contextPath}/imagenes/logo_tonicar_2.jpg">
        </div>

        <%
            // Lógica para capturar el código de estado (ej. 404, 500)
            Integer codError = (Integer) request.getAttribute("jakarta.servlet.error.status_code");
            // Capturar el mensaje de excepción
            String msjError = (String) request.getAttribute("jakarta.servlet.error.message");
            
            // Capturamos la excepcion si la hay
            Throwable excepcion = (Throwable) request.getAttribute("jakarta.servlet.error.exception");

            // Valores por defecto si no hay error capturado (acceso directo)
            if (codError == null) {
                codError = 0;
            }
            if (msjError == null)
                msjError = "Error desconocido.";
        %>

        <div class="codigoError">
            CÓDIGO DE ERROR: <%= codError %>    
        </div>

        <div class="mensajeError">
            <%= msjError%>
            <% if (excepcion != null) {%>
            <br><small class="text-muted"><%= exception.getClass().getSimpleName()%></small>
            <% }%>
        </div>

        <hr class="my-4">

        <div class="d-grid gap-2">
            <a href="${pageContext.request.contextPath}/inicio" class="btn btn-dark btn-lg">
                <i class="bi bi-house-door-fill"></i> Volver al Inicio
            </a>
        </div>
    </div>
</div>

<%@include file="templates/footer.jspf"%>