<%@include  file="templates/header.jspf"%>

<div class="container-fluid notebook-paper">
    <!-- Encabezado -->
    <div class="text-center mb-3">
        <div class="bg-dark text-white d-inline-block px-4 py-2 rounded w-100">
            <strong>COMPRA DE VEHÍCULO</strong>
        </div>
    </div>

    <!-- Contenedor 2x2 con zonas diferenciadas -->
    <div class="row g-2 mb-3">
        <!-- Zona 1: Imagen del vehÃ­culo -->
        <div class="col-6">
            <div class="zone">
                <img src="uploads/fotos/arkana.webp" alt="Vehículo" class="img-fluid">
            </div>
            <div class="price-box">
                PRECIO
                <div class="text-muted small">45.879â‚¬</div>
            </div>
        </div>
        <!-- Zona 2: Prueba del vehÃ­culo -->
        <div class="col-6">
            <div class="zone">
                <small>Este vehí­culo ha sido revisado por uno de nuestros técnicos
                    para garantizar que se encuentra en <strong>perfectas condiciones</strong> </small>
            </div>
        </div>
    </div>
    <div class="row g-2 mb-3">
        <!-- Zona 3: Entrega a domicilio -->
        <div class="col-6">        
            <div class="border p-3 mb-3 rounded bg-light">
                <div class="zone">
                    <img src="imagenes/cuentakilometros.png" width="40px" width="40px">
                    <small>15 dí­as de prueba Ã³ 1.000 Kms</small>
                </div>
                <div class="zone">
                    <img src="imagenes/acasa.png" width="40px" width="40px">
                    <small>¿Te lo llevamos a casa?</small>
                </div>
            </div>
        </div>
        <!-- Zona 4: GarantÃ­a -->

        <div class="col-6">        
            <div class="border p-3 mb-3 rounded bg-light">
                <div class="zone">
                    <ul class="small mb-0 ps-4">
                        <li>Revisión de 250 puntos</li>
                        <li>Certificación de kilómetros</li>
                        <li>Sin datos estructurales</li>
                        <li>Libro de cargas</li>
                        <li>Limpieza a fondo</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Botones -->
    <div class="d-flex justify-content-between mt-4">
        <a href="${pageContext.request.contextPath}/carrito" button class="btn btn-primary btn-custom">COMPRAR</a>
        <a href="${pageContext.request.contextPath}/catalogo" button class="btn btn-secondary btn-custom">CANCELAR</a>
    </div>
</div>

<%@include  file="templates/footer.jspf"%> 