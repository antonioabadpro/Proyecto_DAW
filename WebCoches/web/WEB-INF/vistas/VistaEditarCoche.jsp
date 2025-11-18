<!--<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>-->
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Vehículo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="css/estilo_CRUD_Coche.css">
    
</head>
<body>
    <div class="container">
        <div class="form-container">
            <div class="form-header">
                <h1><i class="bi bi-pencil-square"></i> Editar Vehículo ID: ${coche.matricula}</h1>
            </div>
            
            <div class="form-body">
                <form action="controladorEditaCoche.java" method="POST" id="formEditaCoche" enctype="multipart/form-data">
                    
                    <input type="hidden" name="idCoche" value="${coche.idCoche}">
                    
                    <div class="mb-5">
                        <h3 class="section-title">
                            <i class="bi bi-info-circle-fill"></i>
                            Información Básica
                        </h3>
                        
                        <div class="row g-3">
                            <div class="col-md-4">
                                <label for="matricula" class="form-label">
                                    <i class="bi bi-card-text"></i>
                                    Matrícula<span class="required">*</span>
                                </label>
                                <input type="text" class="form-control" id="matricula" 
                                       name="matricula" value="${coche.matricula}" required **readonly**>
                                <small class="text-muted">La matrícula no puede ser modificada.</small>
                            </div>
                            
                            <div class="col-md-4">
                                <label for="marca" class="form-label">
                                    <i class="bi bi-bookmark-fill"></i>
                                    Marca<span class="required">*</span>
                                </label>
                                <select class="form-select" id="marca" name="marca" required>
                                    <option value="">Seleccione una marca</option>
                                    <c:forEach var="marca" items="${marcas}">
                                        <option value="${marca.idMarca}" 
                                            ${coche.idMarca == marca.idMarca ? 'selected' : ''}>
                                            ${marca.nombre}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            
                            <div class="col-md-4">
                                <label for="color" class="form-label">
                                    <i class="bi bi-palette-fill"></i>
                                    Color<span class="required">*</span>
                                </label>
                                <input type="text" class="form-control" id="color" 
                                       name="color" value="${coche.color}" required>
                            </div>
                            
                            <div class="col-12">
                                <label for="descripcion" class="form-label">
                                    <i class="bi bi-pencil-square"></i>
                                    Descripción<span class="required">*</span>
                                </label>
                                <textarea class="form-control" id="descripcion" name="descripcion" rows="3" required>${coche.descripcion}</textarea>
                            </div>
                        </div>
                    </div>
                    
                    <div class="mb-5">
                        <h3 class="section-title">
                            <i class="bi bi-gear-fill"></i>
                            Características Técnicas
                        </h3>
                        
                        <div class="row g-3">
                            <div class="col-md-3">
                                <label for="combustible" class="form-label">
                                    <i class="bi bi-fuel-pump-fill"></i>
                                    Combustible<span class="required">*</span>
                                </label>
                                <select class="form-select" id="combustible" name="combustible" required>
                                    <option value="">Seleccione</option>
                                    <option value="gasolina" ${coche.combustible == 'gasolina' ? 'selected' : ''}>Gasolina</option>
                                    <option value="diesel" ${coche.combustible == 'diesel' ? 'selected' : ''}>Diesel</option>
                                    <option value="electrico" ${coche.combustible == 'electrico' ? 'selected' : ''}>Eléctrico</option>
                                    <option value="hibrido" ${coche.combustible == 'hibrido' ? 'selected' : ''}>Híbrido</option>
                                    <option value="gas" ${coche.combustible == 'gas' ? 'selected' : ''}>Gas</option>
                                </select>
                            </div>
                            
                            <div class="col-md-3">
                                <label for="consumo" class="form-label">
                                    <i class="bi bi-speedometer"></i>
                                    Consumo (L/100km)<span class="required">*</span>
                                </label>
                                <input type="number" class="form-control" id="consumo" 
                                       name="consumo" step="0.1" value="${coche.consumo}" required>
                            </div>
                            
                            <div class="col-md-3">
                                <label for="cv" class="form-label">
                                    <i class="bi bi-lightning-fill"></i>
                                    Potencia (CV)<span class="required">*</span>
                                </label>
                                <input type="number" class="form-control" id="cv" 
                                       name="cv" value="${coche.cv}" required>
                            </div>
                            
                            <div class="col-md-3">
                                <label for="cambio" class="form-label">
                                    <i class="bi bi-gear-wide-connected"></i>
                                    Tipo de Cambio<span class="required">*</span>
                                </label>
                                <select class="form-select" id="cambio" name="cambio" required>
                                    <option value="">Seleccione</option>
                                    <option value="manual" ${coche.cambio == 'manual' ? 'selected' : ''}>Manual</option>
                                    <option value="automatico" ${coche.cambio == 'automatico' ? 'selected' : ''}>Automático</option>
                                    <option value="semiautomatico" ${coche.cambio == 'semiautomatico' ? 'selected' : ''}>Semiautomático</option>
                                </select>
                            </div>
                            
                            <div class="col-md-4">
                                <label for="kilometros" class="form-label">
                                    <i class="bi bi-speedometer2"></i>
                                    Kilómetros<span class="required">*</span>
                                </label>
                                <input type="number" class="form-control" id="kilometros" 
                                       name="kilometros" value="${coche.kilometros}" required>
                            </div>
                            
                            <div class="col-md-4">
                                <label for="año" class="form-label">
                                    <i class="bi bi-calendar-event"></i>
                                    Año<span class="required">*</span>
                                </label>
                                <select class="form-select" id="año" name="año" required>
                                    <option value="">Seleccione</option>
                                    <c:forEach var="i" begin="0" end="45">
                                        <option value="${2025 - i}" 
                                            ${coche.anio == (2025 - i) ? 'selected' : ''}>
                                            ${2025 - i}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            
                            <div class="col-md-4">
                                <label for="estado" class="form-label">
                                    <i class="bi bi-info-circle"></i>
                                    Estado<span class="required">*</span>
                                </label>
                                <select class="form-select" id="estado" name="estado" required>
                                    <option value="">Seleccione</option>
                                    <option value="a" ${coche.estado == 'a' ? 'selected' : ''}>A - Excelente</option>
                                    <option value="b" ${coche.estado == 'b' ? 'selected' : ''}>B - Bueno</option>
                                    <option value="c" ${coche.estado == 'c' ? 'selected' : ''}>C - Regular</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <div class="mb-5">
                        <h3 class="section-title">
                            <i class="bi bi-currency-euro"></i>
                            Precio y Descuento
                        </h3>
                        
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="precio" class="form-label">
                                    <i class="bi bi-cash-stack"></i>
                                    Precio (€)<span class="required">*</span>
                                </label>
                                <input type="number" class="form-control" id="precio" 
                                       name="precio" step="0.01" value="${coche.precio}" required>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="descuento" class="form-label">
                                    <i class="bi bi-tag-fill"></i>
                                    Descuento (%)
                                </label>
                                <input type="number" class="form-control" id="descuento" 
                                       name="descuento" min="0" max="100" step="1" 
                                       value="${coche.descuento}">
                            </div>
                        </div>
                    </div>
                    
                    <div class="mb-4">
                        <h3 class="section-title">
                            <i class="bi bi-images"></i>
                            Imágenes del Vehículo
                        </h3>
                        
                        <div class="image-upload-section">
                            <p class="text-muted mb-3">
                                <i class="bi bi-info-circle"></i> 
                                Puede actualizar o agregar imágenes (formatos: JPG, PNG, máx. 5MB)
                            </p>
                            
                            <div class="row g-3">
                                <c:set var="imageCount" value="5"/>
                                <c:forEach var="i" begin="1" end="${imageCount}">
                                    <c:set var="imagenFieldName" value="imagen${i}"/>
                                    <c:set var="imagenActualFieldName" value="imagen${i}_actual"/>
                                    <c:set var="imagenValue" value="${coche['imagen_' + i]}"/>
                                    
                                    <div class="col-md-6 image-upload-item">
                                        <label for="${imagenFieldName}" class="form-label">
                                            <i class="bi bi-image"></i> Imagen ${i}
                                            <c:if test="${i eq 1}">(Principal)</c:if>
                                        </label>
                                        
                                        <c:if test="${not empty imagenValue}">
                                            <img src="${imagenValue}" class="current-image" alt="Imagen ${i}">
                                        </c:if>
                                        
                                        <input type="file" class="form-control" id="${imagenFieldName}" 
                                                name="${imagenFieldName}" accept="image/*">
                                                
                                        <input type="hidden" name="${imagenActualFieldName}" value="${imagenValue}">
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </form>
                
                <div class="btn-group-form">
                    <button type="button" class="btn btn-primary btn-custom" onclick="actualizarCoche()"> 
                        <i class="bi bi-check-circle-fill"></i> Actualizar
                    </button>
                    <button type="button" class="btn btn-secondary btn-custom" onclick="cerrarVista()">
                        <i class="bi bi-x-circle-fill"></i> Cerrar
                    </button>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function actualizarCoche() {
            const form = document.getElementById('formEditaCoche');
            
            // --- Validación de Negocio ---
            const precio = parseFloat(document.getElementById('precio').value);
            const descuento = parseFloat(document.getElementById('descuento').value);
            
            if (precio <= 0) {
                alert('El precio debe ser mayor que 0');
                return false;
            }
            
            if (descuento < 0 || descuento > 100) {
                alert('El descuento debe estar entre 0 y 100');
                return false;
            }
            
            // --- Confirmación y Envío ---
            if (confirm('¿Está seguro de que desea actualizar este vehículo?')) {
                form.submit(); // Envía el formulario al EditaCocheServlet
            }
        }
        
        function cerrarVista() {
            // Asumiendo que 'vistaGestionCoches.jsp' es la página de listado
            window.location.href = 'vistaGestionCoches.jsp';
        }
    </script>
</body>
</html>