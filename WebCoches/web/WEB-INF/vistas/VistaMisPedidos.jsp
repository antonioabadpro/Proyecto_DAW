<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include  file="templates/header.jspf"%>

<div class="container mx-auto my-4">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3><i class="bi bi-bag-check-fill"></i> Mis Pedidos</h3>
        <a href="${pageContext.request.contextPath}/inicio" class="btn btn-secondary">
            <i class="bi bi-x-lg"></i> Cerrar
        </a>
    </div>

    <div class="card shadow-sm">
        <div class="card-body">
            <table class="table table-striped table-hover align-middle">
                <thead class="table-dark">
                    <tr class="text-center">
                        <th>Código del Pedido</th>
                        <th>Vehículo</th>
                        <th>Color</th>
                        <th>Dirección de Entrega</th>
                        <th>Precio Total</th>
                        <th>Estado de Compra</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty listaCompras}">
                            <c:forEach var="compra" items="${listaCompras}">
                                <tr class="text-center">
                                    <td class="fw-bold text-primary">
                                        ${compra.idCompra}${compra.coche.idCoche}${compra.usuario.idUsuario}
                                    </td>

                                    <td>
                                        <span class="fw-semibold">${compra.coche.marca.nombre} ${compra.coche.nombreModelo}</span>
                                    </td>

                                    <td>
                                        ${compra.coche.color}
                                    </td>

                                    <td>
                                        <small class="text-muted"><i class="bi bi-geo-alt-fill"></i> ${compra.usuario.direccion}</small>
                                    </td>

                                    <td class="fw-bold">
                                        <fmt:formatNumber value="${coche.precio * (1 - coche.descuento / 100)}" type="currency" currencySymbol="€"/> ${compra.coche.precio * (1 - compra.coche.descuento / 100)} €
                                    </td>

                                    <td>
                                        <span class="badge bg-success">Pagado</span>
                                    </td>
                                </tr>
                        </c:forEach>
                    </c:when>

                    <%-- Caso: No hay compras registradas --%>
                    <c:otherwise>
                        <tr>
                            <td colspan="6" class="text-center text-muted py-5">
                                <i class="bi bi-cart-x fs-2"></i>
                                <p class="mt-2">No has realizado ninguna compra todavía.</p>
                                <a href="${pageContext.request.contextPath}/inicio" class="btn btn-primary btn-sm mt-2">Ir al Inicio</a>
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
    </div>

    <div class="d-flex justify-content-end mt-3 d-md-none">
        <a href="vistaPrincipal.jsp" class="btn btn-secondary w-100">Volver a Inicio</a>
    </div>
</div>

<%@include file="templates/footer.jspf"%>