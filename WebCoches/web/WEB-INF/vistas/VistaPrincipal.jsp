<%@include file="templates/header.jspf"%>

<div class="contenido">
    <div class="container-fluid h-100 p-0">
        <div class="row h-100 g-0">
            <div class="col-lg-6 contenedorCarrusel">
                <div id="carouselImages" class="carousel slide fadeCarrusel imagenCarrusel" data-bs-ride="carousel" data-bs-interval="4000">
                    <div class="anchoCarrusel">
                        <div class="elementoCarrusel active">
                            <img src="${pageContext.request.contextPath}/imagenes/concesionario.jpg?height=800&width=1200" alt="Concesionario TONICAR">
                        </div>
                        <div class="elementoCarrusel">
                            <img src="${pageContext.request.contextPath}/imagenes/inspeccion.webp?height=800&width=1200" alt="Taller Mecánico">
                        </div>
                        <div class="elementoCarrusel">
                            <img src="${pageContext.request.contextPath}/imagenes/online.jpg?height=800&width=1200" alt="Entrega de Vehículos">
                        </div>
                    </div>
                </div>
            </div>
            <!-- Carrusel de frases (derecha) -->
            <div class="col-lg-6 contenedorCarrusel">
                <div id="carouselSlogans" class="carousel slide fadeCarrusel sloganCarrusel" data-bs-ride="carousel" data-bs-interval="4000">
                    <div class="anchoCarrusel">
                        <div class="elementoCarrusel active">
                            <div class="contenidoSlogan">
                                <div class="iconoSlogan">
                                    <i class="bi bi-shield-fill-check"></i>
                                </div>
                                <h2 class="tituloSlogan">Tu Compra, Nuestra Garantía</h2>
                                <p class="textoSlogan">
                                    Cada vehículo pasa por <span class="slogan-highlight">rigurosas inspecciones</span> 
                                    para garantizar tu total satisfacción. Porque tu seguridad es nuestra prioridad.
                                </p>
                            </div>
                        </div>
                        <div class="elementoCarrusel">
                            <div class="contenidoSlogan">
                                <div class="iconoSlogan"><i class="bi bi-heart-fill"></i></div>
                                <h2 class="tituloSlogan">Pasión por el Detalle</h2>
                                <p class="textoSlogan">
                                    No vendemos coches, creamos experiencias.
                                </p>
                            </div>
                        </div>
                        <div class="elementoCarrusel">
                            <div class="contenidoSlogan">
                                <div class="iconoSlogan"><i class="bi bi-heart-fill"></i></div>
                                <h2 class="tituloSlogan">Confianza desde el primer contacto</h2>
                                <p class="textoSlogan">
                                    Sabemos que comprar un coche es una decisión importante. Por eso, cada vehículo en nuestro catálogo pasa por una inspección técnica rigurosa y certificada.<br>
                                    Transparencia, respaldo y atención personalizada.
                                </p>
                            </div>
                        </div>
                            <div class="elementoCarrusel">
                            <div class="contenidoSlogan">
                                <div class="iconoSlogan"><i class="bi bi-heart-fill"></i></div>
                                <h2 class="tituloSlogan">Calidad que habla por sí sola</h2>
                                <p class="textoSlogan">
                                    No vendemos solo coches: ofrecemos movilidad con garantía, historial verificado y precios justos.<br>
                                    Cada unidad está preparada para entregarse lista para conducir, sin sorpresas ocultas.
                                </p>
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
