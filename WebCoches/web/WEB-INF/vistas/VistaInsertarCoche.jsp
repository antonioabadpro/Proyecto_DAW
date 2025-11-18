<%@include file="templates/header.jspf"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="container">
    <div class="form-container">
        <!-- Header -->
        <div class="form-header">
            <i class="bi bi-car-front-fill"></i><strong> Alta de Vehículo</strong>
        </div>

        <!-- Form Body -->
        <div class="form-body">
            <form action="${pageContext.request.contextPath}/gestion/insertar" method="POST" id="formAltaCoche" enctype="multipart/form-data">
                <!-- Sección: INFORMACION BÁSICA -->
                <div class="mb-5">
                    <h3 class="section-title">
                        <i class="bi bi-info-circle-fill"></i>
                        Información Básica
                    </h3>

                    <div class="row g-3">
                        <!-- Matrícula -->
                        <div class="col-md-4">
                            <label for="matricula" class="form-label">
                                <i class="bi bi-card-text"></i>
                                Matrícula<span class="required">*</span>
                            </label>
                            <input type="text" class="form-control w-50" id="matricula" 
                                   name="matricula" maxlength="7" placeholder="Ej: 1234ABC" required>
                        </div>

                        <!-- Marca -->
                        <div class="col-md-4">
                            <label for="marca" class="form-label">
                                <i class="bi bi-bookmark-fill"></i>
                                Marca<span class="required">*</span>
                            </label>
                            <select class="form-select w-auto" id="marca" name="marca" required>
                                <option value="">Seleccione una</option>
                                <c:forEach var="marca" items="${marcas}">
                                    <option value="${marca.idMarca}">${marca.nombre}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Color -->
                        <div class="col-md-4">
                            <label for="color" class="form-label">
                                <i class="bi bi-palette-fill"></i>
                                Color<span class="required">*</span>
                            </label>
                            <input type="text" class="form-control w-auto" id="color" 
                                   name="color" placeholder="Ej: Rojo" required>
                        </div>

                        <!-- Descripción -->
                        <div class="col-12">
                            <label for="descripcion" class="form-label">
                                <i class="bi bi-pencil-square"></i>
                                Descripción<span class="required">*</span>
                            </label>
                            <textarea class="form-control" id="descripcion" name="descripcion" 
                                      rows="3" placeholder="Descripción detallada del vehículo" required></textarea>
                        </div>
                    </div>
                </div>

                <!-- Sección: CARACTERISTICAS TÉCNICAS -->
                <div class="mb-5">
                    <h3 class="section-title">
                        <i class="bi bi-gear-fill"></i>
                        Características Técnicas
                    </h3>

                    <div class="row g-3">
                        <!-- Combustible -->
                        <div class="col-md-3">
                            <label for="combustible" class="form-label">
                                <i class="bi bi-fuel-pump-fill"></i>
                                Combustible<span class="required">*</span>
                            </label>
                            <select class="form-select w-auto" id="combustible" name="combustible" required>
                                <option value="">Seleccione</option>
                                <option value="Gasolina">Gasolina</option>
                                <option value="Diesel">Diésel</option>
                                <option value="Electrico">Eléctrico</option>
                                <option value="Hibrido">Híbrido</option>
                            </select>
                        </div>

                        <!-- Consumo -->
                        <div class="col-md-3">
                            <label for="consumo" class="form-label">
                                <i class="bi bi-speedometer"></i>
                                Consumo (L/100km)<span class="required">*</span>
                            </label>
                            <input type="number" class="form-control w-auto" id="consumo" 
                                   name="consumo" step="0.1" placeholder="Ej: 5.5" required>
                        </div>

                        <!-- Potencia (CV) -->
                        <div class="col-md-3">
                            <label for="cv" class="form-label">
                                <i class="bi bi-lightning-fill"></i>
                                Potencia (CV)<span class="required">*</span>
                            </label>
                            <input type="number" class="form-control w-auto" id="cv" 
                                   name="cv" placeholder="Ej: 150" required>
                        </div>

                        <!-- Tipo de Cambio -->
                        <div class="col-md-3">
                            <label for="cambio" class="form-label">
                                <i class="bi bi-gear-wide-connected"></i>
                                Tipo de Cambio<span class="required">*</span>
                            </label>
                            <select class="form-select w-auto" id="cambio" name="cambio" required>
                                <option value="">Seleccione</option>
                                <option value="Manual">Manual</option>
                                <option value="Automatico">Automático</option>
                            </select>
                        </div>

                        <!-- Kilómetros -->
                        <div class="col-md-3">
                            <label for="kilometros" class="form-label">
                                <i class="bi bi-speedometer2"></i>
                                Kilómetros<span class="required">*</span>
                            </label>
                            <input type="number" class="form-control w-auto" id="kilometros" 
                                   name="kilometros" placeholder="Ej: 50000" required>
                        </div>

                        <!-- Año -->
                        <div class="col-md-3">
                            <label for="año" class="form-label">
                                <i class="bi bi-calendar-event"></i>
                                Año<span class="required">*</span>
                            </label>
                            <select class="form-select w-auto" id="año" name="año" required>
                                <option value="">Seleccione</option>
                                <c:forEach var="year" begin="1980" end="2025">
                                    <option value="${2025 - year + 1980}">${2025 - year + 1980}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Estado -->
                        <div class="col-md-4">
                            <label for="estado" class="form-label">
                                <i class="bi bi-info-circle"></i>
                                Estado<span class="required">*</span>
                            </label>
                            <select class="form-select w-auto" id="estado" name="estado" required>
                                <option value="">Seleccione</option>
                                <option value="nuevo">Nuevo</option>
                                <option value="como_nuevo">Como Nuevo</option>
                                <option value="usado">Usado</option>
                                <option value="por_reparar">Por Reparar</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Sección: PRECIO Y DESCUENTO -->
                <div class="mb-5">
                    <h3 class="section-title">
                        <i class="bi bi-currency-euro"></i>
                        Precio y Descuento
                    </h3>

                    <div class="row g-3">
                        <!-- Precio -->
                        <div class="col-md-6">
                            <label for="precio" class="form-label">
                                <i class="bi bi-cash-stack"></i>
                                Precio (€)<span class="required">*</span>
                            </label>
                            <input type="number" class="form-control w-25" id="precio" 
                                   name="precio" min="1000" max="500000" step="2500" placeholder="Ej: 25000.00" required>
                        </div>

                        <!-- Descuento -->
                        <div class="col-md-6">
                            <label for="descuento" class="form-label">
                                <i class="bi bi-tag-fill"></i>
                                Descuento (%)
                            </label>
                            <input type="number" class="form-control w-25" id="descuento" 
                                   name="descuento" min="0" max="100" step="1" 
                                   placeholder="Ej: 10" value="0">
                        </div>
                    </div>
                </div>

                <!-- Sección: Imágenes -->
                <div class="mb-4">
                    <h3 class="section-title">
                        <i class="bi bi-images"></i>
                        Imágenes del Vehículo
                    </h3>

                    <div class="image-upload-section">
                        <p class="text-muted mb-3">
                            <i class="bi bi-info-circle"></i> 
                            Puede subir hasta 2 imágenes del vehículo (formatos: JPG, PNG, máx. 5MB)
                        </p>

                        <div class="row g-3">
                            <div class="col-md-6 image-upload-item">
                                <label for="imagen1" class="form-label">
                                    <i class="bi bi-image"></i> Imagen 1 (Principal)
                                </label>
                                <input type="file" class="form-control" id="imagen1" 
                                       name="imagen1" accept="image/*">
                            </div>

                            <div class="col-md-6 image-upload-item">
                                <label for="imagen2" class="form-label">
                                    <i class="bi bi-image"></i> Imagen 2
                                </label>
                                <input type="file" class="form-control" id="imagen2" 
                                       name="imagen2" accept="image/*">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- BOTONES DE ACCIÓN  -->
                <div class="btn-group-form">
                    <button type="submit" class="btn btn-primary btn-custom ">Guardar</button>
                    <button type="button" class="btn btn-warning btn-custom" onclick="limpiarFormulario()">Limpiar</button>
                    <button type="button" class="btn btn-secondary btn-custom" onclick="cerrarVista()">Cerrar</button>
                </div>
            </form>
        </div> 
    </div>
</div>

<%@include file="templates/footer.jspf"%>