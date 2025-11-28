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
                <form id="formularioRegistro" name="formRegistro" method="POST" action="${pageContext.request.contextPath}/sesion/registrar" >
                    <div class="row">
                        <div class="col-3">
                            <div class="my-3">
                                <label for="formGrupoRegistro" class="formularioLabel">
                                    <i class="bi bi-person"></i>Usuario: <span class="obligatorio">*</span>
                                </label>
                                <input type="text" class="formularioInput" name="nomUsuario" id="nomUsuario" placeholder="Usuario" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <div class="mb-3">
                                <label for="formpassword" class="formularioLabel">
                                    <i class="bi bi-key"></i>Contraseña: <span class="obligatorio">*</span>
                                </label>
                                <input id="password1" type="password" class="formularioInput me-1" name="password" placeholder="Contraseña" required onblur="validarPassword()">
                                <i id="checkPassword1" class="bi bi-check-circle-fill text-success d-none iconoFormulario"></i>
                                <i id="errorPassword1" class="bi bi-x-circle-fill text-danger d-none iconoFormulario" title="La contraseña NO puede estar vacía"></i>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="mb-3">
                                <label for="formpasswordRepite" class="formularioLabel">
                                    <i class="bi bi-key-fill"></i>Repite Contaseña: <span class="obligatorio">*</span>
                                </label>
                                <input id="password2" type="password" class="formularioInput me-1" name="password_repite" placeholder="Contraseña" required onblur="validarRepetirPassword()">
                                <i id="checkPassword2" class="bi bi-check-circle-fill text-success d-none iconoFormulario"></i>
                                <i id="errorPassword2" class="bi bi-x-circle-fill text-danger d-none iconoFormulario" title="Las contraseñas NO coinciden"></i>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-8">
                            <div class="mb-3">
                                <label for="formNombre" class="formularioLabel">
                                    <i class="bi bi-person"></i>Nombre y Apellidos: <span class="obligatorio">*</span>
                                </label>
                                <input id="nombre" type="text" class="formularioInput  w-75 me-1" name="nombre" placeholder="Nombre y Apellidos" required onblur="validarNombre()">
                                <i id="checkNombre" class="bi bi-check-circle-fill text-success d-none iconoFormulario"></i>
                                <i id="errorNombre" class="bi bi-x-circle-fill text-danger d-none iconoFormulario" title="El nombre NO puede estar vacío y NO puede contener números"></i>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="mb-3">
                                <label for="formGrupoRegistro" class="formularioLabel">
                                    <i class="bi bi-person-bounding-box" ></i>DNI: <span class="obligatorio">*</span>
                                </label>
                                <input id="dni" type="text" class="formularioInput me-1" name="dni" placeholder="DNI" maxlength="10" required onblur="validarDni()">
                                <i id="checkDni" class="bi bi-check-circle-fill text-success d-none iconoFormulario"></i>
                                <i id="errorDni" class="bi bi-x-circle-fill text-danger d-none iconoFormulario" title="El DNI debe tener 8 números y la letra en mayúscula"></i>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-5">
                            <div class="mb-3">
                                <label for="formGrupoRegistro" class="formularioLabel">
                                    <i class="bi bi-at"></i>Correo Electrónico: <span class="obligatorio">*</span>
                                </label>
                                <input id="correo" type="text" class="formularioInput w-100 me-1" name="correo" placeholder="Ej: tucorreo@dominio.es">
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="mb-3">
                                <label for="formGrupoRegistro" class="formularioLabel">
                                    <i class="bi bi-telephone"></i>Teléfono <span class="obligatorio">*</span>
                                </label>
                                <input id="telefono" type="text" class="formularioInput me-1" name="telefono" placeholder="Ej: 999123456" maxlength="9" required onblur="validarTelefono()">
                                <i id="checkTelefono" class="bi bi-check-circle-fill text-success d-none iconoFormulario"></i>
                                <i id="errorTelefono" class="bi bi-x-circle-fill text-danger d-none iconoFormulario" title="El teléfono debe tener 9 números"></i>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-3">
                            <div class="mb-3">
                                <label for="formGrupoRegistro" class="formularioLabel">
                                    <i class="bi bi-postcard"></i>Código Postal: <span class="obligatorio">*</span>
                                </label>
                                <input id="cp" type="text" class="formularioInput w-50 me-1" name="cp" placeholder="Ej: 21005" required onblur="validarCodigoPostal()">
                                <i id="checkCP" class="bi bi-check-circle-fill text-success d-none iconoFormulario"></i>
                                <i id="errorCP" class="bi bi-x-circle-fill text-danger d-none iconoFormulario" title="El Código Postal debe tener 5 números y debe ser menor de 53000 (Melilla)"></i>
                            </div>
                        </div>
                         <div class="col-2">
                            <div class="mb-3">
                                <label for="formGrupoRegistro" class="formularioLabel">
                                    <i class="bi bi-building"></i>Provincia: <span class="obligatorio">*</span>
                                </label>
                                <select id="provincia" name="provincia" class="formularioInput soloLectura">
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
                                    <option value="Cadiz">Cádiz</option>
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
                        <div class="col-6">
                            <div class="mb-4">
                                <label for="formGrupoRegistro" class="formularioLabel">
                                    <i class="bi bi-buildings"></i>Dirección <span class="obligatorio">*</span>
                                </label>
                                <input id="direccion" type="text" class="formularioInput w-75 me-1" name="direccion" placeholder="Ej: Calle Huelva, 33" required onblur="validarDireccion()">
                                <i id="checkDireccion" class="bi bi-check-circle-fill text-success d-none iconoFormulario"></i>
                                <i id="errorDireccion" class="bi bi-x-circle-fill text-danger d-none iconoFormulario" title="La dirección debe tener el siguiente formato: Calle 'nombreCalle', nº"></i>
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
<%@include file="templates/footer.jspf"%>