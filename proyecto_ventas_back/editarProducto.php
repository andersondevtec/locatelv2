<?php
header('Access-Control-Allow-Origin: *'); 
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

$json = file_get_contents('php://input'); // Recibe el json de angular

$params = json_decode($json); // Decodifica el json

require("conexion.php"); 
$conexion = conexion();

mysqli_query($conexion, "UPDATE Productos 
SET Codigo='$params->Codigo',  
Nombre='$params->Nombre',
ValorVenta='$params->ValorVenta',
ManejaIVA='$params->ManejaIVA',
PorcentajeIVA='$params->PorcentajeIVA'
WHERE Codigo=$params->Codigo");

class Result {}

//Generar los datos de respuesta
$response = new Result();
$response->resultado = 'OK';
$response->mensaje = 'Producto editado';

//Envio de informacion del JSON
header('Content-Type: application/json');
echo json_encode($response); // Muestra el json generado
?>