<?php

class controladorClientes {

    public function create($data) {       
        $error = array();

        // ***************************
        // Validación del campo nombre
        // ***************************
        if (isset($data["nombre"]) && !preg_match('/^[a-zA-ZáéíóúÁÉÍÓÚñÑ ]+$/', $data['nombre'])) {            
            $error[] = array (
                "status"=>404,
                "detalle" => "error en el campo nombre, formato no permitido"
            );
        }

        // ***************************
        // Validación del campo apellido
        // ***************************
        if (isset($data["apellido"]) && !preg_match('/^[a-zA-ZáéíóúÁÉÍÓÚñÑ ]+$/', $data['apellido'])) {
            $error[] = array (
                "status"=>404,
                "detalle" => "error en el campo apellido, formato no permitido"
            );
        }

        // ***************************
        // Validación del campo email
        // ***************************
        if(isset($data["email"]) && 
            !preg_match('/^[^0-9][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/', $data["email"])){
            $error[] = array (
                "status"=>404,
                "detalle"=>"error en el campo email, formato no permitido"
            );
        }

        // ***************************
        // Validación de email único
        // ***************************
        $listadoClientes = modeloClientes::index("clientes");
        foreach ($listadoClientes as $key => $cliente) {
            if ($cliente["email"] == $data["email"]) {
                $error[] = array (
                    "status"=>404,
                    "detalle"=>"error en el registro, email registrado con anterioridad"
                );
            }
        }
      
        if (count($error) > 0) {
            echo  json_encode($error, true);
            return;
        }
        

        // ***************************
        // Generar credenciales de clientes
        // ***************************
        $id_cliente = crypt($data['nombre'].$data['apellido'].$data['email'], '$2a$07$afartwetsdAD52356FEDGsfhsd$');
        $data["id_cliente"] = str_replace("$","c", $id_cliente);
        
        $key_cliente = crypt($data['email'].$data['apellido'].$data['nombre'], '$2a$07$afartwetsdAD52356FEDGsfhsd$');
        $data["llave_secreta"] = str_replace("$","a", $key_cliente);

        $data["created_at"] = date('Y-m-d h:i:s');
        $data["updated_at"] = date('Y-m-d h:i:s');
       
        $create = modeloClientes::create("clientes", $data);
        if($create == "ok") {
            $json=array(
                "status" => 404,
                "detalle" => "se genero sus credenciales",
                "id_cliente" => $id_cliente,
                "llave_secreta" => $key_cliente
            );            
            echo json_encode($json,true);
            return;
        }
        return;

    }
}

?>