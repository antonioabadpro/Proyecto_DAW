<%@include file="templates/header.jspf"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="container">
    <div class="formularioContainer mx-auto my-4">
        <div class="formularioHeader">
            <i class="bi bi-car-front-fill"></i><strong> Alta de Vehículo</strong>
        </div>
        
        <div class="formularioCuerpo">
            <form action="${pageContext.request.contextPath}/gestion/insertar" method="POST" enctype="multipart/form-data">
                <!-- INFORMACIÓN BÁSICA -->
                <div class="mb-5">
                    <h3 class="tituloSeccion"><i class="bi bi-info-circle-fill"></i> Información Básica</h3>

                    <div class="row g-3">
                        <!-- Matrícula -->
                        <div class="col-md-3">
                            <label for="matricula" class="formularioLabel">
                                <i class="bi bi-card-text"></i> Matrícula<span class="obligatorio">*</span>
                            </label>
                            <input type="text" class="formularioInput w-50" id="matricula" name="matricula" maxlength="7" placeholder="Ej: 1234ABC" required>
                        </div>

                        <!-- Marca -->
                        <div class="col-md-3">
                            <label for="marca" class="formularioLabel">
                                <i class="bi bi-bookmark-fill"></i> Marca<span class="obligatorio">*</span>
                            </label>
                            <select class="formularioSelect w-auto" id="marca" name="marca" required>
                                <option value="">Seleccione</option>
                                <c:forEach var="marca" items="${requestScope.listaMarcas}">
                                    <option value="${marca.idMarca}">
                                        ${marca.nombre}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        
                        <!-- Modelo -->
                        <div class="col-md-3">
                            <label for="modelo" class="formularioLabel">
                                <i class="bi bi-book"></i> Modelo<span class="required">*</span>
                            </label>
                            <input type="text" class="formularioInput w-50" id="modelo" name="modelo" placeholder="Ej: Focus" required>
                        </div>

                        <!-- Color -->
                        <div class="col-md-3">
                            <label for="color" class="formularioLabel">
                                <i class="bi bi-palette-fill"></i> Color<span class="obligatorio">*</span>
                            </label>
                            <input type="text" class="formularioInput w-50" id="color" name="color" placeholder="Ej: Rojo" required>
                        </div>

                        <!-- Descripción -->
                        <div class="col-12">
                            <label for="descripcion" class="formularioLabel">
                                <i class="bi bi-pencil-square"></i> Descripción
                            </label>
                            <textarea class="formularioInput w-100" id="descripcion" name="descripcion" rows="3" placeholder="Descripción detallada del vehículo"></textarea>
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
                                <option value="">Seleccione</option>
                                <option value="Gasolina">Gasolina</option>
                                <option value="Diesel">Diésel</option>
                                <option value="Electrico">Eléctrico</option>
                                <option value="Hibrido">Híbrido</option>
                            </select>
                        </div>

                        <!-- Consumo -->
                        <div class="col-md-3">
                            <label for="consumo" class="formularioLabel">
                                <i class="bi bi-speedometer"></i> Consumo (L/100km)<span class="obligatorio">*</span>
                            </label>
                            <input type="number" class="formularioInput w-auto" id="consumo" name="consumo" min="0" max="100" step="0.1" placeholder="Ej: 5.5" required>
                        </div>

                        <!-- Potencia (CV) -->
                        <div class="col-md-3">
                            <label for="cv" class="formularioLabel">
                                <i class="bi bi-lightning-fill"></i> Potencia (CV)<span class="obligatorio">*</span>
                            </label>
                            <input type="number" class="formularioInput w-auto" id="cv" min="1" name="cv" placeholder="Ej: 100" required>
                        </div>

                        <!-- Tipo de Cambio -->
                        <div class="col-md-3">
                            <label for="cambio" class="formularioLabel">
                                <i class="bi bi-gear-wide-connected"></i> Tipo de Cambio<span class="obligatorio">*</span>
                            </label>
                            <select class="formularioSelect w-auto" id="cajaCambios" name="cajaCambios" required>
                                <option value="">Seleccione</option>
                                <option value="Manual">Manual</option>
                                <option value="Automatico">Automático</option>
                            </select>
                        </div>

                        <!-- Kilómetros -->
                        <div class="col-md-3">
                            <label for="kilometros" class="formularioLabel">
                                <i class="bi bi-speedometer2"></i> Kilómetros<span class="obligatorio">*</span>
                            </label>
                            <input type="number" class="formularioInput w-auto" id="km" name="km" min="0" placeholder="0" required>
                        </div>

                        <!-- Año -->
                        <div class="col-md-3">
                            <label for="año" class="formularioLabel">
                                <i class="bi bi-calendar-event"></i> Año<span class="obligatorio">*</span>
                            </label>
                            <select class="formularioSelect w-auto" id="fecha" name="fecha" required>
                                <option value="">Seleccione</option>
                                <c:forEach var="anio" begin="1980" end="2025">
                                    <option value="${2025 - anio + 1980}">
                                        ${2025 - anio + 1980}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Estado -->
                        <div class="col-md-4">
                            <label for="estado" class="formularioLabel">
                                <i class="bi bi-info-circle"></i> Estado<span class="obligatorio">*</span>
                            </label>
                            <select class="formularioSelect w-auto" id="estado" name="estado" required>
                                <option value="">Seleccione</option>
                                <option value="Nuevo">Nuevo</option>
                                <option value="ComoNuevo">Como Nuevo</option>
                                <option value="Usado">Usado</option>
                                <option value="PorReparar">Por Reparar</option>
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
                            <input type="number" class="formularioInput w-25" id="precio" name="precio" min="500" placeholder="Ej: 25000€" required>
                        </div>

                        <!-- Descuento -->
                        <div class="col-md-6">
                            <label for="descuento" class="formularioLabel">
                                <i class="bi bi-tag-fill"></i> Descuento (%)</label>
                            <input type="number" class="formularioInput w-25" id="descuento" name="descuento" value="0" min="0" max="100" step="1">
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
                            <i class="bi bi-info-circle"></i> Puede subir hasta 2 imágenes del vehículo (formatos: JPG, PNG, máx. 5MB)
                        </p>

                        <div class="row g-3">
                            <div class="col-md-6 subirImagen">
                                <label for="foto1" class="formularioLabel">
                                    <i class="bi bi-image"></i> Imagen 1 (Principal)
                                </label>
                                <input type="file" class="formularioInput" id="foto1" name="foto1" accept="image/*">
                            </div>

                            <div class="col-md-6 subirImagen">
                                <label for="foto2" class="formularioLabel">
                                    <i class="bi bi-image"></i> Imagen 2
                                </label>
                                <input type="file" class="formularioInput" id="foto2" name="foto2" accept="image/*">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Botones de Accion del Formulario -->
                <div class="botonFormulario">
                    <button type="submit" class="btn btn-primary btn-custom ">Guardar</button>
                    <button type="button" class="btn btn-warning btn-custom" onclick="limpiarFormulario()">Limpiar</button>
                    <button type="button" class="btn btn-secondary btn-custom" onclick="cerrarVista()">Cerrar</button>
                </div>
            </form>
        </div> 
    </div>
</div>

<%@include file="templates/footer.jspf"%>