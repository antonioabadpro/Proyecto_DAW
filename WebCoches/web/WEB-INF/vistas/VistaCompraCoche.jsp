<%@include file="templates/header.jspf"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- VARIABLES PARA EL CÁLCULO DEL DESCUENTO (%) Y EL PRECIO FINAL CON DESCUENTO-->     
<c:set var="precioBase" value="${coche.precio}" />
<c:set var="descuentoValor" value="${precioBase * (coche.descuento / 100)}" />
<c:set var="descuento" value="${(coche.descuento / 100)}" />
<c:set var="precioConDescuento" value="${precioBase - descuentoValor}" />

<div class="container col-md-6">
    <div class="container-md-6 mt-4 mb-4 tarjetaCarrito">
        <div class="row"> <!-- Fila Cabecera de Factura y Logo -->
            <div class="col-12 text-center">
                <div class="bg-dark text-white d-inline-block px-4 py-2 rounded w-100"><strong>RESUMEN DE FACTURA</strong>
                </div>
                <img src="${pageContext.request.contextPath}/imagenes/logo_tonicar_3.jpg" alt="Logo Empresa" class="mt-4 mb-4" style="max-width: 150px;">
            </div>
        </div>
        <!-- Cuerpo de la factura -->     
        <!-- Subcolumnas para conceptos -->
        <div class="container-fluid mb-4">
            <div class="row text-start"> <!-- Texto justificado a la izquierda -->
                <!-- Subcolumna izquierda: Conceptos -->
                <div class="col-6 text-start">
                    <div>Matrícula del vehículo</div>
                    <div>Marca</div>
                    <div>Modelo</div>
                    <div>Año</div>
                    <div>Potencia</div>
                    <div>Combustible</div>
                    <div>Transmisión</div>
                    <div>Color</div>
                    <div>Precio sin Descuento</div>
                    <div>Descuento ( <strong><fmt:formatNumber value="${descuento}" type="percent"/></strong> )</div>
                    <hr>
                    <div class="mt-2"><strong>Precio Total :</strong></div>
                </div>
                <!-- Subcolumna derecha: Valores -->
                <div class="col-6 text-end"> <!-- Texto justificado a la derecha -->
                    <div>${requestScope.coche.matricula}</div>
                    <div>${requestScope.coche.marca.nombre}</div>
                    <div>${requestScope.coche.nombreModelo}</div>
                    <div>${requestScope.coche.fecha}</div>
                    <div>${requestScope.coche.cv} CV</div>
                    <div>${requestScope.coche.combustible}</div>
                    <div>${requestScope.coche.cajaCambios}</div>
                    <div>${requestScope.coche.color}</div>
                    <div><fmt:formatNumber value="${precioBase}" type="currency" currencySymbol="€"/></div>
                    <div><fmt:formatNumber value="${descuentoValor}" type="currency" currencySymbol="€" /></div>
                    <hr>
                    <h6 class="text-danger mb-2"><fmt:formatNumber value="${precioConDescuento}" type="currency" currencySymbol="€"/></h6>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 text-center">
                <a href="${pageContext.request.contextPath}/confirmarCompra/${requestScope.coche.idCoche}/${sessionScope.usuarioLogueado.idUsuario}" button class="btn btn-primary btn-custom" name="confirmar">Confirmar el Pago</a>
                <a href="${pageContext.request.contextPath}/catalogo" target="_self" button class="btn btn-secondary">Cerrar</a>
            </div>
        </div>
    </div>

</div>

<%@include file="templates/footer.jspf"%>