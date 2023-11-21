<?php
class Ventas extends Conectar{
        public function get_ventas($codProd,$fechaVenta){
            $conectar=parent::conexion();
            parent::set_names();
            $sql="SELECT nomProd,fechaVenta,cantidadVenta FROM ventas INNER JOIN productos ON ventas.codProd = productos.codProd WHERE productos.codProd = ? AND fechaVenta = ?";
            $stmt=$conectar->prepare($sql);
            $stmt->execute([$codProd,$fechaVenta]);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }

        public function insert_ventas($codProd,$cantidadVenta){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="INSERT INTO ventas(codProd,cantidadVenta) VALUES (?, ?)";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $codProd);
            $sql->bindValue(2, $cantidadVenta);
            $sql->execute();
        }

        public function actualizarCantidadProd($codProd, $cantidadVenta){
        $cantidad = $cantidadVenta;
        $conectar = parent::conexion();
        $sql = "UPDATE productos SET cantidad = cantidad - $cantidad WHERE codProd = ?";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $codProd);
        $sql->execute();
    }
}
?>