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
    $Codigo = $_POST["Codigo"];
    $Nombre = $_POST["Nombre"];
    $ValorVenta = $_POST["ValorVenta"];
    $ManejaIva = $_POST["ManejaIva"];
    $PorcentajeIva = $_POST["PorcentajeIva"]; 
    $Imagen = $_POST["Imagen"];

    $sql = "INSERT INTO Clientes(Codigo, Nombre, ValorVenta, ManejaIva, PorcentajeIva) VALUES ('$Codigo', '$Nombre', '$ValorVenta', '$ManejaIva', '$PorcentajeIva', $Imagen)";
    if(mysqli_query($con, $sql)) {
        $cliente_id = mysqli_insert_id($con); 
        $datos = [
            'Codigo' => $Cedula,
            'Nombre' => $Nombre,
            'ValorVenta' => $ValorVenta,
            'ManejaIva' => $ManejaIva,
            'PorcentajeIva' => $PorcentajeIva,
            'Imagen'=> $Imagen
        ];  
        echo json_encode(array("status" => "success", "code" => 1, "document" => $datos));
    } else {
        echo json_encode(array("status" => "error", "code" => 0));
    }
}



?>