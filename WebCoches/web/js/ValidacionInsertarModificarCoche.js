/* 
 * Utilizado en WebCoches/gestion/insertar
 * Funciones para validar los campos del Formulario de Insertar Coche (Admin)
 */

function limpiarFormulario()
{
    if (confirm('¿Está seguro de que desea limpiar el formulario?'))
    {
        document.getElementById('formAltaCoche').reset();
    }
}

function cerrarVista()
{
    window.location.href = 'VistaGestionCoches.jsp';
}

// Validación adicional antes de enviar
document.getElementById('formAltaCoche').addEventListener('submit', function (e) {
    const precio = parseFloat(document.getElementById('precio').value);
    const descuento = parseFloat(document.getElementById('descuento').value);

    if (precio <= 0) {
        e.preventDefault();
        alert('El precio debe ser mayor que 0');
        return false;
    }

    if (descuento < 0 || descuento > 100) {
        e.preventDefault();
        alert('El descuento debe estar entre 0 y 100');
        return false;
    }
});

/**
 * El campo Matricula debe tener 4 números y 3 letras en mayúscula (nnnnLLL)
 * @returns {Boolean}
 */
function validarMatricula()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkMatricula");
    let iconoError = document.getElementById("errorMatricula");
    let iconoErrorFormato = document.getElementById("errorFormatoMatricula");
    let matricula = document.getElementById("matricula").value.trim();

    const formatoValido = /^\d{4}[A-Z]{3}$/.test(matricula);

    if (formatoValido === true) // Si la Matricula cumple con el formato
    {
        esValido = validarMatriculaFetch();
    }
    else // Si la Matricula NO cumple con el formato
    {
        esValido = false;
        // Ocultamos el icono del check
        iconoCheck.classList.add("d-none");
        iconoErrorFormato.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoError.classList.remove("d-none");
        
        // Añadimos el borde rojo
        matricula.classList.add("is-invalid");
        matricula.classList.remove("is-valid");
    }
    return esValido;
}

/**
 * Funcion llamada desde 'validarMatricula()' para comprobar que la matricula NO existe en la BD una vez que el formato del campo es correcto
 * @returns {Boolean}
 */
async function validarMatriculaFetch()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkMatricula");
    let iconoError = document.getElementById("errorMatricula");
    let iconoErrorFormato = document.getElementById("errorFormatoMatricula");
    let matricula = document.getElementById("matricula");
    
    let parametrosEnviados = new URLSearchParams(); // Datos enviados al Servidor/Controlador
    parametrosEnviados.append("matriculaFetch", matricula.value);
    
    let respuestaServidor = await fetch("/WebCoches/gestion/comprobarMatricula", {
        method: 'POST',
        body: parametrosEnviados
    });
    
    if(respuestaServidor.ok) // Si el Servidor ha realizado la peticion correctamente (Estado HTTP 200-299)
    {
        let resultadoConsulta = await respuestaServidor.text();
        
        console.log("resultadoConsulta desde JS: " + resultadoConsulta);
        
        if(resultadoConsulta === "NOexisteMatricula") // Si NO existe la matricula en la BD
        {
            esValido = true;
            // Mostramos el icono del check
            iconoCheck.classList.remove("d-none");

            // Ocultamos el icono del error del formato y el icono del error porque ya existe
            iconoErrorFormato.classList.add("d-none");
            iconoError.classList.add("d-none");

            // Añadimos el borde verde
            matricula.classList.add("is-valid");
            matricula.classList.remove("is-invalid");
        }
        else // Si existe la matricula en la BD
        {
            esValido = false;
            // Ocultamos el icono del check y el del error por el formato
            iconoCheck.classList.add("d-none");
            iconoErrorFormato.classList.add("d-none");

            // Mostramos el icono del error
            iconoError.classList.remove("d-none");

            // Añadimos el borde rojo
            matricula.classList.add("is-invalid");
            matricula.classList.remove("is-valid");
        }
    }
    return esValido;
}

/**
 * El campo Marca NO debe estar vacio
 * @returns {Boolean}
 */
function validarMarca()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkMarca");
    let iconoError = document.getElementById("errorMarca");
    let marca = document.getElementById("marca").value;
    
    if(marca === "") // Si NO hemos seleccionado ninguna Marca
    {
        esValido = false;
        // Ocultamos el icono del check
        iconoCheck.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoError.classList.remove("d-none");
        
        // Añadimos el borde rojo
        marca.classList.add("is-invalid");
        marca.classList.remove("is-valid");
    }
    else // Si hemos seleccionado una Marca
    {
        esValido = true;
        // Mostramos el icono del check
        iconoCheck.classList.remove("d-none");
        
        // Ocultamos el icono del error
        iconoError.classList.add("d-none");
        
        // Añadimos el borde verde
        marca.classList.add("is-valid");
        marca.classList.remove("is-invalid");
    }
    return esValido;
}

/**
 * El campo Modelo NO puede estar vacio
 * @returns {Boolean}
 */
function validarModelo()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkModelo");
    let iconoError = document.getElementById("errorModelo");
    let modelo = document.getElementById("nombreModelo").value;
    
    if(modelo === "") // Si el Modelo esta vacio
    {
        esValido = false;
        // Ocultamos el icono del check
        iconoCheck.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoError.classList.remove("d-none");
        
        // Añadimos el borde rojo
        modelo.classList.add("is-invalid");
        modelo.classList.remove("is-valid");
        
    }
    else // Si el Modelo NO esta vacio
    {
        esValido = true;
        // Mostramos el icono del check
        iconoCheck.classList.remove("d-none");
        
        // Ocultamos el icono del error
        iconoError.classList.add("d-none");
        
        // Añadimos el borde verde
        modelo.classList.add("is-valid");
        modelo.classList.remove("is-invalid");
    }
    return esValido;
}

/**
 * El campo Color NO puede estar vacio
 * @returns {Boolean}
 */
function validarColor()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkColor");
    let iconoError = document.getElementById("errorColor");
    let color = document.getElementById("color").value;
    
    if(color === "") // Si el Color esta vacio
    {
        esValido = false;
        // Ocultamos el icono del check
        iconoCheck.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoError.classList.remove("d-none");
        
        // Añadimos el borde rojo
        color.classList.add("is-invalid");
        color.classList.remove("is-valid");
        
    }
    else // Si el Color NO esta vacio
    {
        esValido = true;
        // Mostramos el icono del check
        iconoCheck.classList.remove("d-none");
        
        // Ocultamos el icono del error
        iconoError.classList.add("d-none");
        
        // Añadimos el borde verde
        color.classList.add("is-valid");
        color.classList.remove("is-invalid");
    }
    return esValido;
}

function validarDescripcion()
{
    
}

/**
 * El campo Combustible NO debe estar vacio
 * @returns {Boolean}
 */
function validarCombustible()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkCombustible");
    let iconoError = document.getElementById("errorCombustible");
    let combustible = document.getElementById("combustible").value;
    
    if(combustible === "") // Si NO hemos seleccionado ninguna Marca
    {
        esValido = false;
        // Ocultamos el icono del check
        iconoCheck.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoError.classList.remove("d-none");
        
        // Añadimos el borde rojo
        combustible.classList.add("is-invalid");
        combustible.classList.remove("is-valid");
    }
    else // Si hemos seleccionado una Marca
    {
        esValido = true;
        // Mostramos el icono del check
        iconoCheck.classList.remove("d-none");
        
        // Ocultamos el icono del error
        iconoError.classList.add("d-none");
        
        // Añadimos el borde verde
        combustible.classList.add("is-valid");
        combustible.classList.remove("is-invalid");
    }
    return esValido;
}

/***
 * El campo Consumo debe ser un numero positivo
 * @returns {Boolean}
 */
function validarConsumo()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkConsumo");
    let iconoError = document.getElementById("errorConsumo");
    let consumo = document.getElementById("consumo").value;
    
    if(consumo < 0) // Si el consumo NO es un numero positivo
    {
        esValido = false;
        // Ocultamos el icono del check
        iconoCheck.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoError.classList.remove("d-none");
        
        // Añadimos el borde rojo
        consumo.classList.add("is-invalid");
        consumo.classList.remove("is-valid");
    }
    else // Si el consumo es un numero positivo
    {
        esValido = true;
        // Mostramos el icono del check
        iconoCheck.classList.remove("d-none");
        
        // Ocultamos el icono del error
        iconoError.classList.add("d-none");
        
        // Añadimos el borde verde
        consumo.classList.add("is-valid");
        consumo.classList.remove("is-invalid");
    }
    return esValido;
}

/**
 * El campo Potencia debe ser un numero positivo
 * @returns {Boolean}
 */
function validarPotencia()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkPotencia");
    let iconoError = document.getElementById("errorPotencia");
    let potencia = document.getElementById("cv").value;
    
    if(potencia < 0) // Si la Potencia NO es un numero positivo
    {
        esValido = false;
        // Ocultamos el icono del check
        iconoCheck.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoError.classList.remove("d-none");
        
        // Añadimos el borde rojo
        potencia.classList.add("is-invalid");
        potencia.classList.remove("is-valid");
    }
    else // Si la Potencia es un numero positivo
    {
        esValido = true;
        // Mostramos el icono del check
        iconoCheck.classList.remove("d-none");
        
        // Ocultamos el icono del error
        iconoError.classList.add("d-none");
        
        // Añadimos el borde verde
        potencia.classList.add("is-valid");
        potencia.classList.remove("is-invalid");
    }
    return esValido;
}

/**
 * El campo Tipo de Cambio NO debe estar vacio
 * @returns {Boolean}
 */
function validarTipoCambio()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkCajaCambios");
    let iconoError = document.getElementById("errorCajaCambios");
    let cajaCambios = document.getElementById("cajaCambios").value;
    
    if(cajaCambios === "") // Si NO hemos seleccionado ningun Tipo de Cambio
    {
        esValido = false;
        // Ocultamos el icono del check
        iconoCheck.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoError.classList.remove("d-none");
        
        // Añadimos el borde rojo
        cajaCambios.classList.add("is-invalid");
        cajaCambios.classList.remove("is-valid");
    }
    else // Si hemos seleccionado un Tipo de Cambio
    {
        esValido = true;
        // Mostramos el icono del check
        iconoCheck.classList.remove("d-none");
        
        // Ocultamos el icono del error
        iconoError.classList.add("d-none");
        
        // Añadimos el borde verde
        cajaCambios.classList.add("is-valid");
        cajaCambios.classList.remove("is-invalid");
    }
    return esValido;
}

/**
 * El campo Kilometros debe ser un numero positivo
 * @returns {Boolean}
 */
function validarKilometros()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkKm");
    let iconoError = document.getElementById("errorKm");
    let potencia = document.getElementById("km").value;
    
    if(potencia < 0) // Si los kilometros NO son un numero positivo
    {
        esValido = false;
        // Ocultamos el icono del check
        iconoCheck.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoError.classList.remove("d-none");
        
        // Añadimos el borde rojo
        potencia.classList.add("is-invalid");
        potencia.classList.remove("is-valid");
    }
    else // Si los kilometros son un numero positivo
    {
        esValido = true;
        // Mostramos el icono del check
        iconoCheck.classList.remove("d-none");
        
        // Ocultamos el icono del error
        iconoError.classList.add("d-none");
        
        // Añadimos el borde verde
        potencia.classList.add("is-valid");
        potencia.classList.remove("is-invalid");
    }
    return esValido;
}

/**
 * El campo Fecha NO debe estar vacio
 * @returns {Boolean}
 */
function validarFecha()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkFecha");
    let iconoError = document.getElementById("errorFecha");
    let fecha = document.getElementById("fecha").value;
    
    if(fecha === "") // Si NO hemos seleccionado ninguna Fecha
    {
        esValido = false;
        // Ocultamos el icono del check
        iconoCheck.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoError.classList.remove("d-none");
        
        // Añadimos el borde rojo
        fecha.classList.add("is-invalid");
        fecha.classList.remove("is-valid");
    }
    else // Si hemos seleccionado una Fecha
    {
        esValido = true;
        // Mostramos el icono del check
        iconoCheck.classList.remove("d-none");
        
        // Ocultamos el icono del error
        iconoError.classList.add("d-none");
        
        // Añadimos el borde verde
        fecha.classList.add("is-valid");
        fecha.classList.remove("is-invalid");
    }
    return esValido;
}

/**
 * El campo Estado NO debe estar vacio
 * @returns {Boolean}
 */
function validarEstado()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkEstado");
    let iconoError = document.getElementById("errorEstado");
    let estado = document.getElementById("estado").value;
    
    if(estado === "") // Si NO hemos seleccionado ningun Estado
    {
        esValido = false;
        // Ocultamos el icono del check
        iconoCheck.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoError.classList.remove("d-none");
        
        // Añadimos el borde rojo
        estado.classList.add("is-invalid");
        estado.classList.remove("is-valid");
    }
    else // Si hemos seleccionado un Estado
    {
        esValido = true;
        // Mostramos el icono del check
        iconoCheck.classList.remove("d-none");
        
        // Ocultamos el icono del error
        iconoError.classList.add("d-none");
        
        // Añadimos el borde verde
        estado.classList.add("is-valid");
        estado.classList.remove("is-invalid");
    }
    return esValido;
}

/**
 * El campo Precio debe ser un numero positivo
 * @returns {Boolean}
 */
function validarPrecio()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkPrecio");
    let iconoError = document.getElementById("errorPrecio");
    let precio = document.getElementById("precio").value;
    
    if(precio < 500) // Si el Precio es menor de 500€
    {
        esValido = false;
        // Ocultamos el icono del check
        iconoCheck.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoError.classList.remove("d-none");
        
        // Añadimos el borde rojo
        precio.classList.add("is-invalid");
        precio.classList.remove("is-valid");
    }
    else // Si el Precio es >=500€
    {
        esValido = true;
        // Mostramos el icono del check
        iconoCheck.classList.remove("d-none");
        
        // Ocultamos el icono del error
        iconoError.classList.add("d-none");
        
        // Añadimos el borde verde
        precio.classList.add("is-valid");
        precio.classList.remove("is-invalid");
    }
    return esValido;
}

/**
 * El campo Precio debe ser un numero positivo
 * @returns {Boolean}
 */
function validarDescuento()
{
    let esValido = false;
    let iconoCheck = document.getElementById("checkDescuento");
    let iconoError = document.getElementById("errorDescuento");
    let descuento = document.getElementById("descuento").value;
    
    if(descuento < 0) // Si el Descuento NO es un numero positivo
    {
        esValido = false;
        // Ocultamos el icono del check
        iconoCheck.classList.add("d-none");
        
        // Mostramos el icono del error
        iconoError.classList.remove("d-none");
        
        // Añadimos el borde rojo
        descuento.classList.add("is-invalid");
        descuento.classList.remove("is-valid");
    }
    else // Si el Descuento es un numero positivo
    {
        esValido = true;
        // Mostramos el icono del check
        iconoCheck.classList.remove("d-none");
        
        // Ocultamos el icono del error
        iconoError.classList.add("d-none");
        
        // Añadimos el borde verde
        descuento.classList.add("is-valid");
        descuento.classList.remove("is-invalid");
    }
    return esValido;
}
