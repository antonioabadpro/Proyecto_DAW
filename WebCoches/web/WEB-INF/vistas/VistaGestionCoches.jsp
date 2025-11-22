<%@include file="templates/header.jspf"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-5">
    <c:if test="${!empty requestScope.textoResultado}">
        <div class="alert alert-${requestScope.tipoMensaje} alert-dismissible fade show" role="alert">
            <c:if test="${requestScope.tipoMensaje == 'success'}">
                <i class="bi bi-check-circle-fill"> ${requestScope.textoResultado}</i>
            </c:if>
            <c:if test="${requestScope.tipoMensaje == 'danger'}">
                <i class="bi bi-exclamation-triangle-fill"> ${requestScope.textoResultado}</i>
            </c:if>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3><i class="bi bi-car-front"></i> Gestión de Coches</h3>
        <a href="${pageContext.request.contextPath}/gestion/insertar" class="btn btn-success">
            <i class="bi bi-plus-lg"></i> Insertar Coche
        </a>
    </div>

    <div class="card shadow-sm mb-5">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-striped table-hover align-middle mb-0">
                    <thead class="table-dark text-nowrap">
                        <tr>
                            <th>Id</th>
                            <th>Matrícula</th>
                            <th>Color</th>
                            <th>Precio (€)</th>
                            <th>Descuento</th>
                            <th>Estado</th>
                            <th>Foto 1</th>
                            <th>Foto 2</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty listaCoches}">
                                <c:forEach var="coche" items="${requestScope.listaCoches}">
                                    <tr>
                                        <td>${coche.id}</td>
                                        <td>${coche.matricula}</td>
                                        <td>${coche.color}</td>
                                        <td>${coche.precio}</td>
                                        <td>${coche.descuento}%</td>
                                        <%-- Estado del Coche --%>
                                        <c:choose>
                                            <c:when test="${coche.estado == 'ComoNuevo'}">
                                                <td>Como Nuevo</td>
                                            </c:when>
                                            <c:when test="${coche.estado == 'PorReparar'}">
                                                <td>Por Reparar</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td>${coche.estado}</td>
                                            </c:otherwise>
                                        </c:choose>
                                       <%-- Imagen 1 del Coche --%>     
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty coche.foto1}">
                                                    <img src="${pageContext.request.contextPath}/img_coches/${coche.foto1}" alt="foto1" class="img-thumbnail" width="80">
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-muted">Sin imagen</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <%-- Imagen 2 del Coche --%>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty coche.foto2}">
                                                    <img src="${pageContext.request.contextPath}/img_coches/${coche.foto2}" alt="foto2" class="img-thumbnail" width="80">
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-muted">Sin imagen</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <%-- Acciones --%>
                                        <td>
                                            <div class="d-flex gap-2 justify-content-center">
                                                <form action="${pageContext.request.contextPath}/gestion/modificar" method="GET">
                                                    <input type="hidden" name="idCoche" value="${coche.id}">
                                                    <button type="submit" class="btn btn-warning btn-sm"><i class="bi bi-pencil-square"></i> Modificar</button>
                                                </form>
                                                <form action="${pageContext.request.contextPath}/gestion/eliminar" method="GET">
                                                    <input type="hidden" name="idCoche" value="${coche.id}">
                                                    <button type="submit" class="btn btn-danger btn-sm"><i class="bi bi-trash"></i> Eliminar</button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise> <%-- Si NO hay ningun Coche en la BD --%>
                                <tr>
                                    <td colspan="10" class="text-center text-muted">No hay coches registrados.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%@include file="templates/footer.jspf"%>
