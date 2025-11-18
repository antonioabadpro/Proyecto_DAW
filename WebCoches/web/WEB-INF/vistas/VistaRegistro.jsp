<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="templates/header.jspf"%>
<div  class="container notebook-paper">
    <!-- Encabezado -->
    <div class="container mb-3">
        <div class="row">
            <div class="col-12 text-center">
                <div class="bg-dark text-white d-inline-block px-4 py-2 rounded w-100">
                    <strong>REGISTRO DE USUARIO</strong>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <form name="formRegistro" method="POST" action="${pageContext.request.contextPath}/sesion/registrar" >
                    <div class="row">
                        <div class="col-3">
                            <div class="mb-3">
                                <label for="formGrupoRegistro" class="form-label">Usuario:</label>
                                <input type="text" class="form-control" name="nomUsuario" id="nomUsuario" placeholder="Usuario" >
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <div class="mb-3">
                                <label for="formGrupoRegistro" class="form-label">Contaseña:</label>
                                <input type="password" class="form-control" name="password" id="password" placeholder="Contraseña" >
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <div class="mb-3">
                                <label for="formGrupoRegistro" class="form-label">Nombre:</label>
                                <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre y Apellidos" >
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <div class="mb-3">
                                <label for="formGrupoRegistro" class="form-label">DNI:</label>
                                <input type="text" class="form-control" name="dni" id="dni" placeholder="DNI" maxlength="10">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <div class="mb-3">
                                <label for="formGrupoRegistro" class="form-label">Correo Electrónico:</label>
                                <input type="text" class="form-control" name="correo" id="correo" placeholder="Correo">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <div class="mb-3">
                                <label for="formGrupoRegistro" class="form-label">Teléfono</label>
                                <input type="text" class="form-control" name="telefono" id="telefono" placeholder="Teléfono de Contacto" maxlength="9">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <div class="mb-4">
                                <label for="formGrupoRegistro" class="form-label">Dirección</label>
                                <input type="text" class="form-control" name="direccion" id="direccion" placeholder="Dirección">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-2">
                            <div class="mb-3">
                                <label for="formGrupoRegistro" class="form-label">Código Postal:</label>
                                <input type="text" class="form-control" name="cp" id="cp" placeholder="Dirección Postal">
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="mb-3">
                                <label for="formGrupoRegistro" class="form-label">Provincia:</label>
                                <select name="provincia" class="form-control" required>
                                    <option value="0" selected>Elige Provincia:</option>
                                    <option value="Álava">Álava</option>
                                    <option value="Albacete">Albacete</option>
                                    <option value="Alicante">Alicante</option>
                                    <option value="Almería">Almería</option>
                                    <option value="Asturias">Asturias</option>
                                    <option value="Ávila">Ávila</option>
                                    <option value="Badajoz">Badajoz</option>
                                    <option value="Barcelona">Barcelona</option>
                                    <option value="Burgos">Burgos</option>
                                    <option value="Cáceres">Cáceres</option>
                                    <option value="Cádiz">Cádiz</option>
                                    <option value="Cantabria">Cantabria</option>
                                    <option value="Castellón">Castellón</option>
                                    <option value="Ceuta">Ceuta</option>
                                    <option value="Ciudad Real">Ciudad Real</option>
                                    <option value="Córdoba">Córdoba</option>
                                    <option value="Cuenca">Cuenca</option>
                                    <option value="Gerona">Gerona</option>
                                    <option value="Granada">Granada</option>
                                    <option value="Guadalajara">Guadalajara</option>
                                    <option value="Guipúzcoa">Guipúzcoa</option>
                                    <option value="Huelva">Huelva</option>
                                    <option value="Huesca">Huesca</option>
                                    <option value="Islas Baleares">Islas Baleares</option>
                                    <option value="Jaén">Jaén</option>
                                    <option value="La Coruña">La Coruña</option>
                                    <option value="La Rioja">La Rioja</option>
                                    <option value="Las Palmas">Las Palmas</option>
                                    <option value="León">León</option>
                                    <option value="Lérida">Lérida</option>
                                    <option value="Lugo">Lugo</option>
                                    <option value="Madrid">Madrid</option>
                                    <option value="Málaga">Málaga</option>
                                    <option value="Melilla">Melilla</option>
                                    <option value="Murcia">Murcia</option>
                                    <option value="Navarra">Navarra</option>
                                    <option value="Orense">Orense</option>
                                    <option value="Palencia">Palencia</option>
                                    <option value="Pontevedra">Pontevedra</option>
                                    <option value="Salamanca">Salamanca</option>
                                    <option value="Santa Cruz de Tenerife">Salamanca</option>
                                    <option value="Segovia">Segovia</option>
                                    <option value="Sevilla">Sevilla</option>
                                    <option value="Soria">Soria</option>
                                    <option value="Tarragona">Tarragona</option>
                                    <option value="Teruel">Teruel</option>
                                    <option value="Toledo">Toledo</option>
                                    <option value="Valencia">Valencia</option>
                                    <option value="Valladolid">Valladolid</option>
                                    <option value="Vizcaya">Vizcaya</option>
                                    <option value="Zamora">Zamora</option>
                                    <option value="Zaragoza">Zaragoza</option>
                                </select>   
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <div class="mb-3">
                                <input type="submit" button class="btn btn-primary btn-custom" name="enviaRegistro" value="Registrar">
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="mb-3">
                                <input type="reset" button class="btn btn-warning btn-custom" name="limpiaRegistro" value="Limpiar">
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="mb-3">
                                <a href="${pageContext.request.contextPath}/inicio" button class="btn btn-secondary btn-custom" name="salir">Cerrar</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@include  file="templates/footer.jspf"%>