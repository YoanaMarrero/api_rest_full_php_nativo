<?php 

require_once("models/conexion.php");

class modeloCursos{

    static public function index($tabla1, $tabla2, $pagina = null, $tampagina = 10) {
        // Realizará la conexión a la base de datos. 
        $sql = "SELECT $tabla1.id ,$tabla1.titulo ,$tabla1.descripcion, 
            $tabla1.instructor,$tabla1.imagen,$tabla1.precio,$tabla1.id_creador ,
            $tabla2.nombre,$tabla2.apellido 
            FROM $tabla1 
            INNER JOIN $tabla2 ON $tabla1.id_creador = $tabla2.id_cliente";
        if (!is_null($pagina)) {
            $desde = ($pagina-1) * $tampagina;
            $sql .= " LIMIT $desde, $tampagina";
        }


        $stmt = Conexion::conectar()->prepare($sql);
        $stmt->execute();
        //return $stmt->fetchAll(PDO::FETCH_CLASS);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
        $stmt->close();
        $stmt = null;
    }

    static public function create($tabla, $data) {

        $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla (titulo, descripcion, instructor, imagen, precio, id_creador, created_at, updated_at) 
            VALUES (:titulo, :descripcion, :instructor, :imagen, :precio, :id_creador, :created_at, :updated_at)");

       	$stmt -> bindParam(":titulo", $data["titulo"], PDO::PARAM_STR);
		$stmt -> bindParam(":descripcion", $data["descripcion"], PDO::PARAM_STR);
		$stmt -> bindParam(":instructor", $data["instructor"], PDO::PARAM_STR);
		$stmt -> bindParam(":imagen", $data["imagen"], PDO::PARAM_STR);
		$stmt -> bindParam(":precio", $data["precio"], PDO::PARAM_STR);
		$stmt -> bindParam(":id_creador", $data["id_creador"], PDO::PARAM_STR);
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

    static public function show ($tabla1, $tabla2, $id) {

        $stmt = Conexion::conectar()->prepare("SELECT $tabla1.id ,$tabla1.titulo ,$tabla1.descripcion, 
            $tabla1.instructor,$tabla1.imagen,$tabla1.precio,$tabla1.id_creador ,
            $tabla2.nombre,$tabla2.apellido 
            FROM $tabla1 
            INNER JOIN $tabla2 ON $tabla1.id_creador = $tabla2.id_cliente
            WHERE $tabla1.id=:id");

       	$stmt -> bindParam(":id", $id, PDO::PARAM_INT);
        $stmt->execute();
        //return $stmt->fetchAll(PDO::FETCH_CLASS);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
        $stmt->close();
        $stmt = null;
    }

    static public function update($tabla, $data){

        $stmt=Conexion::conectar()->prepare("UPDATE cursos SET titulo=:titulo,descripcion=:descripcion,
            instructor=:instructor,imagen=:imagen,precio=:precio,updated_at=:updated_at WHERE id=:id");

        $stmt -> bindParam(":id", $data["id"], PDO::PARAM_INT);
        $stmt -> bindParam(":titulo", $data["titulo"], PDO::PARAM_STR);
		$stmt -> bindParam(":descripcion", $data["descripcion"], PDO::PARAM_STR);
		$stmt -> bindParam(":instructor", $data["instructor"], PDO::PARAM_STR);
		$stmt -> bindParam(":imagen", $data["imagen"], PDO::PARAM_STR);
		$stmt -> bindParam(":precio", $data["precio"], PDO::PARAM_STR);
		$stmt -> bindParam(":updated_at", $data["updated_at"], PDO::PARAM_STR);

        if($stmt -> execute()){
			return "ok";
		}else{
			print_r(Conexion::conectar()->errorInfo());
		}
		$stmt-> close();
		$stmt = null;
    }

    static public function delete($tabla, $id) {

        $stmt=Conexion::conectar()->prepare("DELETE  FROM $tabla WHERE id=:id");

        $stmt -> bindParam(":id", $id, PDO::PARAM_INT);
        if($stmt->execute()){
            return "ok";
        } else {
           print_r(Conexion::conectar()->errorInfo());
        }     
        $stmt-> close();
        $stmt = null;
    }

}

?>