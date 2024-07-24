<?php 

class Conexion {

    static public function conectar() {
        $cnx = new PDO("mysql:host=localhost;dbname=api_rest_full_php_nativo;", "root", "");
        $cnx->exec("set names utf8");
        return $cnx;
    }
    
}

?>