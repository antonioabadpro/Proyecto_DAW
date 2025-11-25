<%@include file="templates/header.jspf"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <div class="container">
        <div class="detail-card  mx-auto my-4">
            <div class="row g-0">
                <!-- Columna Izquierda: Carrusel de Imágenes -->
                <div class="col-lg-6">
                    <div id="carouselCoche" class="carousel slide carousel-container" data-bs-ride="carousel">
                                              
                        <!-- Indicadores -->
                        <div class="carousel-indicators">
                            <c:if test="${!empty requestScope.coche.foto1}">
                                <button type="button" data-bs-target="#carouselCoche" data-bs-slide-to="0" class="active"></button>
                            </c:if>
                            <c:if test="${!empty requestScope.coche.foto2}">
                                <button type="button" data-bs-target="#carouselCoche" data-bs-slide-to="1"></button>
                            </c:if>
                            
                        </div>
                        
                        <!-- Slides -->
                        <div class="carousel-inner">
                            <c:if test="${!empty requestScope.coche.foto1}">
                                <div class="carousel-item active">
                                    <img src="${pageContext.request.contextPath}/img_coches/${requestScope.coche.foto1}" class="d-block w-100" alt="Imagen 1 ${requestScope.coche.nombreModelo}">
                                </div>
                            </c:if>
                            <c:if test="${!empty requestScope.coche.foto2}">
                                <div class="carousel-item">
                                    <img src="${pageContext.request.contextPath}/img_coches/${requestScope.coche.foto2}" class="d-block w-100" alt="Imagen 2 ${requestScope.coche.nombreModelo}">
                                </div>
                            </c:if>
                            
                            
                            <!-- Imagen por defecto si no hay imágenes -->
                            <c:if test="${empty requestScope.coche.foto1 and empty requestScope.coche.foto2}">
                                <div class="carousel-item active">
                                    <img src="${pageContext.request.contextPath}/img_coches/no_coche.jpg" class="d-block w-100" alt="Sin coche">
                                </div>
                            </c:if>
                        </div>
                        
                        <!-- Controles -->
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselCoche" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Anterior</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselCoche" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Siguiente</span>
                        </button>
                    </div>
                </div>
                
                <!-- Columna Derecha: Información del Vehículo -->
                <div class="col-lg-6">
                    <div class="info-section">
                        <!-- Título y Matrícula -->
                        <h1 class="tituloCoche">${requestScope.coche.marca.nombre} ${requestScope.coche.nombreModelo}</h1>
                        <p class="matriculaCoche">
                            <i class="bi bi-card-text"></i> ${requestScope.coche.matricula}
                        </p>
                        
                        <!-- Sección de Precio -->
                        <div class="precioCoche">
                            <c:if test="${requestScope.coche.descuento > 0}">
                                <span class="elementoDescuento">
                                    <i class="bi bi-tag-fill"></i> -${requestScope.coche.descuento}%
                                </span>
                            </c:if>
                            
                            <div class="etiquetaPrecio">Precio</div>
                            <div class="valorPrecio">
                                <c:choose>
                                    <c:when test="${requestScope.coche.descuento > 0}">
                                        <fmt:formatNumber value="${requestScope.coche.precio * (1 - requestScope.coche.descuento / 100)}" type="currency" currencySymbol="€" maxFractionDigits="2"/>
                                        <div class="precioOriginal">
                                            <fmt:formatNumber value="${requestScope.coche.precio}" type="currency" currencySymbol="€" maxFractionDigits="2"/>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:formatNumber value="${requestScope.coche.precio}" type="currency" currencySymbol="€" maxFractionDigits="2"/>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        
                        <!-- Grid de Información -->
                        <div class="gridElementosInformacion">
                            <!-- Color -->
                            <div class="elementoInformacion">
                                <div class="etiquetaInformacion">
                                    <i class="bi bi-palette-fill"></i> Color
                                </div>
                                <div class="textoInformacion">${requestScope.coche.color}</div>
                            </div>
                            
                            <!-- Combustible -->
                            <div class="elementoInformacion">
                                <div class="etiquetaInformacion">
                                    <i class="bi bi-fuel-pump-fill"></i> Combustible
                                </div>
                                <div class="textoInformacion text-capitalize">${requestScope.coche.combustible}</div>
                            </div>
                            
                            <!-- Consumo -->
                            <div class="elementoInformacion">
                                <div class="etiquetaInformacion">
                                    <i class="bi bi-speedometer"></i> Consumo
                                </div>
                                <div class="textoInformacion">
                                    ${requestScope.coche.consumo != null ? requestScope.coche.consumo : 'N/A'} L/100km
                                </div>
                            </div>
                            <!-- CV -->
                            <div class="elementoInformacion">
                                <div class="etiquetaInformacion">
                                    <i class="bi bi-lightning"></i> Potencia
                                </div>
                                <div class="textoInformacion">
                                    ${requestScope.coche.cv != null ? requestScope.coche.cv : 'N/A'} CV
                                </div>
                            </div>
                            <!-- Kilómetros -->
                            <div class="elementoInformacion">
                                <div class="etiquetaInformacion">
                                    <i class="bi bi-speedometer2"></i> Kilómetros
                                </div>
                                <div class="textoInformacion">
                                    <fmt:formatNumber value="${requestScope.coche.km}" groupingUsed="true"/> km
                                </div>
                            </div>
                            
                            <!-- Tipo de Cambio -->
                            <div class="elementoInformacion">
                                <div class="etiquetaInformacion">
                                    <i class="bi bi-gear-fill"></i> Cambio
                                </div>
                                <div class="textoInformacion text-capitalize">${requestScope.coche.cajaCambios}</div>
                            </div>
                            
                            <!-- Año -->
                            <div class="elementoInformacion">
                                <div class="etiquetaInformacion">
                                    <i class="bi bi-calendar-event"></i> Año
                                </div>
                                <div class="textoInformacion">${requestScope.coche.fecha}</div>
                            </div>
                            
                            <!-- Estado -->
                            <div class="elementoInformacion">
                                <div class="etiquetaInformacion">
                                    <i class="bi bi-info-circle-fill"></i> Estado
                                </div>
                                <div class="textoInformacion">
                                    <c:choose>
                                        <c:when test="${requestScope.coche.estado == 'Nuevo'}">
                                            <span class="elementoEstado estadoNuevo">Nuevo</span>
                                        </c:when>
                                        <c:when test="${requestScope.coche.estado == 'ComoNuevo'}">
                                            <span class="elementoEstado estadoComoNuevo">Como Nuevo</span>
                                        </c:when>
                                        <c:when test="${requestScope.coche.estado == 'Usado'}">
                                            <span class="elementoEstado estadoUsado">Usado</span>
                                        </c:when>
                                        <c:when test="${requestScope.coche.estado == 'PorReparar'}">
                                            <span class="elementoEstado estadoPorReparar">Por Reparar</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="elementoEstado">${requestScope.coche.estado}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Pie del Card: Botones de Acción -->
            <div class="botonAccion">
                <div class="d-flex">
                    <form action="${pageContext.request.contextPath}/comprar/${requestScope.coche.idCoche}" method="GET">
                        <button type="submit" class="botonComprar">
                            <i class="bi bi-cart-check-fill"></i> Comprar Ahora
                        </button>
                    </form>
                    <a href="${pageContext.request.contextPath}/catalogo" class="botonCerrar d-flex align-items-center justify-content-center ms-4"><i class="bi bi-x-lg me-1"></i> Cerrar</a>
                </div>
            </div>
        </div>
    </div>

<%@include file="templates/footer.jspf"%>
