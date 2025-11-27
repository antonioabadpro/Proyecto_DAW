<%@include file="templates/header.jspf"%>
<div class="container tarjetaRegistro">
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
                            <div class="my-3">
                                <label for="formGrupoRegistro" class="formularioLabel"><i class="bi bi-person"></i>Usuario:</label>
                                <input type="text" class="formularioInput" name="nomUsuario" id="nomUsuario" placeholder="Usuario" >
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <div class="mb-3">
                                <label for="formpassword" class="formularioLabel"><i class="bi bi-key"></i>Contraseña:</label>
                                <input type="password" class="formularioInput" name="password" id="password" placeholder="Contraseña" >
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="mb-3">
                                <label for="formpasswordRepite" class="formularioLabel"><i class="bi bi-key-fill"></i>Repite Contaseña:</label>
                                <input type="password" class="formularioInput" name="password_repite" id="password_repite" placeholder="Repite" >
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-8">
                            <div class="mb-3">
                                <label for="formNombre" class="formularioLabel"><i class="bi bi-person"></i>Nombre y Apellidos:</label>
                                <input type="text" class="formularioInput  w-100" name="nombre" id="nombre" placeholder="Nombre y Apellidos" >
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="mb-3">
                                <label for="formGrupoRegistro" class="formularioLabel"><i class="bi bi-person-bounding-box"></i>DNI:</label>
                                <input type="text" class="formularioInput" name="dni" id="dni" placeholder="DNI" maxlength="10">
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-5">
                            <div class="mb-3">
                                <label for="formGrupoRegistro" class="formularioLabel"><i class="bi bi-at"></i>Correo Electrónico:</label>
                                <input type="text" class="formularioInput w-100" name="correo" id="correo" placeholder="Ej: tucorreo@dominio.es">
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="mb-3">
                                <label for="formGrupoRegistro" class="formularioLabel"><i class="bi bi-telephone"></i>Teléfono</label>
                                <input type="text" class="formularioInput" name="telefono" id="telefono" placeholder="Ej: 999123456" maxlength="9">
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                         <div class="col-2">
                            <div class="mb-3">
                                <label for="formGrupoRegistro" class="formularioLabel"><i class="bi bi-building"></i>Provincia:</label>
                                <select name="provincia" class="formularioInput" required>
                                   <option value="0" selected>Elige Provincia:</option>
                                    <option value="Alava">Álava</option>
                                    <option value="Albacete">Albacete</option>
                                    <option value="Alicante">Alicante</option>
                                    <option value="Almeria">Almería</option>
                                    <option value="Asturias">Asturias</option>
                                    <option value="Avila">Ávila</option>
                                    <option value="Badajoz">Badajoz</option>
                                    <option value="Barcelona">Barcelona</option>
                                    <option value="Burgos">Burgos</option>
                                    <option value="Caceres">Cáceres</option>
                                    <option value="Cádiz">Cádiz</option>
                                    <option value="Cantabria">Cantabria</option>
                                    <option value="Castellon">Castellón</option>
                                    <option value="Ceuta">Ceuta</option>
                                    <option value="Ciudad Real">Ciudad Real</option>
                                    <option value="Cordoba">Córdoba</option>
                                    <option value="Cuenca">Cuenca</option>
                                    <option value="Gerona">Gerona</option>
                                    <option value="Granada">Granada</option>
                                    <option value="Guadalajara">Guadalajara</option>
                                    <option value="Guipuzcoa">Guipúzcoa</option>
                                    <option value="Huelva">Huelva</option>
                                    <option value="Huesca">Huesca</option>
                                    <option value="Islas Baleares">Islas Baleares</option>
                                    <option value="Jaen">Jaén</option>
                                    <option value="La Corunia">La Coruña</option>
                                    <option value="La Rioja">La Rioja</option>
                                    <option value="Las Palmas">Las Palmas</option>
                                    <option value="Leon">León</option>
                                    <option value="Lerida">Lérida</option>
                                    <option value="Lugo">Lugo</option>
                                    <option value="Madrid">Madrid</option>
                                    <option value="Malaga">Málaga</option>
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
                        <div class="col-3">
                            <div class="mb-3">
                                <label for="formGrupoRegistro" class="formularioLabel"><i class="bi bi-postcard"></i>Código Postal:</label>
                                <input type="text" class="formularioInput w-50" name="cp" id="cp" placeholder="Ej:21600">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="mb-4">
                                <label for="formGrupoRegistro" class="formularioLabel"><i class="bi bi-buildings"></i>Dirección</label>
                                <input type="text" class="formularioInput w-100" name="direccion" id="direccion" placeholder="Direccion">
                            </div>
                        </div>
                    </div>
                    
                    <div class="mb-10 text-center">
                        <input type="submit" button class="btn btn-primary btn-custom" name="enviaRegistro" value="Registrar">
                         <input type="reset" button class="btn btn-warning btn-custom" name="limpiaRegistro" value="Limpiar">
                         <a href="${pageContext.request.contextPath}/inicio" button class="btn btn-secondary btn-custom" name="salir">Cerrar</a>
                    </div> 
                </form>
            </div>
        </div>
    </div>
</div>
<%@include  file="templates/footer.jspf"%>