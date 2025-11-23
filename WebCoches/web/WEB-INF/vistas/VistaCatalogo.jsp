<%@page import="java.util.List"%>
<%@page import="modelos.Coche"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="templates/header.jspf"%>

<!-- ALBUM TIPO CARRUSEL -->
<div class="album py-5 bg-light">
    <div class="container">
        <div class="text-center mb-3">
            <div class="bg-dark text-white d-inline-block px-4 py-2 rounded w-100">
                <strong>CATÁLOGO DE VEHÍCULOS</strong>
            </div>
        </div>
        <c:if test="${!empty requestScope.listaCoches}">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <c:forEach var="coche" items="${requestScope.listaCoches}">
                    <div class="col">
                        <div class="card shadow-sm">
                            <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="${pageContext.request.contextPath}/img_coches/${coche.foto1}" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>${coche.nombreModelo}</title><rect width="100%" height="100%" fill="#55595c"/>
                            <div class="card-body">
                                <!-- Tí­tulo del vehí­culo -->
                                <h5 class="card-title">${coche.nombreModelo}</h5>

                                <!-- Precio destacado -->
                                <h6 class="text-danger mb-2">${coche.precio} €</h6>

                                <!-- Lista de caracterí­sticas -->
                                <ul class="list-unstyled small">
                                    <li><strong>Año: </strong>${coche.fecha}</li>
                                    <li><strong>Kilometraje: </strong>${coche.km}</li>
                                    <li><strong>Combustible: </strong>${coche.combustible}</li>
                                    <li><strong>Transmisión: </strong>${coche.cajaCambios}</li>
                                    <li><strong>Potencia: </strong>${coche.cv} CV</li>
                                </ul>

                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <a href="${pageContext.request.contextPath}/detalle/${coche.idCoche}" class="btn btn-sm btn-outline-secondary">Ver Detalle</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
        <!-- Botones -->
        <div class="d-flex justify-content-between mt-4">
            <a href="${pageContext.request.contextPath}/inicio" button class="btn btn-secondary btn-custom">Volver</a>
        </div>
    </div>
</div>

<%@include file="templates/footer.jspf"%>