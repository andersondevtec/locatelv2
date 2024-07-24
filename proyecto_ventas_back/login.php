<?php 

require("conexion.php"); 

$conexion = conexion();

$json = file_get_contents('php://input'); 

$params = json_decode($json); // DECODIFICA EL JSON Y LO GUARADA EN LA VARIABLE

$query = mysqli_query($conexion, "SELECT * FROM users where email='$params->email' and password='$params->password'");

// SI EL USUARIO EXISTE OBTIENE LOS DATOS Y LOS GUARDA EN UN ARRAY
if ($resultado = mysqli_fetch_array($query))  
{
  $datos[] = $resultado;
}

$json = json_encode($datos); // GENERA EL JSON CON LOS DATOS OBTENIDOS

echo $json; 

