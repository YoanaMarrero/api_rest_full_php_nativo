<?php 

    $request_method = (isset($_SERVER['REQUEST_METHOD'])) ? $_SERVER['REQUEST_METHOD'] :"";
    $arrayRutas = explode('/', $_SERVER['REQUEST_URI']);
    
    // Comprobamos si nuestra información debe aparecer paginada o no.
    $paginarInformacion = (isset($_GET['page']));
    $visualizarPagina = ($paginarInformacion) ? $_GET['page'] : 1;
    if (!is_numeric($visualizarPagina)) $visualizarPagina = 1;
    //.-

    //echo '<pre>'; print_r($arrayRutas); echo '</pre>';

    // array_filter elimina los vacíos del vector
    $arrayRutas = array_filter($arrayRutas);
    $nivelRuta = count($arrayRutas);

    /* 
     * Cuando no se hace ninguna petición a la API
     */
    $data =  array(
        "detalle"=>"no encontrado"
    );

    switch($nivelRuta) {
        case ($nivelRuta>= 2):
            /* 
             * Cuando pasamos un índice a la URL
             */
            switch ($arrayRutas[2]){
                case 'cursos':                     
                    /* 
                    * Cuando se hacen peticiones desde cursos
                    */
                    switch ($request_method) {
                    case 'POST':
                        $datos = array(
                            "titulo" => $_POST["titulo"],
                            "descripcion" => $_POST["descripcion"],
                            "instructor" => $_POST["instructor"],
                            "imagen" => $_POST["imagen"],
                            "precio" => $_POST["precio"]
                        );
                        $cursos = new controladorCursos();
                        $cursos->create($datos);                        
                        break;

                    case 'GET':
                        if (($nivelRuta == 3) && (is_numeric($arrayRutas[3]))){
                            // Si existe como siguiente parámetro un número de identificador
                            $curso_seleccionado = $arrayRutas[3];
                            $cursos = new controladorCursos();
                            $cursos->show($curso_seleccionado);  
                        } 
                        else {
                            
                            $cursos = new controladorCursos();
                            if ($paginarInformacion)
                                $cursos->index($visualizarPagina);
                            else
                                $cursos->index(null);
                        }
                        break;
                    
                    case 'PUT':       
                        if ($nivelRuta == 3) {    
                            // Si existe como siguiente parámetro un número de identificador
                            $curso_seleccionado = $arrayRutas[3];     
                            
                            $data = array();
                            parse_str(file_get_contents('php://input'), $data);
                                                       
                            $datos = array(
                                "titulo" => $data["titulo"],
                                "descripcion" => $data["descripcion"],
                                "instructor" => $data["instructor"],
                                "imagen" => $data["imagen"],
                                "precio" => $data["precio"]
                            ); 
                            $cursos = new controladorCursos();
                            $cursos->update($curso_seleccionado, $datos); 
                        }
                        else {
                            $cursos = new controladorCursos();
                            $cursos->index();
                        }
                        break;

                    case 'DELETE':       
                        if ($nivelRuta == 3) {    
                            // Si existe como siguiente parámetro un número de identificador
                            $curso_seleccionado = $arrayRutas[3];             
                            $cursos = new controladorCursos();
                            $cursos->delete($curso_seleccionado); 
                        }
                        else {
                            $cursos = new controladorCursos();
                            $cursos->index();
                        }
                        break;

                    default:                        
                        $data =  array(
                            "detalle"=>"estas en la vista de cursos"
                        );
                
                        echo json_encode($data, true);    
                        break;
                    }   
                    break;

                case 'registro':
                    /* 
                    * Cuando se hacen peticiones desde registro
                    */
                    switch ($request_method) {
                        case 'POST':                        
                            $datos = array(
                                "nombre" => $_POST["nombre"],
                                "apellido" => $_POST["apellido"],
                                "email" => $_POST["email"]
                            );
                            $clientes = new controladorClientes();
                            $clientes->create($datos);                        
                            break;
    
                        case 'GET':
                            $data =  array(
                                "detalle"=>"estas en la vista de clientes method GET"
                            );
                      
                            echo json_encode($data, true);    
                            break;
                        
                        default:                        
                            $data =  array(
                                "detalle"=>"estas en la vista de clientes"
                            );
                      
                            echo json_encode($data, true);    
                            break;
                        }        
                    break;
                
                default:
                    echo json_encode($data, true);
                    break;
            }
            break;

        default:
            echo json_encode($data, true);
            break;
    } 
?>