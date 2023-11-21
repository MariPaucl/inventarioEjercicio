<?php
class Ingresos extends Conectar{
        public function get_ingresos($codProd,$fechaIngreso){
            $conectar=parent::conexion();
            parent::set_names();
            $sql="SELECT nomProd,fechaIngreso,cantidadIngreso FROM ingresos INNER JOIN productos ON ingresos.codProd = productos.codProd WHERE productos.codProd = ? AND fechaIngreso = ?";
            $stmt=$conectar->prepare($sql);
            $stmt->execute([$codProd,$fechaIngreso]);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }

        public function insert_ingresos($codProd,$cantidadIngreso){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="INSERT INTO ingresos(codProd,cantidadIngreso) VALUES (?, ?)";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $codProd);
            $sql->bindValue(2, $cantidadIngreso);
            $sql->execute();
        }

        public function actualizarCantidadProd($codProd, $cantidadIngreso){
        $cantidad = $cantidadIngreso;
        $conectar = parent::conexion();
        $sql = "UPDATE productos SET cantidad = cantidad + $cantidad WHERE codProd = ?";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $codProd);
        $sql->execute();
    }
}
?>