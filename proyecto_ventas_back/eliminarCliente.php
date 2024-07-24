<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

$json = file_get_contents('php://input'); //resive el json de angular

$params = json_decode($json); //Decodifica el json

require("conexion.php"); 

$conexion = conexion();

mysqli_query($conexion,"DELETE FROM pacientes WHERE Cedula=".$_GET['Cedula']);

class Result {}

//generar los datos de respuesta
$response = new Result();
$response->resultado = 'OK';
$response->mensaje = 'Cliente Eliminado';

//Envio de informacion de json
header('Content-Type: application/json');
echo json_encode($response);//muestra el json generado

?>