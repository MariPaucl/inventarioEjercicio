<?php
header('Content-Type: application/json');

require_once("../config/conexion.php");
require_once("../models/Ingresos.php");
$ingresos = new Ingresos();

$body = json_decode(file_get_contents("php://input"), true);

switch($_GET["op"]){
    case "GetAll";
        $datos = $ingresos->get_ingresos($body["codProd"],$body["fechaIngreso"]);
        echo json_encode($datos);
    break;

    case "Insert";
        $datos = $ingresos->insert_ingresos($body["codProd"],$body["cantidadIngreso"]);
        $ingresos->actualizarCantidadProd($body["codProd"],$body["cantidadIngreso"]);
        echo "El ingreso se registro correctamente";
    break;
}
?>