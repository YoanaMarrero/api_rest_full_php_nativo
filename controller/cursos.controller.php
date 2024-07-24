<?php 

class controladorCursos {

    private function validarCliente () {
        /* ---------------------------------------------------
         * Validación de las credenciales del cliente
         * ---------------------------------------------------
        */ 
        $listadoClientes = modeloClientes::index("clientes");

        // Recoge de la api las credenciales del usuario identificado.
        $user = isset($_SERVER['PHP_AUTH_USER']) ? $_SERVER['PHP_AUTH_USER'] : '';
        $pass = isset($_SERVER['PHP_AUTH_PW']) ? $_SERVER['PHP_AUTH_PW'] : '';

        if ($user != '' && $pass != '') {
            // Recorre el listado de usarios registrados para verificar si existe alguno con la mismas
            // credenciales (:/ esto se podría cambiar para consultar solo uno....
            foreach ($listadoClientes as $key => $cliente) {
                if ($user.':'.$pass == $cliente['id_cliente'] .':' .$cliente['llave_secreta']) 
                    return true;
            }
        }
        return false;
    }

    public function create($data) {

        // Primero validamos las credenciales del cliente
        if (controladorCursos::validarCliente()) {

            /* ---------------------------------------------------
             * Validación de los datos pasados como parámetros
             * ---------------------------------------------------
             */ 
            foreach ($data as $key => $valueDatos) {
                // Permitimos solo un determinado listado de caracteres
                if(isset($valueDatos) && !preg_match('/^[(\\)\\=\\&\\$\\;\\-\\_\\*\\"\\<\\>\\?\\¿\\!\\¡\\:\\,\\.\\0-9a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/', $valueDatos)){
                    $json = array(
                        "status"=>404,
                        "detalle"=>"Error en el campo ".$key
                    );

                    echo json_encode($json, true);
                    return;
                }
            }

            /* ---------------------------------------------------
             * Validación de no duplicidad en el título o la descripción
             * ---------------------------------------------------
             */ 
            $cursos = modeloCursos::index("cursos", "clientes");
            foreach ($cursos as $key => $value) {
                if($value["titulo"] == $data["titulo"]){
					$json = array(
						"status"=>404,
						"detalle"=>"El título ya existe en la base de datos"
					);

					echo json_encode($json, true);	
					return;
				}

                if($value["descripcion"] == $data["descripcion"]){
					$json = array(
    					"status"=>404,
						"detalle"=>"La descripción ya existe en la base de datos"
					);
                    
                    echo json_encode($json, true);	
					return;
				}
            }

            /* ---------------------------------------------------
             * Grabación del curso en la BBDD
             * ---------------------------------------------------
             */ 
            $data["id_creador"] = $_SERVER['PHP_AUTH_USER'];
            $data["created_at"] = date('Y-m-d h:i:s');
            $data["updated_at"] = date('Y-m-d h:i:s');

            $create = modeloCursos::create("cursos", $data);
            if($create == "ok"){
                $json = array(
                    "status"=>200,
                    "detalle"=>"Registro exitoso, su curso ha sido guardado"
                ); 
                echo json_encode($json, true);
                return;
            }
        }
    }

    public function index($pagina) {

        // Primero validamos las credenciales del cliente
        if (controladorCursos::validarCliente()) {
            $cursos = modeloCursos::index("cursos", "clientes", $pagina);
            $data =  array(
                "detalle"=>$cursos
            ); 
            echo  json_encode($data, true);
        }
        return;
    }

    public function show($curso_id) {        
        // Primero validamos las credenciales del cliente
        if (controladorCursos::validarCliente()) {
            $dataCurso = modeloCursos::show("cursos", "clientes", $curso_id);
            if (!empty($dataCurso)) {
                $data =  array(
                    "status" => 200,
                    "detalle"=> $dataCurso
                );
            } else {
                $data =  array(
                    "status" => 200,
                    "total_registros" => 0,
                    "detalle"=> "Identificador de curso inexistente."
                );
            }
            echo  json_encode($data, true);
            return;
        }
    }

    public function update($curso_id, $data) {        
        // Primero validamos las credenciales del cliente
        if (controladorCursos::validarCliente()) {
            $id_cliente = $_SERVER['PHP_AUTH_USER'];
            
            // Antes de continuar validamos los datos introducidos por el usuario
            foreach ($data as $key => $valueDatos) {
                if(isset($valueDatos) && 
                    !preg_match('/^[(\\)\\=\\&\\$\\;\\-\\_\\*\\"\\<\\>\\?\\¿\\!\\¡\\:\\,\\.\\0-9a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/', $valueDatos)) {
                    $json = array(
                        "status"=>404,
                        "detalle"=>"Error en el campo ".$key
                    );
                    echo json_encode($json, true);
                    return;
                }
            }
            //.-   
                        
            // Validamos que el usuario que intenta actualizar el curso sea el creaador del mismo
            $curso = modeloCursos::show("cursos","clientes", $curso_id);
            foreach ($curso as $key => $valueCurso) {
                if ($valueCurso['id_creador'] == $id_cliente) {
                    // Procedemos con la actualización del curso
                    $datos = array( 
                        "id"=>$curso_id,
                        "titulo"=>$data["titulo"],
                        "descripcion"=>$data["descripcion"],
                        "instructor"=>$data["instructor"],
                        "imagen"=>$data["imagen"],
                        "precio"=>$data["precio"],
                        "updated_at"=>date('Y-m-d h:i:s')
                    );

                    $update = modeloCursos::update("cursos", $datos);
                    if($update == "ok") {
                        $json = array(
                            "status"=>200,
                            "detalle"=>"Registro exitoso, su curso ha sido actualizado"
                        ); 
                        echo json_encode($json, true); 
                        return;  
                    }
                } else {
                    $json = array(
                        "status"=>404,
                        "detalle"=>"No está autorizado para modificar este curso"
                    );
                    echo json_encode($json, true);
                    return;
                }
            }
            //.-
        }
    }

    public function delete($curso_id) {        
        // Primero validamos las credenciales del cliente
        if (controladorCursos::validarCliente()) {
            $id_cliente = $_SERVER['PHP_AUTH_USER'];
            
            // Validamos que el usuario que intenta actualizar el curso sea el creaador del mismo
            $curso = modeloCursos::show("cursos","clientes", $curso_id);
            foreach ($curso as $key => $valueCurso) {
                if ($valueCurso['id_creador'] == $id_cliente) {
                    // Procedemos con el borrado del curso
                    $delete = modeloCursos::delete("cursos", $curso_id);
                    if($delete == "ok") {
                        $json = array(
                            "status"=>200,
                            "detalle"=>"Su curso ha sido eliminado satisfactoriamente."
                        ); 
                        echo json_encode($json, true); 
                        return;  
                    }
                } else {
                    $json = array(
                        "status"=>404,
                        "detalle"=>"No está autorizado para eliminar este curso"
                    );
                    echo json_encode($json, true);
                    return;
                }
            }
        }
    }
    
}

?>