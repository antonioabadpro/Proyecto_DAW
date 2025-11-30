<%@include file="templates/header.jspf"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="container">
    <div class="formularioContainer mx-auto my-4">
        <div class="formularioHeader">
            <i class="bi bi-car-front-fill"></i><strong> Modificar Vehículo #${requestScope.coche.idCoche}</strong>
        </div>

        <div class="formularioCuerpo">
            <form action="${pageContext.request.contextPath}/gestion/modificar/${requestScope.coche.idCoche}" method="POST" enctype="multipart/form-data">
                <!-- INFORMACIÓN BÁSICA -->
                <div class="mb-5">
                    <h3 class="tituloSeccion"><i class="bi bi-info-circle-fill"></i> Información Básica</h3>

                    <div class="row g-3">
                        <!-- Matrícula -->
                        <div class="col-md-3">
                            <label for="matricula" class="formularioLabel">
                                <i class="bi bi-card-text"></i> Matrícula<span class="obligatorio">*</span>
                            </label>
                            <input type="text" class="formularioInput w-50 soloLectura" id="matricula" value="${requestScope.coche.matricula}" name="matricula" maxlength="7" placeholder="Ej: 1234ABC" required>
                        </div>

                        <!-- Marca -->
                        <div class="col-md-3">
                            <label for="marca" class="formularioLabel">
                                <i class="bi bi-bookmark-fill"></i> Marca<span class="obligatorio">*</span>
                            </label>
                            <select class="formularioSelect w-auto" id="marca" name="marca" required>
                                <c:forEach var="marca" items="${requestScope.listaMarcas}">
                                    <c:choose>
                                        <c:when test="${marca.idMarca == requestScope.coche.marca.idMarca}">
                                            <option value="${marca.idMarca}" selected="true">
                                                ${marca.nombre}
                                            </option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${marca.idMarca}">
                                                ${marca.nombre}
                                            </option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Modelo -->
                        <div class="col-md-3">
                            <label for="nombreModelo" class="formularioLabel">
                                <i class="bi bi-book"></i> Modelo<span class="obligatorio">*</span>
                            </label>
                            <input type="text" class="formularioInput w-50" id="nombreModelo" value="${requestScope.coche.nombreModelo}" name="nombreModelo" placeholder="Ej: Focus" required>
                        </div>

                        <!-- Color -->
                        <div class="col-md-3">
                            <label for="color" class="formularioLabel">
                                <i class="bi bi-palette-fill"></i> Color<span class="obligatorio">*</span>
                            </label>
                            <input type="text" class="formularioInput w-50" id="color" value="${requestScope.coche.color}" name="color" placeholder="Ej: Rojo" required>
                        </div>

                        <!-- Descripción -->
                        <div class="col-12">
                            <label for="descripcion" class="formularioLabel">
                                <i class="bi bi-pencil-square"></i> Descripción
                            </label>
                            <textarea class="formularioInput w-100" id="descripcion" value="${requestScope.coche.descripcion}" name="descripcion" rows="3" placeholder="Descripción detallada del vehículo"></textarea>
                        </div>
                    </div>
                </div>

                <!-- CARACTERÍSTICAS TÉCNICAS -->
                <div class="mb-5">
                    <h3 class="tituloSeccion"><i class="bi bi-gear-fill"></i> Características Técnicas</h3>

                    <div class="row g-3">
                        <!-- Combustible -->
                        <div class="col-md-3">
                            <label for="combustible" class="formularioLabel">
                                <i class="bi bi-fuel-pump-fill"></i> Combustible<span class="obligatorio">*</span>
                            </label>
                            <select class="formularioSelect w-auto" id="combustible" name="combustible" required>
                                <option value="Gasolina" <c:if test="${requestScope.coche.combustible == 'Gasolina'}"> selected="true" </c:if> >Gasolina</option>
                                <option value="Diesel" <c:if test="${requestScope.coche.combustible == 'Diesel'}"> selected="true" </c:if> >Diésel</option>
                                <option value="Electrico" <c:if test="${requestScope.coche.combustible == 'Electrico'}"> selected="true" </c:if> >Eléctrico</option>
                                <option value="Hibrido" <c:if test="${requestScope.coche.combustible == 'Hibrido'}"> selected="true" </c:if> >Híbrido</option>
                                </select>
                            </div>

                            <!-- Consumo -->
                            <div class="col-md-3">
                                <label for="consumo" class="formularioLabel">
                                    <i class="bi bi-speedometer"></i> Consumo (L/100km)<span class="obligatorio">*</span>
                                </label>
                                <input type="number" class="formularioInput w-auto" id="consumo" value="${requestScope.coche.consumo}" name="consumo" min="0" max="100" step="0.1" placeholder="Ej: 5.5" required>
                        </div>

                        <!-- Potencia (CV) -->
                        <div class="col-md-3">
                            <label for="cv" class="formularioLabel">
                                <i class="bi bi-lightning-fill"></i> Potencia (CV)<span class="obligatorio">*</span>
                            </label>
                            <input type="number" class="formularioInput w-auto" value="${requestScope.coche.cv}" id="cv" min="1" name="cv" placeholder="Ej: 100" required>
                        </div>

                        <!-- Tipo de Cambio -->
                        <div class="col-md-3">
                            <label for="cajaCambios" class="formularioLabel">
                                <i class="bi bi-gear-wide-connected"></i> Tipo de Cambio<span class="obligatorio">*</span>
                            </label>
                            <select class="formularioSelect w-auto" id="cajaCambios" name="cajaCambios" required>
                                <option value="Manual" <c:if test="${requestScope.coche.cajaCambios == 'Manual'}"> selected="true" </c:if> >Manual</option>
                                <option value="Automatico" <c:if test="${requestScope.coche.cajaCambios == 'Automatico'}"> selected="true" </c:if> >Automático</option>
                                </select>
                            </div>

                            <!-- Kilómetros -->
                            <div class="col-md-3">
                                <label for="km" class="formularioLabel">
                                    <i class="bi bi-speedometer2"></i> Kilómetros<span class="obligatorio">*</span>
                                </label>
                                <input type="number" class="formularioInput w-auto" id="km" value="${requestScope.coche.km}" name="km" min="0" placeholder="0" required>
                        </div>

                        <!-- Año -->
                        <div class="col-md-3">
                            <label for="fecha" class="formularioLabel">
                                <i class="bi bi-calendar-event"></i> Año<span class="obligatorio">*</span>
                            </label>
                            <select class="formularioSelect w-auto" id="fecha" name="fecha" required>
                                <c:forEach var="anio" begin="1980" end="2025">
                                    <c:choose>
                                        <c:when test="${anio == requestScope.coche.fecha}">
                                            <option value="${2025 - anio + 1980}" selected="true">
                                                ${2025 - anio + 1980}
                                            </option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${2025 - anio + 1980}">
                                                ${2025 - anio + 1980}
                                            </option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Estado -->
                        <div class="col-md-4">
                            <label for="estado" class="formularioLabel">
                                <i class="bi bi-info-circle"></i> Estado<span class="obligatorio">*</span>
                            </label>
                            <select class="formularioSelect w-auto" id="estado" name="estado" required>
                                <option value="Nuevo" <c:if test="${requestScope.coche.estado == 'Nuevo'}"> selected="true" </c:if> >Nuevo</option>
                                <option value="ComoNuevo" <c:if test="${requestScope.coche.estado == 'ComoNuevo'}"> selected="true" </c:if> >Como Nuevo</option>
                                <option value="Usado" <c:if test="${requestScope.coche.estado == 'Usado'}"> selected="true" </c:if> >Usado</option>
                                <option value="PorReparar" <c:if test="${requestScope.coche.estado == 'PorReparar'}"> selected="true" </c:if> >Por Reparar</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <!-- PRECIO Y DESCUENTO -->
                    <div class="mb-5">
                        <h3 class="tituloSeccion">
                            <i class="bi bi-currency-euro"></i> Precio y Descuento</h3>

                        <div class="row g-3">
                            <!-- Precio -->
                            <div class="col-md-6">
                                <label for="precio" class="formularioLabel">
                                    <i class="bi bi-cash-stack"></i> Precio (€)<span class="obligatorio">*</span>
                                </label>
                                <input type="number" class="formularioInput w-25" id="precio" value="${requestScope.coche.precio}" name="precio" min="500" placeholder="Ej: 25000€" required>
                        </div>

                        <!-- Descuento -->
                        <div class="col-md-6">
                            <label for="descuento" class="formularioLabel">
                                <i class="bi bi-tag-fill"></i> Descuento (%) <span class="obligatorio">*</span>
                            </label>
                            <input type="number" class="formularioInput w-25" id="descuento" value="${requestScope.coche.descuento}" name="descuento" value="0" min="0" max="100" step="1">
                        </div>
                    </div>
                </div>

                <!-- IMÁGENES -->
                <div class="mb-4">
                    <h3 class="tituloSeccion">
                        <i class="bi bi-images"></i>
                        Imágenes del Vehículo
                    </h3>

                    <div class="seccionSubirImagen">
                        <p class="text-muted mb-3">
                            <i class="bi bi-info-circle"></i> Puede actualizar las imágenes (formatos: JPG, PNG). Si no selecciona ninguna, se mantendrá la actual.
                        </p>

                        <div class="row g-3">

                            <div class="col-md-6 subirImagen">
                                <label for="foto1" class="formularioLabel">
                                    <i class="bi bi-image"></i> Imagen 1 (Principal)
                                </label>

                                <c:if test="${not empty requestScope.coche.foto1}">
                                    <div class="mb-2">
                                        <small class="text-muted d-block">Imagen actual:</small>
                                        <img src="${pageContext.request.contextPath}/img_coches/${requestScope.coche.foto1}" alt="Foto 1" class="img-thumbnail">
                                    </div>
                                </c:if>

                                <input type="file" class="formularioInput" id="foto1" name="foto1" accept="image/*">
                            </div>

                            <div class="col-md-6 subirImagen">
                                <label for="foto2" class="formularioLabel">
                                    <i class="bi bi-image"></i> Imagen 2
                                </label>

                                <c:if test="${not empty requestScope.coche.foto2}">
                                    <div class="mb-2">
                                        <small class="text-muted d-block">Imagen actual:</small>
                                        <img src="${pageContext.request.contextPath}/img_coches/${requestScope.coche.foto2}" alt="Foto 2" class="img-thumbnail">
                                    </div>
                                </c:if>
                                <input type="file" class="formularioInput" id="foto2" name="foto2" accept="image/*">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Botones de Accion del Formulario -->
                <div class="botonFormulario">
                    <button type="submit" class="btn btn-primary btn-custom">Actualizar</button>
                    <button type="button" class="btn btn-secondary btn-custom" onclick="cerrarVista()">Cerrar</button>
                </div>
            </form>
        </div> 
    </div>
</div>

<%@include file="templates/footer.jspf"%>