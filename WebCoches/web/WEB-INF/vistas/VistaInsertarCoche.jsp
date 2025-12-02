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
                            <input id="matricula" type="text" class="formularioInput w-50 me-1" name="matricula" maxlength="7" placeholder="Ej: 1234ABC" required onblur="validarMatricula()">
                            <i id="checkMatricula" class="bi bi-check-circle-fill text-success d-none iconoFormulario"></i>
                            <i id="errorFormatoMatricula" class="bi bi-x-circle-fill text-danger d-none iconoFormulario" title="La Matricula NO cumple con el formato, debe tener 4 números seguidos de 3 letras en mayúscula"></i>
                            <i id="errorMatricula" class="bi bi-dash-circle text-danger d-none iconoFormulario" title="Ya existe un Coche con la matrícula introducida"></i>
                        </div>

                        <!-- Marca -->
                        <div class="col-md-3">
                            <label for="marca" class="formularioLabel">
                                <i class="bi bi-bookmark-fill"></i> Marca<span class="obligatorio">*</span>
                            </label>
                            <select id="marca" class="formularioSelect w-auto me-1" name="marca" required onblur="validarMarca()">
                                <option value="">Seleccione</option>
                                <c:forEach var="marca" items="${requestScope.listaMarcas}">
                                    <option value="${marca.idMarca}">
                                        ${marca.nombre}
                                    </option>
                                </c:forEach>
                            </select>
                            <i id="checkMarca" class="bi bi-check-circle-fill text-success d-none iconoFormulario"></i>
                            <i id="errorMarca" class="bi bi-x-circle-fill text-danger d-none iconoFormulario" title="Debes seleccionar una Marca"></i>
                        </div>
                        
                        <!-- Modelo -->
                        <div class="col-md-3">
                            <label for="nombreModelo" class="formularioLabel">
                                <i class="bi bi-book"></i> Modelo<span class="obligatorio">*</span>
                            </label>
                            <input id="nombreModelo" type="text" class="formularioInput w-50 me-1" name="nombreModelo" placeholder="Ej: Focus" required onblur="validarModelo()">
                            <i id="checkModelo" class="bi bi-check-circle-fill text-success d-none iconoFormulario"></i>
                            <i id="errorModelo" class="bi bi-x-circle-fill text-danger d-none iconoFormulario" title="El Modelo NO puede estar vacío"></i>
                        </div>

                        <!-- Color -->
                        <div class="col-md-3">
                            <label for="color" class="formularioLabel">
                                <i class="bi bi-palette-fill"></i> Color<span class="obligatorio">*</span>
                            </label>
                            <input id="color" type="text" class="formularioInput w-50 me-1" name="color" placeholder="Ej: Rojo" required onblur="validarColor()">
                            <i id="checkColor" class="bi bi-check-circle-fill text-success d-none iconoFormulario"></i>
                            <i id="errorColor" class="bi bi-x-circle-fill text-danger d-none iconoFormulario" title="El Color NO puede estar vacío"></i>
                        </div>

                        <!-- Descripción -->
                        <div class="col-12">
                            <label for="descripcion" class="formularioLabel">
                                <i class="bi bi-pencil-square"></i> Descripción
                            </label>
                            <textarea id="descripcion" class="formularioInput w-100" name="descripcion" rows="3" placeholder="Descripción detallada del vehículo" onblur="validarDescripcion()"></textarea>
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
                            <select id="combustible" class="formularioSelect w-auto me-1" name="combustible" required onblur="validarCombustible()">
                                <option value="">Seleccione</option>
                                <option value="Gasolina">Gasolina</option>
                                <option value="Diesel">Diésel</option>
                                <option value="Electrico">Eléctrico</option>
                                <option value="Hibrido">Híbrido</option>
                            </select>
                            <i id="checkCombustible" class="bi bi-check-circle-fill text-success d-none iconoFormulario"></i>
                            <i id="errorCombustible" class="bi bi-x-circle-fill text-danger d-none iconoFormulario" title="Debes seleccionar un Combustible"></i>
                        </div>

                        <!-- Consumo -->
                        <div class="col-md-3">
                            <label for="consumo" class="formularioLabel">
                                <i class="bi bi-speedometer"></i> Consumo (L/100km)<span class="obligatorio">*</span>
                            </label>
                            <input id="consumo" type="number" class="formularioInput w-auto me-1" name="consumo" min="0" max="100" step="0.1" placeholder="Ej: 5.5" required onblur="validarConsumo()">
                            <i id="checkConsumo" class="bi bi-check-circle-fill text-success d-none iconoFormulario"></i>
                            <i id="errorConsumo" class="bi bi-x-circle-fill text-danger d-none iconoFormulario" title="El Consumo NO puede estar vacío"></i>
                        </div>

                        <!-- Potencia (CV) -->
                        <div class="col-md-3">
                            <label for="cv" class="formularioLabel">
                                <i class="bi bi-lightning-fill"></i> Potencia (CV)<span class="obligatorio">*</span>
                            </label>
                            <input id="cv" type="number" class="formularioInput w-auto me-1" min="1" name="cv" placeholder="Ej: 100" required onblur="validarPotencia()">
                            <i id="checkPotencia" class="bi bi-check-circle-fill text-success d-none iconoFormulario"></i>
                            <i id="errorPotencia" class="bi bi-x-circle-fill text-danger d-none iconoFormulario" title="La Potencia NO puede estar vacío"></i>
                        </div>

                        <!-- Tipo de Cambio -->
                        <div class="col-md-3">
                            <label for="cajaCambios" class="formularioLabel">
                                <i class="bi bi-gear-wide-connected"></i> Tipo de Cambio<span class="obligatorio">*</span>
                            </label>
                            <select id="cajaCambios" class="formularioSelect w-auto me-1" name="cajaCambios" required onblur="validarTipoCambio()">
                                <option value="">Seleccione</option>
                                <option value="Manual">Manual</option>
                                <option value="Automatico">Automático</option>
                            </select>
                            <i id="checkCajaCambios" class="bi bi-check-circle-fill text-success d-none iconoFormulario"></i>
                            <i id="errorCajaCambios" class="bi bi-x-circle-fill text-danger d-none iconoFormulario" title="Debes seleccionar un Tipo de Cambio"></i>
                        </div>

                        <!-- Kilómetros -->
                        <div class="col-md-3">
                            <label for="km" class="formularioLabel">
                                <i class="bi bi-speedometer2"></i> Kilómetros<span class="obligatorio">*</span>
                            </label>
                            <input id="km" type="number" class="formularioInput w-auto me-1" name="km" min="0" placeholder="0" required onblur="validarKilometros()">
                            <i id="checkKm" class="bi bi-check-circle-fill text-success d-none iconoFormulario"></i>
                            <i id="errorKm" class="bi bi-x-circle-fill text-danger d-none iconoFormulario" title="Los Kilómetros NO pueden estar vacíos"></i>
                        </div>

                        <!-- Año -->
                        <div class="col-md-3">
                            <label for="fecha" class="formularioLabel">
                                <i class="bi bi-calendar-event"></i> Año<span class="obligatorio">*</span>
                            </label>
                            <select id="fecha" class="formularioSelect w-auto me-1" name="fecha" required onblur="validarFecha()">
                                <option value="">Seleccione</option>
                                <c:forEach var="anio" begin="1980" end="2025">
                                    <option value="${2025 - anio + 1980}">
                                        ${2025 - anio + 1980}
                                    </option>
                                </c:forEach>
                            </select>
                            <i id="checkFecha" class="bi bi-check-circle-fill text-success d-none iconoFormulario"></i>
                            <i id="errorFecha" class="bi bi-x-circle-fill text-danger d-none iconoFormulario" title="Debes seleccionar un Año"></i>
                        </div>

                        <!-- Estado -->
                        <div class="col-md-4">
                            <label for="estado" class="formularioLabel">
                                <i class="bi bi-info-circle"></i> Estado<span class="obligatorio">*</span>
                            </label>
                            <select id="estado" class="formularioSelect w-auto me-1" name="estado" required onblur="validarEstado()">
                                <option value="">Seleccione</option>
                                <option value="Nuevo">Nuevo</option>
                                <option value="ComoNuevo">Como Nuevo</option>
                                <option value="Usado">Usado</option>
                                <option value="PorReparar">Por Reparar</option>
                            </select>
                            <i id="checkEstado" class="bi bi-check-circle-fill text-success d-none iconoFormulario"></i>
                            <i id="errorEstado" class="bi bi-x-circle-fill text-danger d-none iconoFormulario" title="Debes seleccionar un Estado"></i>
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
                            <input id="precio" type="number" class="formularioInput w-25 me-1" name="precio" min="500" placeholder="Ej: 25000€" required onblur="validarPrecio()">
                            <i id="checkPrecio" class="bi bi-check-circle-fill text-success d-none iconoFormulario"></i>
                            <i id="errorPrecio" class="bi bi-x-circle-fill text-danger d-none iconoFormulario" title="El Precio debe ser un número positivo"></i>
                        </div>

                        <!-- Descuento -->
                        <div class="col-md-6">
                            <label for="descuento" class="formularioLabel">
                                <i class="bi bi-tag-fill"></i> Descuento (%) <span class="obligatorio">*</span>
                            </label>
                            <input id="descuento" type="number" class="formularioInput w-25 me-1" name="descuento" value="0" min="0" max="100" step="1" onblur="validarDescuento()">
                            <i id="checkDescuento" class="bi bi-check-circle-fill text-success d-none iconoFormulario"></i>
                            <i id="errorDescuento" class="bi bi-x-circle-fill text-danger d-none iconoFormulario" title="El Descuento debe ser un número positivo"></i>
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
                                <input id="foto1" type="file" class="formularioInput" name="foto1" accept="image/*">
                            </div>
                            <div class="col-md-6 subirImagen">
                                <label for="foto2" class="formularioLabel">
                                    <i class="bi bi-image"></i> Imagen 2
                                </label>
                                <input id="foto2" type="file" class="formularioInput" name="foto2" accept="image/*">
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