<?php
header('Content-Type: application/json');

require_once("../config/conexion.php");
require_once("../models/Ventas.php");
$ventas = new Ventas();

$body = json_decode(file_get_contents("php://input"), true);

switch($_GET["op"]){
    case "GetAll";
        $datos = $ventas->get_ventas($body["codProd"],$body["fechaVenta"]);
        echo json_encode($datos);
    break;

    case "Insert";
    $resultadoValidacion = $ventas->validarCantidadDisponible($body["codProd"], $body["cantidadVenta"]);
    if ($resultadoValidacion["valido"]) {
        $ventas->insert_ventas($body["codProd"], $body["cantidadVenta"]);
        $ventas->actualizarCantidadProd($body["codProd"], $body["cantidadVenta"]);
        echo "La venta se registró correctamente";
    } else {
        echo $resultadoValidacion["mensaje"];
    }
    break;
}
?>