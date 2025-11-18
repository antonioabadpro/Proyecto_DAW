<%@include file="templates/header.jspf"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-5">
    <div class="d-flex justify-content-between mb-4">
        <h3>Gestión de Coches</h3>
        <a href="${pageContext.request.contextPath}/gestion/insertar" class="btn btn-success">Insertar Coche</a>
    </div>

    <div class="card shadow-sm">
        <div class="card-body">
            <table class="table table-striped table-hover align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>Id</th>
                        <th>Matrícula</th>
                        <th>Color</th>
                        <th>Precio (€)</th>
                        <th>Descuento</th>
                        <th>Estado</th>
                        <th>Foto 1</th>
                        <th>Foto 2</th>
                        <th>Acciones</th>
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
                                    <td>${coche.estado}</td>
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
                                    <td>
                                        <div class="d-flex gap-2">
                                            <form action="${pageContext.request.contextPath}/gestion/editar" method="GET">
                                                <input type="hidden" name="accion" value="editarVista">
                                                <input type="hidden" name="matricula" value="${coche.matricula}">
                                                <button type="submit" class="btn btn-warning btn-sm">Editar</button>
                                            </form>
                                            <form action="${pageContext.request.contextPath}/gestion/eliminar" method="GET">
                                                <input type="hidden" name="accion" value="vistaEliminar">
                                                <input type="hidden" name="matricula" value="${coche.matricula}">
                                                <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
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

<%@include file="templates/footer.jspf"%>
