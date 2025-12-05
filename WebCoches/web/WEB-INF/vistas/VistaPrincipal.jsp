<%@include file="templates/header.jspf"%>

<div class="contenido">
    <div class="container-fluid p-0">
        <div class="row g-0">
            <div class="col-lg-6 contenedorCarrusel">
                <div id="carouselImages" class="carousel slide imagenCarusel carousel-fade" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="${pageContext.request.contextPath}/imagenes/concesionario.png" alt="Concesionario">
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/imagenes/inspeccion.png" alt="Taller">
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/imagenes/vendedor2.jpg" alt="vendedor">
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/imagenes/mecanico.jpg" alt="mecanico">
                        </div>
                         <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/imagenes/inspeccion2.jpg" alt="inspeccion">
                        </div>
                         <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/imagenes/vendedor.png" alt="concesionario2">
                        </div>
                         <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/imagenes/taller.jpg" alt="taller">
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/imagenes/online.png" alt="taller">
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6 contenedorCarrusel">
                <div id="carouselSlogans" class="carousel slide sloganCarrusel carousel-fade" data-bs-ride="carousel" data-bs-interval="4000">
                    <div class="carousel-inner w-100"> <div class="carousel-item active">
                            <div class="contenidoSlogan">
                                <div class="iconoSlogan">
                                    <i class="bi bi-shield-fill-check"></i>
                                </div>
                                <h2 class="tituloSlogan">Tu Compra, Nuestra Garantía</h2>
                                <p class="textoSlogan">
                                    Cada vehículo pasa por <span class="slogan-highlight">rigurosas inspecciones</span> 
                                    para garantizar tu total satisfacción.
                                </p>
                            </div>
                        </div>

                        <div class="carousel-item">
                            <div class="contenidoSlogan">
                                <div class="iconoSlogan"><i class="bi bi-clock-history"></i></div>
                                <h2 class="tituloSlogan">Atención 24/7</h2>
                                <p class="textoSlogan">
                                    Estamos disponibles en <span class="slogan-highlight">todo momento</span> 
                                    para resolver tus dudas.
                                </p>
                            </div>
                        </div>

                        <div class="carousel-item">
                            <div class="contenidoSlogan">
                                <div class="iconoSlogan"><i class="bi bi-hand-thumbs-up-fill"></i></div>
                                <h2 class="tituloSlogan">Compra 100% Segura</h2>
                                <p class="textoSlogan">
                                    Tecnología de pago seguro y proceso transparente.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="templates/footer.jspf"%>