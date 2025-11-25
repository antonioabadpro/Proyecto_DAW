<%@include file="templates/header.jspf"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <div class="container">
        <div class="card shadow success-card">
            <div class="mb-3">
                <i class="bi bi-check-circle-fill icon-check"></i>
            </div>
            
            <h1 class="mb-3 text-success">¡Pago realizado con éxito!</h1>
            <p class="text-muted">Gracias por confiar en TONICAR.</p>
            <hr>

            <div class="mt-4">
                <h5>CÓDIGO DE COMPRA</h5>
                <div class="code-box text-dark">
                    ${compra.idCompra}
                </div>
            </div>

            <div class="alert alert-info mt-4 text-start" role="alert">
                <h5 class="alert-heading"><i class="bi bi-info-circle"></i> Información importante</h5>
                <p>
                    La compra del vehículo con matrícula <strong>${requestScope.coche.matricula}</strong> se ha realizado con éxito. 
                    En breve recibirá un correo de confirmación y las instrucciones de entrega del vehículo.
                </p>
                <p class="mb-0">
                    <strong>Dirección de recogida:</strong> ${requestScope.usuario.direccion}
                </p>
            </div>

            <div class="mt-5">
                <a href="${pageContext.request.contextPath}/catalogo" class="btn btn-primary px-4">Volver al Catálogo</a>
                <a href="${pageContext.request.contextPath}/sesion/misPedidos" class="btn btn-primary px-4"><i class="bi bi-receipt"></i> Ver mis Pedidos</a>
            </div>
        </div>
    </div>
                
<%@include file="templates/footer.jspf"%>