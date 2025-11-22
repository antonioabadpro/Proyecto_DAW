<!--
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.Coche" %>
<%@ page import="modelo.Foto" %>
<%@ page import="java.util.List" %>

<%
    Coche coche = (Coche) request.getAttribute("cocheSeleccionado");
    List<Foto> fotos = (List<Foto>) request.getAttribute("fotosCoche");
%>
-->

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Eliminar coche</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/estilo_CRUD_Coche.css">
</head>
<body class="bg-light">

<div class="formularioContainer">
    <div class="card shadow">
        <!--
        <div class="card-header bg-black text-white">
            <h4>Confirmar eliminación del coche</h4>
        </div>
    -->
           <div class="formularioHeader">
                <i class="bi bi-car-front-fill"></i><strong> Baja de Vehículo ${coche.matricula}</strong>
                
            </div>



        <div class="card-body">
            <h5>Datos del coche</h5>
            <table class="table table-bordered mt-3">
                <tr><th>Matrícula</th><td><%= coche.getMatricula() %></td></tr>
                <tr><th>Descripción</th><td><%= coche.getDescripcion() %></td></tr>
                <tr><th>Color</th><td><%= coche.getColor() %></td></tr>
                <tr><th>Descuento</th><td><%= coche.getDescuento() %> %</td></tr>
                <tr><th>Estado</th><td><%= coche.getEstado() %></td></tr>
                <tr><th>Precio</th><td><%= coche.getPrecio() %> €</td></tr>
            </table>

            
            <div class="d-flex justify-content-between mt-5">
                <a href="vistaGestionCoches.jsp" class="btn btn-secondary">Volver</a>
                <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modalEliminar">Eliminar coche</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal de confirmación -->
<div class="modal fade" id="modalEliminar" tabindex="-1" aria-labelledby="modalEliminarLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title" id="modalEliminarLabel">Confirmar eliminación</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>
            <div class="modal-body">
                ¿Deseas eliminar el coche con matrícula 
                <strong><%= coche.getMatricula() %></strong>? Esta acción no se puede revertir.
            </div>
            <div class="modal-footer">
                <form action="controladorBajaCoche.java" method="post">
                    <input type="hidden" name="accion" value="eliminar">
                    <input type="hidden" name="matricula" value="<%= coche.getMatricula() %>">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-danger">Eliminar definitivamente</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
