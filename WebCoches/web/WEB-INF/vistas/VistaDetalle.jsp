<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include  file="templates/header.jspf"%>

<div class="container">
    <!-- Encabezado -->
    <div class="text-center mb-3">
        <div class="bg-dark text-white d-inline-block px-4 py-2 rounded w-100">
            <strong>DETALLE DEL VEHÍCULO</strong>
        </div>
    </div>

    <!-- Contenedor 2x2 con zonas diferenciadas -->

    <div class="row g-2 mb-3">
        <!-- Zona 1: Imagen del vehi­culo -->
        <div class="col-6">
            <c:if test="${!empty requestScope.coche.foto1}">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    </div>
                    <div class="anchoCarrusel">
                        <div class="elementoCarrusel active">
                            <img src="${pageContext.request.contextPath}/img_coches/${requestScope.coche.foto1}" class="d-block w-100" alt="Imagen 1 ${requestScope.coche.nombreModelo}">
                        </div>
                        <c:if test="${!empty requestScope.coche.foto2}">
                            <div class="anchoCarrusel">
                                <div class="elementoCarrusel active">
                                    <img src="${pageContext.request.contextPath}/img_coches/${requestScope.coche.foto2}" class="d-block w-100" alt="Imagen 2 ${requestScope.coche.nombreModelo}">
                                </div>
                            </div>
                        </c:if>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
            </c:if>

            <!-- Zona 2: Prueba del vehí­culo -->
            <div class="col-6">
                <div class="border p-3 mb-3 rounded bg-light">
                    <div class="zone">
                        <form name="formDatosVehiculo" method="GET" action="${pageContext.request.contextPath}/comprar/${requestScope.coche.idCoche}" target="_self">
                            <!-- Lista de caracteri­sticas -->
                            <ul class="list-unstyled small">
                                <li><strong>Precio: </strong>${requestScope.coche.precio} €</li>
                                <li><strong>Descuento: </strong>${requestScope.coche.descuento} %</li>
                                <li><strong>Modelo: </strong>${requestScope.coche.nombreModelo}</li>
                                <li><strong>Matrícula: </strong>${requestScope.coche.matricula}</li>
                                <li><strong>Descripción: </strong>${requestScope.coche.descripcion}</li>
                                <li><strong>Color: </strong>${requestScope.coche.color}</li>
                                <li><strong>Año: </strong>${requestScope.coche.fecha}</li>
                                <li><strong>Kilometraje: </strong>${requestScope.coche.km}</li>
                                <li><strong>Combustible: </strong>${requestScope.coche.combustible}</li>
                                <li><strong>Transmisión: </strong>${requestScope.coche.cajaCambios}</li>
                                <li><strong>Potencia: </strong>${requestScope.coche.cv} CV</li>
                                <li><strong>Consumo: </strong>${requestScope.coche.consumo} L/100</li>
                                <li><strong>Estado: </strong>${requestScope.coche.estado}</li>
                            </ul>
                    </div>  
                </div>   
            </div>
            <!-- Botones -->
            <div class="row g-2 mg-3">
                <div class="col-12">
                    <div class="d-flex justify-content-between mt-4">
                        <a href="${pageContext.request.contextPath}/catalogo" class="btn btn-secondary btn-custom">CANCELAR</a>
                        <input type="submit" class="btn btn-primary btn-custom" value="COMPRAR">
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%@include  file="templates/footer.jspf"%>  