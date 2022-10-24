<?php

  if (!isset($_SESSION["userType"])) {
      header("location: index.php");
      exit();
      }
	?>	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	<nav class="navbar navbar-expand-lg" style="font-family: 'Bona Nova';">
	  <button class="navbar-toggler bg-info" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <?php ?>
	  
	    <ul class="navbar-nav mx-auto mt-2 mt-lg-0">

		    <!-- ADMINISTRADOR -->
		    <?php if ($_SESSION["userType"] == 'Administrador') { ?>
		    <li class="nav-item">
	        	<?php echo'<a class="nav-link" href="users.php?">Inicio</a>'; ?>
	      	</li>    	
	      	<li class="nav-item dropdown">
		        <?php echo'<a class="nav-link" href="documentos.php?">
		          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Documentos
		        </a>';?>
		    </li>
	      	<li class="nav-item">
	    		 <?php echo'<a class="nav-link" href="noticias.php?"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Noticias</a>';?>
	  		</li>
	  	
	      	<?php } ?>
		    <!-- FIN ADMINISTRADOR -->


		     <!-- OTROS -->
		    <?php if ($_SESSION["userType"] == "Visitantes") { ?>
		    <li class="nav-item">
	        	<?php echo'<a class="nav-link" href="users.php?">Inicio</a>'; ?>
	      	</li>    	
	      	<li class="nav-item dropdown">
		        <?php echo'<a class="nav-link" href="misdocumentos.php?">
		          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mis documentos
		        </a>';?>
		    </li>
	      	<li class="nav-item">
	    		 <?php echo'<a class="nav-link" href="noticias.php?"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Noticias</a>';?>
	  		</li>
	  	
	      	<?php } ?>
		    <!-- FIN OTROS -->

		   <div class="nav-item dropdown" align="right">
	        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-expanded="false">
	        <img src="" width="30">
	        </a>
	        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
	        	<a class="dropdown-item" href="salir.php">Cerrar sesión</a>
		    </div>
		</div>
	  </div>
		</ul>
	</nav>
</body>
</html>