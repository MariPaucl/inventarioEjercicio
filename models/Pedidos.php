<?php
class Pedidos extends Conectar{
        public function get_pedidos(){
            $conectar=parent::conexion();
            parent::set_names();
            $sql="SELECT * FROM pedidos INNER JOIN productos ON pedidos.codProd = productos.codProd";
            $sql=$conectar->prepare($sql);
            $sql->execute();
            return $resultado=$sql->fetchAll(PDO::FETCH_ASSOC);
        }

        public function insert_pedidos($codProd,$fechaPedido,$horaPedido,$total,$direccion){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="INSERT INTO pedidos(codProd,fechaPedido,horaPedido,total,direccion) VALUES (?, ?, ?, ?, ?)";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $codProd);
            $sql->bindValue(2, $fechaPedido);
            $sql->bindValue(3, $horaPedido);
            $sql->bindValue(4, $total);
            $sql->bindValue(5, $direccion);
            $sql->execute();
        }

        public function actualizarCantidadProd($codProd){
        $conectar = parent::conexion();
        $sql = "UPDATE productos SET cantidad = cantidad - 1 WHERE codProd = ?";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $codProd);
        $sql->execute();
    }
}
?>