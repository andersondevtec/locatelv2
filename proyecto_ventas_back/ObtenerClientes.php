<?php

// Permitir acceso desde cualquier origen
header("Access-Control-Allow-Origin: *");
// Permitir métodos GET, POST, etc.
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
// Permitir encabezados específicos
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

require("conexion.php"); // Importa el archivo de conexión a la base de datos

$sql = "SELECT * FROM Clientes ORDER BY ID DESC";

if ($query = mysqli_query($con, $sql)) { 
  $datos = [];
  while ($resultado = mysqli_fetch_assoc($query)) {
    $datos[] = $resultado;        
  }  

  echo json_encode(array("status" => "success", "code" => 1, "document" => $datos));

} else {
  // Si hay un error en la consulta
  $error_msg = mysqli_error($con); // Obtener el mensaje de error de MySQL

  echo json_encode(array("status" => "error", "code" => 0, "message" => $error_msg));
}

?>
