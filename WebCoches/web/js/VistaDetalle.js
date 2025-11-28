// Configurar el carrusel para avance automático cada 4 segundos
const carousel = new bootstrap.Carousel(document.getElementById('carouselCoche'), {
    interval: 4000,
    ride: 'carousel',
    wrap: true
});