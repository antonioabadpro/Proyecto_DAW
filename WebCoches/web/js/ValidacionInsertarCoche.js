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

