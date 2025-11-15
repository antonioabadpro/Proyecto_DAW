<%@include  file="templates/header.jspf"%>

<div class="wrapper">
    <div class="container p-5">
        <div class="row g-0">
            <!-- Carrusel de imágenes (izquierda) -->
            <div class="col-md-6 d-flex align-items-center justify-content-center text-carousel">
                <div id="carouselImages" class="carousel slide carousel-fade">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="${pageContext.request.contextPath}/imagenes/concesionario.webp" class="d-block w-100 rounded" alt="Coche 1">
                        </div>
                        <div class="carousel-item ">
                            <img src="${pageContext.request.contextPath}/imagenes/taller.jpg" class="d-block w-100 rounded"  alt="Coche 2">
                        </div>
                        <div class="carousel-item ">
                            <img src="${pageContext.request.contextPath}/imagenes/mecanico.jpg" class="d-block w-100 rounded" alt="Coche 3">
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/imagenes/cliente.avif" class="d-block w-100 rounded" alt="Coche 4">
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/imagenes/vendedor.webp" class="d-block w-100 rounded" alt="Coche 5">
                        </div>
                    </div>
                </div>
            </div>

            <!-- Carrusel de frases (derecha) -->
            <div class="col-md-6 d-flex align-items-center justify-content-center text-carousel">
                <div id="carouselText" class="carousel slide carousel-fade">
                    <div class="carousel-inner">

                        <!-- Frase 1 -->
                        <div class="carousel-item active">
                            <div class="p-4 rounded-4 shadow chuli">

                                <h1 class="fw-semibold mb-3">Confianza desde el primer contacto</h1>
                                <p  class="mb-0 fs-3 text-secondary  text-justify">
                                    Sabemos que comprar un coche es una decisión importante. Por eso, cada vehículo en nuestro catálogo pasa por una inspección técnica rigurosa y certificada.<br>
                                    Transparencia, respaldo y atención personalizada.<br>
                                    <span class="text-success fw-semibold">Tu tranquilidad es nuestra prioridad.</span>
                                </p>
                            </div>
                        </div>

                        <!-- Frase 2 -->
                        <div class="carousel-item">
                            <div class="p-4 rounded-4 shadow chuli">
                                <h1 class="h1">Calidad que habla por sí sola</h1>
                                <p  class="mb-0 fs-3 text-secondary text-justify">
                                    No vendemos solo coches: ofrecemos movilidad con garantía, historial verificado y precios justos.<br>
                                    Cada unidad está preparada para entregarse lista para conducir, sin sorpresas ocultas.<br>
                                    <span class="text-success fw-semibold">
                                        Porque tu tiempo y tu dinero merecen el mejor trato.</span>
                                </p>
                            </div>
                        </div>

                        <!-- Frase 3 -->
                        <div class="carousel-item">
                            <div class="p-4 rounded-4 shadow chuli">
                                <h1 class="fw-semibold mb-3">Tu confianza nos mueve</h1>
                                <p  class="mb-0 fs-3 text-secondary text-justify">
                                    Más que una venta, buscamos relaciones duraderas con nuestros clientes.<br>
                                    <span class="text-success fw-semibold">Cada coche entregado representa nuestro compromiso con la calidad y la transparencia.</span>
                                </p>
                            </div>
                        </div>
                        <!-- Frase 4 -->
                        <div class="carousel-item">
                            <div class="p-4 rounded-4 shadow chuli">
                                <h1 class="fw-semibold mb-3">Garantía que inspira confianza</h1>
                                <p  class="mb-0 fs-3 text-secondary text-justify">
                                    Todos nuestros vehículos incluyen garantía extendida, informe de historial completo y opción de devolución.<br>
                                    Asumimos el riesgo para que tú disfrutes la experiencia.<br>
                                    <span class="text-success fw-semibold">Porque creemos en lo que ofrecemos.</span>
                                </p>
                            </div>
                        </div>
                        <!-- Frase 5 -->
                        <div class="carousel-item">
                            <div class="p-4 rounded-4 shadow chuli">
                                <h1 class="fw-semibold mb-3">Tecnología al servicio de tu comodidad</h1>
                                <p  class="mb-0 fs-3 text-secondary text-justify">
                                    Compra tu próximo coche desde casa, con visitas virtuales 360°, financiación online y entrega a domicilio.<br>
                                    Innovación y servicio convergen para ofrecerte una experiencia moderna, segura y sin complicaciones.<br>
                                    <span class="text-success fw-semibold">El futuro de la movilidad ya está aquí.</span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@include  file="templates/footer.jspf"%>
