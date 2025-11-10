<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>fondo principal TONICAR</title>
	<!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    html, body { height: 100%; margin: 0; }
    .full-height { min-height: 100vh; }
    .card { border: 1px solid #dee2e6; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
  </style>
</head>
<body>
  <div class="container-fluid h-100 p-3">
    <div class="row h-100 g-3">
      
      <!-- Columna 1: Carrusel de Imágenes -->
      <div class="col-6 d-flex">
        <div class="card w-100 overflow-hidden">
          <div id="carouselImages" class="carousel slide h-100" data-bs-ride="carousel" data-bs-interval="3000">
            <div class="carousel-inner h-100">
              <div class="carousel-item active h-100">
                <img src="foto1.png" class="d-block w-100 h-100" style="object-fit: cover;" alt="Foto 1">
              </div>
              <div class="carousel-item h-100">
                <img src="foto2.png" class="d-block w-100 h-100" style="object-fit: cover;" alt="Foto 2">
              </div>
              <div class="carousel-item h-100">
                <img src="foto3.png" class="d-block w-100 h-100" style="object-fit: cover;" alt="Foto 3">
              </div>
              <div class="carousel-item h-100">
                <img src="foto4.png" class="d-block w-100 h-100" style="object-fit: cover;" alt="Foto 4">
              </div>
              <div class="carousel-item h-100">
                <img src="foto5.png" class="d-block w-100 h-100" style="object-fit: cover;" alt="Foto 5">
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Columna 2: Carrusel de Textos -->
      <div class="col-6 d-flex">
        <div class="card w-100">
          <div id="carouselText" class="carousel slide h-100" data-bs-ride="carousel" data-bs-interval="3000">
            <div class="carousel-inner h-100 d-flex align-items-center">
              <div class="carousel-item active h-100 d-flex align-items-center">
                <div class="text-center w-100 p-4">
                  <h3>Texto 1</h3>
                  <p>Descripción adicional del primer mensaje.</p>
                </div>
              </div>
              <div class="carousel-item h-100 d-flex align-items-center">
                <div class="text-center w-100 p-4">
                  <h3>Texto 2</h3>
                  <p>Descripción adicional del segundo mensaje.</p>
                </div>
              </div>
              <div class="carousel-item h-100 d-flex align-items-center">
                <div class="text-center w-100 p-4">
                  <h3>Texto 3</h3>
                  <p>Descripción adicional del tercer mensaje.</p>
                </div>
              </div>
              <div class="carousel-item h-100 d-flex align-items-center">
                <div class="text-center w-100 p-4">
                  <h3>Texto 4</h3>
                  <p>Descripción adicional del cuarto mensaje.</p>
                </div>
              </div>
              <div class="carousel-item h-100 d-flex align-items-center">
                <div class="text-center w-100 p-4">
                  <h3>Texto 5</h3>
                  <p>Descripción adicional del quinto mensaje.</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>