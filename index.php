<?php 

require_once("controller/clientes.controller.php");
require_once("controller/cursos.controller.php");
require_once("controller/rutas.controller.php");
require_once("models/clientes.models.php");
require_once("models/cursos.models.php");

$rutas = new controladorRutas();
$rutas->inicio();

?>