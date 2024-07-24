<?php 

require_once("conexion.php");

class modeloClientes{

    /* ------------------------------------------
     * Retorna todos los clientes de nuestra base de datos
     * ------------------------------------------
     * 
     */
    static public function index($tabla) {
        $stmt = Conexion::conectar()->prepare("select * from $tabla");
        $stmt->execute();
        return $stmt->fetchAll();
        $stmt->close();
        $stmt = null;
    }

    static public function create($tabla, $data) {
        $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla (nombre, apellido, email, id_cliente, llave_secreta, created_at, updated_at) 
            VALUES (:nombre, :apellido, :email, :id_cliente, :llave_secreta, :created_at, :updated_at)");

       	$stmt -> bindParam(":nombre", $data["nombre"], PDO::PARAM_STR);
		$stmt -> bindParam(":apellido", $data["apellido"], PDO::PARAM_STR);
		$stmt -> bindParam(":email", $data["email"], PDO::PARAM_STR);
		$stmt -> bindParam(":id_cliente", $data["id_cliente"], PDO::PARAM_STR);
		$stmt -> bindParam(":llave_secreta", $data["llave_secreta"], PDO::PARAM_STR);
		$stmt -> bindParam(":created_at", $data["created_at"], PDO::PARAM_STR);
		$stmt -> bindParam(":updated_at", $data["updated_at"], PDO::PARAM_STR);

        if($stmt->execute()) {
            return "ok";
        } else {
			print_r(Conexion::conectar()->errorInfo());
		}
        $stmt->close();
		$stmt = null;
    }

}

?>