/**
 * El campo Contraseña NO puede estar vacio
 * @returns {Boolean}
 */
function validarPassword()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkPassword1");
    let iconoError = document.getElementById("errorPassword1");
    let password1 = document.getElementById("password1").value;
    
    if(password1 === "") // Si la password esta vacia
    {
        esValido = false;
        // Ocultamos el icono del check
        iconoCheck.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoError.classList.remove("d-none");
        
        // Añadimos el borde rojo
        password1.classList.add("is-invalid");
        password1.classList.remove("is-valid");
        
    }
    else // Si la password NO esta vacia
    {
        esValido = true;
        // Mostramos el icono del check
        iconoCheck.classList.remove("d-none");
        
        // Ocultamos el icono del error
        iconoError.classList.add("d-none");
        
        // Añadimos el borde verde
        password1.classList.add("is-valid");
        password1.classList.remove("is-invalid");
    }
    
    return esValido;
}

/**
 * El campo Repetir Contraseña NO debe estar vacio y debe coincidir con la contraseña introducida en el campo Contraseña
 * @returns {Boolean}
 */
function validarRepetirPassword()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkPassword2");
    let iconoError = document.getElementById("errorPassword2");
    let password1 = document.getElementById("password1").value;
    let password2 = document.getElementById("password2").value;
    
    if(password1.trim() === password2.trim() && password1 !== "") // Si las passwords coinciden
    {
        esValido = true;
        // Mostramos el icono del check
        iconoCheck.classList.remove("d-none");
        
        // Ocultamos el icono del error
        iconoError.classList.add("d-none");
        
        // Añadimos el borde verde
        password2.classList.add("is-valid");
        password2.classList.remove("is-invalid");        
    }
    else // Si las passwords NO coinciden
    {
        esValido = false;
        // Ocultamos el icono del check
        iconoCheck.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoError.classList.remove("d-none");
        
        // Añadimos el borde rojo
        password2.classList.add("is-invalid");
        password2.classList.remove("is-valid");
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

    if(nombre === "" || nombre.length === 0 || nombre === null)
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
    
    if(formatoValido === true) // Si el DNI cumple con el formato
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
    else // Si el DNI NO cumple con el formato
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