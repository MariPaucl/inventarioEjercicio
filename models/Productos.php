<?php
class Productos extends Conectar{
    public function get_productos(){
        $conectar=parent::conexion();
        parent::set_names();
        $sql="SELECT * FROM productos WHERE cantidad > 0";
        $sql=$conectar->prepare($sql);
        $sql->execute();
        return $resultado=$sql->fetchAll(PDO::FETCH_ASSOC);
    }
    public function insert_producto($nomProd,$precio,$cantidad){
        $conectar= parent::conexion();
        parent::set_names();

        $conectar->beginTransaction();
        try{
        $sqlProductos="INSERT INTO productos(nomProd,precio,cantidad) VALUES (?, ?, ?)";
        $stmtProductos=$conectar->prepare($sqlProductos);
        $stmtProductos->bindValue(1, $nomProd);
        $stmtProductos->bindValue(2, $precio);
        $stmtProductos->bindValue(3, $cantidad);
        $stmtProductos->execute();

        $codProd = $conectar->lastInsertId();
        $sqlIngresos = "INSERT INTO ingresos(codProd,cantidadIngreso) VALUES ($codProd,$cantidad)";
        $stmtIngresos = $conectar->prepare($sqlIngresos);
        $stmtIngresos->execute();

        $conectar->commit();
    }catch (Exception $e) {
        $conectar->rollBack();
        echo "Error al insertar el producto: " . $e->getMessage();
    }
}
}
?>