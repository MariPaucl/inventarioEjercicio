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
    public function insert_producto($nomProd,$categoria,$precio,$fechaingreso,$cantidad){
        $conectar= parent::conexion();
        parent::set_names();
        $sql="INSERT INTO productos(nomProd,categoria,precio,fechaingreso,cantidad) VALUES (?, ?, ?, ?, ?)";
        $sql=$conectar->prepare($sql);
        $sql->bindValue(1, $nomProd);
        $sql->bindValue(2, $categoria);
        $sql->bindValue(3, $precio);
        $sql->bindValue(4, $fechaingreso);
        $sql->bindValue(5, $cantidad);
        $sql->execute();
    }

    public function deleteProducto($codProd){
        $conectar = parent::conexion();
        $conectar->exec('SET foreign_key_checks = 0');
        $sql = "SELECT cantidad FROM productos WHERE codProd = ?";
        $stmt = $conectar->prepare($sql);
        $stmt->bindValue(1, $codProd);
        $stmt->execute();
        $cantidad = $stmt->fetchColumn();

        if ($cantidad == 0) {
            $sqlEliminar = "DELETE FROM productos WHERE codProd = ?";
            $stmtEliminar = $conectar->prepare($sqlEliminar);
            $stmtEliminar->bindValue(1, $codProd);
            $stmtEliminar->execute();
            $conectar->exec('SET foreign_key_checks = 1');
            return true;
        }else{
            return false;
        }
    }
}
?>