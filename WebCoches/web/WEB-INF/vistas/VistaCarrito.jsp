<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Compra de Vehículo - TONICAR</title>
  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    #prueba{
      max-width: 400px; 
      margin: 0 auto;
          }
    
  </style>


<div class="container mt-4">
  <div class="row">
    <!-- Columna 1: Logo y Factura en dos subcolumnas -->
    <div class="col-md-6 text-center">
      <div class="col-12 text-center">
        <div class="bg-dark text-white d-inline-block px-4 py-2 rounded w-100">
                <strong>FACTURA</strong>
        </div>
      </div>
      <img src="usuario.png" alt="Logo Empresa" class="mb-4" style="max-width: 150px;">

      <!-- Subcolumnas para conceptos y valores -->
      <div class="container-fluid">
        <div class="row text-start">
          <!-- Subcolumna izquierda: Conceptos -->
          <div class="col-7">
            <div>Matrícula del vehículo</div>
            <div>Descripción del Vehículo</div>
            <div>Marca</div>
            <div>Modelo</div>
            <div>Año</div>
            <div>Potencia</div>
            <div>Combustible</div>
            <div>Transmisión</div>
            <div>Color</div>
            <div>Precio sin IVA</div>
            <div>Descuento (5%)</div>
            <div>IVA (21%)</div>
            <div class="mt-2"><strong>Precio Total:</strong></div>
          </div>
          <!-- Subcolumna derecha: Valores -->
          <div class="col-5 text-end">
            <div>123456BHK</div>
            <div>-- </div>
            <div>FORD</div>
            <div>Fiesta</div>
            <div>2020</div>
            <div>150 CV</div>
            <div>Gasolina</div>
            <div>Manual</div>
            <div>Verde</div>
            <div>35000€</div>
            <div>500€</div>
            <div>1500€</div>
            <div class="mt-2"><strong>54.354€</strong></div>
          </div>
        </div>
      </div>
    </div>

    <!-- Columna 2: Datos Bancarios -->
    <div class="col-md-6 text-center">
      <div class="bg-dark text-white d-inline-block px-4 py-2 rounded w-100">
                <strong>DATOS BANCARIOS</strong>
      </div>
      <form name="formCarrito" id="formCarrito" action="vistaConfirmado.jsp" target="_self">
        <div class="mb-3 text-start"  id="prueba">
          <label for="titular" class="formularioLabel">Titular de la cuenta</label>
          <input type="text" class="formularioInput" id="titular">
        </div>
        <div class="mb-3 text-start" style="max-width: 400px; margin: 0 auto;">
          <label for="iban" class="formularioLabel">IBAN</label>
          <input type="text" class="formularioInput" id="iban" placeholder="ESXX XXXX XXXX XX XXXXXXXXXX">
        </div>
        <div class="mb-3 text-start" style="max-width: 400px; margin: 0 auto;">
          <label for="bic" class="formularioLabel">BIC/SWIFT</label>
          <input type="text" class="formularioInput" id="bic">
        </div>
        <div class="mb-3 text-start" style="max-width: 400px; margin: 0 auto;">
          <label for="tarjeta" class="formularioLabel">Número de tarjeta</label>
          <input type="text" class="formularioInput" id="tarjeta" placeholder="XXXX XXXX XXXX XXXX">
        </div>
        <div class="row">
          <div class="col-6 mb-3 text-start">
            <label for="caducidad" class="formularioLabel">Caducidad</label>
            <input type="text" class="formularioInput" id="caducidad" placeholder="MM/AA">
          </div>
          <div class="col-6 mb-3 text-start">
            <label for="cvv" class="formularioLabel">CVV</label>
            <input type="text" class="formularioInput" id="cvv" placeholder="XXX">
          </div>
        </div>
        <button type="submit" class="btn btn-primary">Confirmar Pago</button>
        <button type="reset" class="btn btn-warning">Limpiar Datos</button>
        <a href="vistaCatalogo.jsp" target="_self" button class="btn btn-secondary">Cerrar</a>
      </form>
    </div>
  </div>
</div>
  <!-- Bootstrap 5 JS Bundle -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>   