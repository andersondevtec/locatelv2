<?php

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json; charset=UTF-8');
header('Access-Control-Allow-Methods: GET,POST,PUT,PATCH,DELETE');
header("Access-Control-Max-Age: 86000");
header('Access-Control-Allow-Headers: Content-Type,Access-Control-Allow-Headers,Authorization,X-Requested-With');
header('Access-Control-Allow-Credentials: true'); 
header("Access-Control-Allow-Headers: Content-Type"); 


if($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    header('HTTP/1.1 200 OK');
    exit();
  }
  
function conexion(){
    $conexion = @mysqli_connect("localhost", "admin", "master", "sis_ventas");

    // Verificar si hubo un error al conectar
    if (!$conexion) {
        die("Error de conexión: " . mysqli_connect_error());
    }

    return $conexion;
}

$con = conexion();


?>
