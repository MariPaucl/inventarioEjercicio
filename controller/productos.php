<?php
header('Content-Type: application/json');

require_once("../config/conexion.php");
require_once("../models/Productos.php");
$productos = new Productos();

$body = json_decode(file_get_contents("php://input"), true);

switch($_GET["op"]){
    case "GetAll";
        $datos = $productos->get_productos();
        echo json_encode($datos);
    break;

    case "Insert";
        $datos = $productos->insert_producto($body["nomProd"],$body["categoria"],$body["precio"],$body["fechaIngreso"],$body["cantidad"]);
        echo "Se inserto el producto correctamente";
    break;

    case "DeleteProducto";
        $resultado = $productos->deleteProducto($body["codProd"]);
        if($resultado){
        echo "El producto se ha eliminado correctamente";
        }else{
            echo "Este producto no se puede eliminar ya que sigue disponible";
        }
        break;
}
?>