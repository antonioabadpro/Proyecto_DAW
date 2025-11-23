<%@include file="templates/header.jspf"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="container mt-5 mb-5">
    <div class="formularioContainer mx-auto">
        <div class="formularioHeader">
            <i class="bi bi-trash-fill me-1"></i><strong> Eliminar Vehículo #${requestScope.coche.idCoche}</strong>
        </div>

        <div class="formularioCuerpo">
            <div class="alert alert-warning text-center mb-4" role="alert">
                <i class="bi bi-exclamation-triangle-fill me-2"></i>
                <strong>¡Atención!</strong> Estás a punto de eliminar este vehículo del sistema.
            </div>

            <div class="table-responsive mb-4">
                <table class="table table-bordered table-hover align-middle">
                    <tbody>
                        <tr>
                            <th class="bg-light">Matrícula</th>
                            <td class="fw-bold text-uppercase">${requestScope.coche.matricula}</td>
                        </tr>
                        <tr>
                            <th class="bg-light">Marca / Modelo</th>
                            <td>
                                ${requestScope.coche.marca.nombre} ${requestScope.coche.nombreModelo}
                            </td>
                        </tr>
                        <tr>
                            <th class="bg-light">Descripción</th>
                            <td class="text-muted small">${requestScope.coche.descripcion}</td>
                        </tr>
                        <tr>
                            <th class="bg-light">Color</th>
                            <td>${requestScope.coche.color}</td>
                        </tr>
                        <tr>
                            <th class="bg-light">Estado</th>
                            <td>
                                <span class="badge bg-info text-dark">${requestScope.coche.estado}</span>
                            </td>
                        </tr>
                        <tr>
                            <th class="bg-light">Precio</th>
                            <td class="text-success fw-bold fs-5">
                                ${requestScope.coche.precio} €
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="d-flex justify-content-between gap-3 mt-2">
                <a href="${pageContext.request.contextPath}/gestion" class="btn btn-secondary btn-custom">
                    <i class="bi bi-arrow-left"></i> Cancelar
                </a>

                <button type="button" class="btn btn-danger btn-custom" data-bs-toggle="modal" data-bs-target="#modalEliminar">
                    <i class="bi bi-trash"></i> Eliminar Definitivamente
                </button>
            </div>

        </div>
    </div>
</div>

<%-- Ventana Modal cuando seleccionamos el boton 'Eliminar Definitivamente' --%>
<div class="modal fade" id="modalEliminar" tabindex="-1" aria-labelledby="modalEliminarLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title" id="modalEliminarLabel">Confirmar eliminación</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>
            <div class="modal-body text-center py-4">
                <p class="fs-5">¿Seguro que deseas eliminar el coche?</p>
                <p class="fw-bold text-danger mb-0 fs-4">${requestScope.coche.matricula}</p>
                <small class="text-muted small mt-2">Esta acción NO se puede deshacer.</small>
            </div>
            <div class="modal-footer justify-content-center">
                <form action="${pageContext.request.contextPath}/gestion/eliminar/${requestScope.coche.idCoche}" method="POST">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-danger fw-bold">Sí, eliminar</button>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="templates/footer.jspf"%>