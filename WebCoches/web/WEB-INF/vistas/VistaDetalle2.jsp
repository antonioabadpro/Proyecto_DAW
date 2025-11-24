<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include  file="templates/header.jspf"%>
    
    <div class="container">
        <div class="tarjetaDetalle mx-auto my-4">
            <div class="row g-0">
                <!-- Columna Izquierda: Carrusel de Imágenes -->
                <div class="col-lg-6">
                    <div id="carouselCoche" class="carousel slide contenedorCarrusel" data-bs-ride="carousel">
                        <!-- Indicadores -->
                        <div class="indicadorCarrusel">
                            <c:if test="${not empty coche.foto1}">
                                <button type="button" data-bs-target="#carouselCoche" data-bs-slide-to="0" class="active"></button>
                            </c:if>
                            <c:if test="${not empty coche.foto2}">
                                <button type="button" data-bs-target="#carouselCoche" data-bs-slide-to="1"></button>
                            </c:if>
                        </div>
                        
                        <!-- Slides -->
                        <div class="carousel-inner">
                            <c:if test="${not empty coche.foto1}">
                                <div class="elementoCarrusel active">
                                    <img src="${pageContext.request.contextPath}/img_coches/${requestScope.coche.foto1}" class="d-block w-100" alt="Imagen 1">
                                </div>
                            </c:if>
                            <c:if test="${not empty coche.foto2}">
                                <div class="elementoCarrusel">
                                    <img src="${pageContext.request.contextPath}/img_coches/${requestScope.coche.foto1}" class="d-block w-100" alt="Imagen 2">
                                </div>
                            </c:if>
                            
                            <!-- Imagen por defecto si no hay imágenes -->
                            <c:if test="${empty coche.foto1 and empty coche.foto2}">
                                <div class="elementoCarrusel active">
                                    <img src="${pageContext.request.contextPath}/img_coches/logo_tonicar_2" class="d-block w-100" alt="Sin imagen">
                                </div>
                            </c:if>
                        </div>
                        
                        <!-- Controles -->
                        <button class="anteriorCarrusel" type="button" data-bs-target="#carouselCoche" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Anterior</span>
                        </button>
                        <button class="siguienteCarrusel" type="button" data-bs-target="#carouselCoche" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Siguiente</span>
                        </button>
                    </div>
                </div>
                
                <!-- Columna Derecha: Información del Vehículo -->
                <div class="col-lg-6">
                    <div class="info-section">
                        <!-- Título y Matrícula -->
                        <h1 class="tituloCoche">${coche.marca.nombre} ${coche.nombreModelo}</h1>
                        <p class="matriculaCoche">
                            <i class="bi bi-card-text"></i> ${coche.matricula}
                        </p>
                        
                        <!-- Sección de Precio -->
                        <div class="precioCoche">
                            <c:if test="${coche.descuento > 0}">
                                <span class="elementoDescuento">
                                    <i class="bi bi-tag-fill"></i> -${coche.descuento}%
                                </span>
                            </c:if>
                            
                            <div class="etiquetaPrecio">Precio</div>
                            <div class="valorPrecio">
                                <c:choose>
                                    <c:when test="${coche.descuento > 0}">
                                        <fmt:formatNumber value="${coche.precio * (1 - coche.descuento / 100)}" type="currency" currencySymbol="€" maxFractionDigits="0"/> ${coche.precio * (1 - coche.descuento / 100)} €
                                        <div class="precioOriginal">
                                            <fmt:formatNumber value="${coche.precio}" type="currency" currencySymbol="€" maxFractionDigits="0"/> ${coche.precio} €
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:formatNumber value="${coche.precio}" type="currency" currencySymbol="€" maxFractionDigits="0"/> ${coche.precio} €
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
                                <div class="textoInformacion">${coche.color}</div>
                            </div>
                            
                            <!-- Combustible -->
                            <div class="elementoInformacion">
                                <div class="etiquetaInformacion">
                                    <i class="bi bi-fuel-pump-fill"></i> Combustible
                                </div>
                                <div class="textoInformacion text-capitalize">${coche.combustible}</div>
                            </div>
                            
                            <!-- Consumo -->
                            <div class="elementoInformacion">
                                <div class="etiquetaInformacion">
                                    <i class="bi bi-speedometer"></i> Consumo
                                </div>
                                <div class="textoInformacion">
                                    ${coche.consumo != null ? coche.consumo : 'N/A'} L/100 Km
                                </div>
                            </div>
                            
                            <!-- Kilómetros -->
                            <div class="elementoInformacion">
                                <div class="etiquetaInformacion">
                                    <i class="bi bi-speedometer2"></i> Kilómetros
                                </div>
                                <div class="textoInformacion">
                                    <fmt:formatNumber value="${coche.km}" groupingUsed="true"/> ${coche.km}
                                </div>
                            </div>
                            
                            <!-- Tipo de Cambio -->
                            <div class="elementoInformacion">
                                <div class="etiquetaInformacion">
                                    <i class="bi bi-gear-fill"></i> Cambio
                                </div>
                                <div class="textoInformacion text-capitalize">${coche.cajaCambios}</div>
                            </div>
                            
                            <!-- Año -->
                            <div class="elementoInformacion">
                                <div class="etiquetaInformacion">
                                    <i class="bi bi-calendar-event"></i> Año
                                </div>
                                <div class="textoInformacion">${coche.fecha}</div>
                            </div>
                            
                            <!-- Estado -->
                            <div class="elementoInformacion">
                                <div class="etiquetaInformacion">
                                    <i class="bi bi-info-circle-fill"></i> Estado
                                </div>
                                <div class="textoInformacion">
                                    <c:choose>
                                        <c:when test="${coche.estado == 'Nuevo'}">
                                            <span class="elementoEstado estadoNuevo">Nuevo</span>
                                        </c:when>
                                        <c:when test="${coche.estado == 'ComoNuevo'}">
                                            <span class="elementoEstado estadoComoNuevo">Como Nuevo</span>
                                        </c:when>
                                        <c:when test="${coche.estado == 'Usado'}">
                                            <span class="elementoEstado estadoUsado">Usado</span>
                                        </c:when>
                                        <c:when test="${coche.estado == 'PorReparar'}">
                                            <span class="elementoEstado estadoUsado">Por Reparar</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="elementoEstado">${coche.estado}</span>
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
                <form action="vistaCompraCoche.jsp" method="POST" style="flex: 1;">
                    <input type="hidden" name="idCoche" value="${coche.idCoche}">
                    <button type="submit" class="btn botonComprar">
                        <i class="bi bi-cart-check-fill"></i> Comprar Ahora
                    </button>
                </form>
                <button type="button" class="btn botonCerrar" onclick="cerrarVista()">
                    <i class="bi bi-x-lg"></i> Cerrar
                </button>
            </div>
        </div>
    </div>
    
<%@include  file="templates/footer.jspf"%>
