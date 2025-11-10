<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>vista SESION</title>
	<!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
	.notebook-paper {
      background-color: white;
      border: 1px solid #ccc;
      border-radius: 8px;
      padding: 20px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      position: relative;
      margin: 30px auto;
      max-width: 600px;
    }
</style>
</head>

<body>
	<div  class="container-fluid notebook-paper">
		<!-- Encabezado -->
    <div class="container mb-3">
    	<div class="row">
    		<div class="col">
    			<div class="bg-dark text-white d-inline-block px-4 py-2 rounded">
		        	<strong>INICIO DE SESIÓN</strong>
		        </div>
		    </div>
		</div>
        <div class="row">
        	<div class="col">
        		<form name="formSesion" action="compruebaSesion.jsp">
        			<div class="mb-3">
					  <label for="formGroupExampleInput" class="form-label">Usuario</label>
					  <input type="text" class="form-control" name="usuario" id="usuario" placeholder="Introduce tu usuario">
					</div>
					<div class="mb-3">
					  <label for="formGroupExampleInput" class="form-label">Clave</label>
					  <input type="password" class="form-control" name="clave" id="clave" placeholder="Introduce tu clave">
					</div>
					<div class="mb-3">
							
							<input type="submit" button class="btn btn-primary btn-custom" name="enviaSesion" value="Iniciar Sesión">
							
							
						</div>
						<hr>
					<div class="mb-3">
							<h5 class="h5">¿No recuerdas tu contraseña de usuario?</h4>
							<a href="vistaRegistro.jsp" button class="btn btn-primary btn-custom">Registrarse</a>
							<a href="vistaPrincipal.jsp" button class="btn btn-secondary btn-custom">Cerrar</a>
					</div>
						
						
					</form>
        	</div>
        </div>
  </div>
    </div>
			
	
</body>
</html>