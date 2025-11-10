
const leftEl = document.querySelector('#carouselImages');
const rightEl = document.querySelector('#carouselText');

const leftCarousel = new bootstrap.Carousel(leftEl, {interval: false});
const rightCarousel = new bootstrap.Carousel(rightEl, {interval: false});

const totalSlides = leftEl.querySelectorAll('.carousel-item').length;
let currentIndex = 0;
const intervalTime = 2000; // 5 segundos + 0.6s de transición aprox.

// Función de transicion para el carrusel de imagenes
function nextSlide()
{
    currentIndex = (currentIndex + 1) % totalSlides;

    // Avanza ambos carruseles al mismo índice
    leftCarousel.to(currentIndex);
    rightCarousel.to(currentIndex);
}

// Inicia con un pequeño retardo para respetar la animación inicial
setTimeout(() => {
    setInterval(nextSlide, intervalTime);
}, intervalTime);


