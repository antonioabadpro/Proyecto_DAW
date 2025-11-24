// Configurar el carrusel para avance automático cada 4 segundos
const carousel = new bootstrap.Carousel(document.getElementById('carouselCoche'), {
    interval: 4000,
    ride: 'carousel',
    wrap: true
});

function cerrarVista()
{
    // Opción 1: Volver a la página anterior
    window.history.back();
            
    // Opción 2: Redirigir a una página específica
    // window.location.href = 'catalogo.jsp';

    // Opción 3: Cerrar ventana si fue abierta en popup
    // window.close();
}


