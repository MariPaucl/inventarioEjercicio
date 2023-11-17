<?php
header('Content-Type: application/json');

require_once("../config/conexion.php");
require_once("../models/Pedidos.php");
$pedidos = new Pedidos();

$body = json_decode(file_get_contents("php://input"), true);

switch($_GET["op"]){
    case "GetAll";
        $datos = $pedidos->get_pedidos();
        echo json_encode($datos);
    break;

    case "Insert";
        $datos = $pedidos->insert_pedidos($body["codProd"],$body["fechaPedido"],$body["horaPedido"],$body["total"],$body["direccion"]);
        $pedidos->actualizarCantidadProd($body["codProd"]);
        echo "Pedido realizado con exito";
    break;
}
?>