<?php
require("conexion.php"); 


error_reporting(E_ALL);
ini_set('display_errors', 1); //reprtes de error de conexion



//cabeceras
header("Access-Control-Allow-Origin: *"); 
header('Access-Control-Allow-Credentials: true'); 
header("Access-Control-Allow-Methods: GET, POST, OPTIONS"); 
header("Access-Control-Allow-Headers: Content-Type"); 



if($_SERVER['REQUEST_METHOD']=="POST") {
    $Cedula = $_POST["Cedula"];
    $Nombre = $_POST["Nombre"];
    $Direccion = $_POST["Direccion"];
    $Telefono = $_POST["Telefono"];
    $Email = $_POST["Email"]; 

    $sql = "INSERT INTO Clientes(Cedula, Nombre, Direccion, Telefono, Email) VALUES ('$Cedula', '$Nombre', '$Direccion', '$Telefono', '$Email')";
    if(mysqli_query($con, $sql)) {
        $cliente_id = mysqli_insert_id($con); 
        $datos = [
            'Cedula' => $Cedula,
            'Nombre' => $Nombre,
            'Direccion' => $Direccion,
            'Telefono' => $Telefono,
            'Email' => $Email
            
        ];  
        echo json_encode(array("status" => "success", "code" => 1, "document" => $datos));
    } else {
        echo json_encode(array("status" => "error", "code" => 0));
    }
}



?>