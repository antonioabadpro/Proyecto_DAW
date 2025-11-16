<%@include file="templates/header.jspf"%>

<div class="main-content">
    <div class="container-fluid h-100 p-0">
        <div class="row h-100 g-0">
            <div class="col-lg-6 carousel-container">
                <div id="carouselImages" class="carousel slide carousel-fade carousel-images" data-bs-ride="carousel" data-bs-interval="4000">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="${pageContext.request.contextPath}/imagenes/concesionario.jpg?height=800&width=1200" alt="Concesionario TONICAR">
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/imagenes/inspeccion.webp?height=800&width=1200" alt="Taller Mecánico">
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/imagenes/online.jpg?height=800&width=1200" alt="Entrega de Vehículos">
                        </div>
                    </div>
                </div>
            </div>
            <!-- Carrusel de frases (derecha) -->
            <div class="col-lg-6 carousel-container">
                <div id="carouselSlogans" class="carousel slide carousel-fade carousel-slogans" data-bs-ride="carousel" data-bs-interval="4000">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="slogan-content">
                                <div class="slogan-icon">
                                    <i class="bi bi-shield-fill-check"></i>
                                </div>
                                <h2 class="slogan-title">Tu Compra, Nuestra Garantía</h2>
                                <p class="slogan-text"> Cada vehículo pasa por <span class="slogan-highlight">rigurosas inspecciones</span> 
                                    para garantizar tu total satisfacción. Porque tu seguridad es nuestra prioridad. </p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="slogan-content">
                                <div class="slogan-icon"><i class="bi bi-heart-fill"></i></div>
                                <h2 class="slogan-title">Pasión por el Detalle</h2>
                                <p class="slogan-text">No vendemos coches, creamos experiencias.</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="slogan-content">
                                <div class="slogan-icon"><i class="bi bi-heart-fill"></i></div>
                                <h2 class="slogan-title">Confianza desde el primer contacto</h2>
                                <p class="slogan-text">Sabemos que comprar un coche es una decisión importante. Por eso, cada vehículo en nuestro catálogo pasa por una inspección técnica rigurosa y certificada.<br>
                                    Transparencia, respaldo y atención personalizada.</p>
                            </div>
                        </div>
                            <div class="carousel-item">
                            <div class="slogan-content">
                                <div class="slogan-icon"><i class="bi bi-heart-fill"></i></div>
                                <h2 class="slogan-title">Calidad que habla por sí sola</h2>
                                <p class="slogan-text">No vendemos solo coches: ofrecemos movilidad con garantía, historial verificado y precios justos.<br>
                                   Cada unidad está preparada para entregarse lista para conducir, sin sorpresas ocultas.</p>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="templates/footer.jspf"%>
