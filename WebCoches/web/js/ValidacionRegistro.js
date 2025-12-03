/**
 * El campo Usuario NO puede estar vacio
 * Internamente, llama a 'validarNombreUsuarioFetch()' para comprobar que el nombreUsuario NO existe en la BD una vez que el formato del campo es correcto
 * @returns {Boolean}
 */
function validarNombreUsuario()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkNomUsuario");
    let iconoError = document.getElementById("errorNomUsuario");
    let iconoErrorFormato = document.getElementById("errorFormatoNomUsuario");
    let nomUsuario = document.getElementById("nomUsuario").value.trim();
    
    if(nomUsuario === "" || nomUsuario === null) // Si el Nombre de Usuario esta vacio
    {
        esValido = false;
        // Ocultamos el icono del check y el icono del error porque ya existe
        iconoCheck.classList.add("d-none");
        iconoError.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoErrorFormato.classList.remove("d-none");
        
        // Añadimos el borde rojo
        nomUsuario.classList.add("is-invalid");
        nomUsuario.classList.remove("is-valid");
    }
    else // Si el Nombre de Usuario NO esta vacio
    {
        esValido = validarNombreUsuarioFetch();   
    }
    return esValido;
}

/**
 * Funcion llamada desde 'validarNombreUsuario()' para comprobar que el nomUsuario NO existe en la BD una vez que el formato del campo es correcto
 * @returns {Boolean}
 */
async function validarNombreUsuarioFetch()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkNomUsuario");
    let iconoError = document.getElementById("errorNomUsuario");
    let iconoErrorFormato = document.getElementById("errorFormatoNomUsuario");
    let nomUsuario = document.getElementById("nomUsuario");
    
    let parametrosEnviados = new URLSearchParams(); // Datos enviados al Servidor/Controlador
    parametrosEnviados.append("nomUsuarioFetch", nomUsuario.value);
    
    let respuestaServidor = await fetch("/WebCoches/sesion/comprobarNombreUsuario", {
        method: 'POST',
        body: parametrosEnviados
    });
    
    if(respuestaServidor.ok) // Si el Servidor ha realizado la peticion correctamente (Estado HTTP 200-299)
    {
        let resultadoConsulta = await respuestaServidor.text();
        
        console.log("resultadoConsulta desde JS: " + resultadoConsulta);
        
        if(resultadoConsulta === "NOexisteNomUsuario") // Si NO existe un Usuario con ese correo en la BD
        {
            esValido = true;
            // Mostramos el icono del check
            iconoCheck.classList.remove("d-none");

            // Ocultamos el icono del error del formato y el icono del error porque ya existe
            iconoErrorFormato.classList.add("d-none");
            iconoError.classList.add("d-none");

            // Añadimos el borde verde
            nomUsuario.classList.add("is-valid");
            nomUsuario.classList.remove("is-invalid");
        }
        else
        {
            esValido = false;
            // Ocultamos el icono del check y el del error por el formato
            iconoCheck.classList.add("d-none");
            iconoErrorFormato.classList.add("d-none");

            // Mostramos el icono del error
            iconoError.classList.remove("d-none");

            // Añadimos el borde rojo
            nomUsuario.classList.add("is-invalid");
            nomUsuario.classList.remove("is-valid");
        }
    }
    return esValido;
}

/**
 * El campo Contraseña NO puede estar vacio
 * Si la segunda contraseña tiene texto, comprobamos su contenido
 * @returns {Boolean} 
 */
function validarPassword()
{
    let esValido = false;
    
    let inputPass1 = document.getElementById("password1");
    let iconoCheck = document.getElementById("checkPassword1");
    let iconoError = document.getElementById("errorPassword1");
    
    let valorPass1 = inputPass1.value;

    if (valorPass1 === "")
    {
        esValido = false;
        // Iconos
        iconoCheck.classList.add("d-none");
        iconoError.classList.remove("d-none");
        // Bordes
        inputPass1.classList.add("is-invalid");
        inputPass1.classList.remove("is-valid");
    }
    else
    {
        esValido = true;
        // Iconos
        iconoCheck.classList.remove("d-none");
        iconoError.classList.add("d-none");
        // Bordes
        inputPass1.classList.add("is-valid");
        inputPass1.classList.remove("is-invalid");
    }

    // Comprobamos la Contraseña del campo 'Repetir Contraseña' por si hemos introducido esa primero
    let valorPass2 = document.getElementById("password2").value;
    
    if (valorPass2 !== "")
    {
        validarRepetirPassword();
    }
    return esValido;
}

/**
 * El campo Repetir Contraseña NO debe estar vacio y debe coincidir con la contraseña introducida en el campo Contraseña
 * Es llamada al salir del campo 2 o automáticamente desde el campo 1
 * @returns {Boolean} 
 */
function validarRepetirPassword()
{
    let esValido = false;

    let inputPass2 = document.getElementById("password2");
    let iconoCheck = document.getElementById("checkPassword2");
    let iconoError = document.getElementById("errorPassword2");

    let valorPass1 = document.getElementById("password1").value;
    let valorPass2 = inputPass2.value;

    if (valorPass1 !== "" && valorPass1.trim() === valorPass2.trim())
    {
        esValido = true;
        // Iconos
        iconoCheck.classList.remove("d-none");
        iconoError.classList.add("d-none");
        // Bordes
        inputPass2.classList.add("is-valid");
        inputPass2.classList.remove("is-invalid");
    }
    else
    {
        esValido = false;
        // Iconos
        iconoCheck.classList.add("d-none");
        iconoError.classList.remove("d-none");
        // Bordes
        inputPass2.classList.add("is-invalid");
        inputPass2.classList.remove("is-valid");
    }
    return esValido;
}

/**
 * El Nombre debe contener un espacio entre el nombre y el apellido y NO puede contener numeros ni caracteres especiales
 * @returns {Boolean} 
 */
function validarNombre()
{
    let esValido = true;
    let iconoCheck = document.getElementById("checkNombre");
    let iconoError = document.getElementById("errorNombre");
    let nombre = document.getElementById("nombre").value;

    if(nombre === "" || nombre === null)
    {
        esValido = false;
    }
    else
    {
        nombre=nombre.trim();
        // Comprobamos si contiene al menos un espacio (mínimo dos palabras)
        if (nombre.includes(" ") === false)
        {
            esValido = false;
        }
        else
        {
            // Separamos en palabras
            let partes = nombre.split(" ");

            // Comprobamos que haya al menos 2 palabras
            if (partes.length < 2)
            {
                esValido = false;
            }
            else
            {
                let soloLetras = /^[A-Za-zÁÉÍÓÚáéíóúÑñ]+$/;

                // Verificamos que todas las partes tengan solo letras
                for (let palabra of partes)
                {
                    if (soloLetras.test(palabra) === false)
                    {
                        esValido = false;
                    }
                }
            }
        }
    }
    
    if(esValido === false)
    {
        // Ocultamos el icono del check
        iconoCheck.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoError.classList.remove("d-none");
        
        // Añadimos el borde rojo
        nombre.classList.add("is-invalid");
        nombre.classList.remove("is-valid");
    }
    else
    {
        // Mostramos el icono del check
        iconoCheck.classList.remove("d-none");
        
        // Ocultamos el icono del error
        iconoError.classList.add("d-none");
        
        // Añadimos el borde verde
        nombre.classList.add("is-valid");
        nombre.classList.remove("is-invalid");
    }
    
    return esValido;
}

/**
 * El campo Dni debe cumplir con el siguiente formato (nnnnnnnnL), es decir, 8 numeros y una letra en mayuscula
 * n = numero
 * L = letra en mayuscula
 * @returns {Boolean}
 */
function validarDni()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkDni");
    let iconoError = document.getElementById("errorDni");
    let dni = document.getElementById("dni").value.trim();
    
    let formatoValido = /^\d{8}[A-Z]$/.test(dni);
    
    if(formatoValido === true) // Si el DNI cumple con el formato
    {
        esValido = true;
        // Mostramos el icono del check
        iconoCheck.classList.remove("d-none");
        
        // Ocultamos el icono del error
        iconoError.classList.add("d-none");
        
        // Añadimos el borde verde
        dni.classList.add("is-valid");
        dni.classList.remove("is-invalid");
    }
    else // Si el DNI NO cumple con el formato
    {
        esValido = false;
        // Ocultamos el icono del check
        iconoCheck.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoError.classList.remove("d-none");
        
        // Añadimos el borde rojo
        dni.classList.add("is-invalid");
        dni.classList.remove("is-valid");
    }
    
    return esValido;
}

/**
 * El Correo debe cumplir con el formato 'correo@dominio.algo'
 * Internamente, llama a 'validarCorreoFetch()' para comprobar que el correo NO existe en la BD una vez que el formato del campo es correcto
 * @returns {Boolean}
 */
function validarCorreo()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkCorreo");
    let iconoError = document.getElementById("errorCorreo");
    let iconoErrorFormato = document.getElementById("errorFormatoCorreo");
    let correo = document.getElementById("correo").value.trim();
    
    let formatoValido = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(correo);
    
    if(formatoValido === true) // Si el DNI cumple con el formato
    {
        esValido = validarCorreoFetch();
    }
    else // Si el DNI NO cumple con el formato
    {
        esValido = false;
        // Ocultamos el icono del check y el icono del error porque ya existe
        iconoCheck.classList.add("d-none");
        iconoError.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoErrorFormato.classList.remove("d-none");
        
        // Añadimos el borde rojo
        correo.classList.add("is-invalid");
        correo.classList.remove("is-valid");
    }
    return esValido;
}

/**
 * Funcion llamada desde 'validarCorreo()' para comprobar que el correo NO existe en la BD una vez que el formato del campo es correcto
 * @returns {Boolean}
 */
async function validarCorreoFetch()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkCorreo");
    let iconoError = document.getElementById("errorCorreo");
    let iconoErrorFormato = document.getElementById("errorFormatoCorreo");
    let correo = document.getElementById("correo");
    
    let parametrosEnviados = new URLSearchParams(); // Datos enviados al Servidor/Controlador
    parametrosEnviados.append("correoFetch", correo.value);
    
    let respuestaServidor = await fetch("/WebCoches/sesion/comprobarCorreo", {
        method: 'POST',
        body: parametrosEnviados
    });
    
    if(respuestaServidor.ok) // Si el Servidor ha realizado la peticion correctamente (Estado HTTP 200-299)
    {
        let resultadoConsulta = await respuestaServidor.text();
        
        console.log("resultadoConsulta desde JS: " + resultadoConsulta);
        
        if(resultadoConsulta === "NOexisteCorreo") // Si NO existe un Usuario con ese correo en la BD
        {
            esValido = true;
            // Mostramos el icono del check
            iconoCheck.classList.remove("d-none");

            // Ocultamos el icono del error del formato y el icono del error porque ya existe
            iconoErrorFormato.classList.add("d-none");
            iconoError.classList.add("d-none");

            // Añadimos el borde verde
            correo.classList.add("is-valid");
            correo.classList.remove("is-invalid");
        }
        else
        {
            esValido = false;
            // Ocultamos el icono del check y el del error por el formato
            iconoCheck.classList.add("d-none");
            iconoErrorFormato.classList.add("d-none");

            // Mostramos el icono del error
            iconoError.classList.remove("d-none");

            // Añadimos el borde rojo
            correo.classList.add("is-invalid");
            correo.classList.remove("is-valid");
        }
    }
    return esValido;
}

/**
 * El campo Telefono debe tener 9 numeros
 * @returns {Boolean}
 */
function validarTelefono()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkTelefono");
    let iconoError = document.getElementById("errorTelefono");
    let numTelefono = document.getElementById("telefono").value.trim();
    
    if(numTelefono.length !== 9 || isNaN(numTelefono) === true) // Si el Telefono NO cumple con el formato
    {
        esValido = false;
        // Ocultamos el icono del check
        iconoCheck.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoError.classList.remove("d-none");
        
        // Añadimos el borde rojo
        numTelefono.classList.add("is-invalid");
        numTelefono.classList.remove("is-valid");
    }
    else // Si el Telefono cumple con el formato
    {
        esValido = false;
        // Mostramos el icono del check
        iconoCheck.classList.remove("d-none");
        
        // Ocultamos el icono del error
        iconoError.classList.add("d-none");
        
        // Añadimos el borde verde
        numTelefono.classList.add("is-valid");
        numTelefono.classList.remove("is-invalid");
    }
    
    return esValido;
}

const CP_PROVINCIAS = {
    "01": "Alava",
    "02": "Albacete",
    "03": "Alicante",
    "04": "Almeria",
    "05": "Avila",
    "06": "Badajoz",
    "07": "Islas Baleares",
    "08": "Barcelona",
    "09": "Burgos",
    "10": "Caceres",
    "11": "Cadiz",
    "12": "Castellon",
    "13": "Ciudad Real",
    "14": "Cordoba",
    "15": "La Corunia",
    "16": "Cuenca",
    "17": "Gerona",
    "18": "Granada",
    "19": "Guadalajara",
    "20": "Guipuzcoa",
    "21": "Huelva",
    "22": "Huesca",
    "23": "Jaen",
    "24": "Leon",
    "25": "Lerida",
    "26": "La Rioja",
    "27": "Lugo",
    "28": "Madrid",
    "29": "Malaga",
    "30": "Murcia",
    "31": "Navarra",
    "32": "Orense",
    "33": "Asturias",
    "34": "Palencia",
    "35": "Las Palmas",
    "36": "Pontevedra",
    "37": "Salamanca",
    "38": "Santa Cruz de Tenerife",
    "39": "Cantabria",
    "40": "Segovia",
    "41": "Sevilla",
    "42": "Soria",
    "43": "Tarragona",
    "44": "Teruel",
    "45": "Toledo",
    "46": "Valencia",
    "47": "Valladolid",
    "48": "Vizcaya",
    "49": "Zamora",
    "50": "Zaragoza",
    "51": "Ceuta",
    "52": "Melilla"
};

/**
 * El campo Codigo Postal debe tener 5 numeros y debe ser menor de 53000 (Melilla)
 * @returns {Boolean}
 */
function validarCodigoPostal()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkCP");
    let iconoError = document.getElementById("errorCP");
    let codigoPostal = document.getElementById("cp").value.trim();
    let provincia = document.getElementById("provincia");
    
    if (codigoPostal.length === 5 && codigoPostal < 53000)
    {
        esValido = true;
        
        // Extraemos prefijo del Codigo Postal para seleccionar la provincia
        let prefijoCP = codigoPostal.substring(0, 2);
        let provinciaDetectada = CP_PROVINCIAS[prefijoCP];

        if (provinciaDetectada !== null) // Si existe la provincia, la seleccionamos en el formulario
        {
            provincia.value = provinciaDetectada;
        }
        else // Si el código de provincia NO existe, borramos la provincia del formulario
        {
            provincia.value = "";
        }
    }
    else // Si el Codigo Postal NO tiene 5 digitos
    {
        let esValido = false;
        provincia.value = "";
    }

    
    if(esValido === false) // Si el Codigo Postal NO cumple con el formato
    {
        // Ocultamos el icono del check
        iconoCheck.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoError.classList.remove("d-none");
        
        // Añadimos el borde rojo
        codigoPostal.classList.add("is-invalid");
        codigoPostal.classList.remove("is-valid");
    }
    else // Si el Codigo Postal cumple con el formato
    {
        // Mostramos el icono del check
        iconoCheck.classList.remove("d-none");
        
        // Ocultamos el icono del error
        iconoError.classList.add("d-none");
        
        // Añadimos el borde verde
        codigoPostal.classList.add("is-valid");
        codigoPostal.classList.remove("is-invalid");
    }
    
    return esValido;
}

/**
 * El campo Direccion debe tener el siguiente formato: Calle 'nomCalle', nº
 * @returns {Boolean}
 */
function validarDireccion()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkDireccion");
    let iconoError = document.getElementById("errorDireccion");
    let direccion = document.getElementById("direccion").value.trim();
    
    let formatoValido = /^Calle\s+[a-zA-Z0-9\sñÑáéíóúÁÉÍÓÚüÜ]+,\s*\d+$/i.test(direccion);
    
    if(formatoValido === true) // Si la Direccion cumple con el formato
    {
        esValido = true;
        // Mostramos el icono del check
        iconoCheck.classList.remove("d-none");
        
        // Ocultamos el icono del error
        iconoError.classList.add("d-none");
        
        // Añadimos el borde verde
        direccion.classList.add("is-valid");
        direccion.classList.remove("is-invalid");
    }
    else // Si la direccion NO cumple con el formato
    {
        esValido = false;
        // Ocultamos el icono del check
        iconoCheck.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoError.classList.remove("d-none");
        
        // Añadimos el borde rojo
        direccion.classList.add("is-invalid");
        direccion.classList.remove("is-valid");
    }
    
    return esValido;
}

/**
 * Se utiliza para validar todos los campos del formulario de Registro al darle al boton de 'Registrar'
 * @returns {undefined}
 */
function validarFormularioRegistro()
{
    // Validación completa al pulsar el boton de Enviar en el formulario
    document.getElementById('formRegistro').addEventListener('submit', validarFormularioCompleto);
}

/**
 * Función principal que orquesta todas las validaciones al pulsar Enviar
 * @param {Event} e - El evento del formulario (submit) para poder detenerlo
 */
function validarFormularioCompleto(e)
{
    let esValido = true;
    
    if (!validarPassword()()) esValido = false;
    if (!validarRepetirPassword()) esValido = false;
    if (!validarNombre()) esValido = false;
    if (!validarDni()) esValido = false;
    if (!validarTelefono()) esValido = false;
    if (!validarCodigoPostal()) esValido = false;
    if (!validarDireccion()) esValido = false;

    // Validamos el campo Nombre de Usuario (Tiene Fetch asíncrono)
    // Llamamos a la función para que compruebe el formato visualmente
    validarNombreUsuario()(); 
    
    let nomUsuario = document.getElementById("nomUsuario");
    
    // Si tiene la clase de error (rojo) O aún no tiene la de éxito (verde) porque el servidor está pensando, y por tanto, consideramos el formulario inválido por seguridad
    if (nomUsuario.classList.contains("is-invalid") || nomUsuario.classList.contains("is-valid")===false)
    {
        esValido = false;
    }
    
    // Validamos el campo Correo (Tiene Fetch asíncrono)
    // Llamamos a la función para que compruebe el formato visualmente
    validarCorreo(); 
    
    let correo = document.getElementById("correo");
    
    // Si tiene la clase de error (rojo) O aún no tiene la de éxito (verde) porque el servidor está pensando, y por tanto, consideramos el formulario inválido por seguridad
    if (correo.classList.contains("is-invalid") || correo.classList.contains("is-valid")===false)
    {
        esValido = false;
    }

    if (esValido===false) // Si hay algun error
    {
        e.preventDefault(); // Detenemos el envio del formulario
        
        window.scrollTo({ top: 0, behavior: 'smooth' }); // Hacemos scroll hacia arriba suavemente para que vean los errores
    }
}