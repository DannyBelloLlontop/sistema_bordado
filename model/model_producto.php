<?php
    require_once  'model_conexion.php';

    class Modelo_Producto extends conexionBD{

        public function Registrar_Producto($producto){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_REGISTRAR_PRODUCTO(?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query -> bindParam(1,$producto);
            $query->execute();
            if($row = $query->fetchColumn()){
                    return $row;
            }
            conexionBD::cerrar_conexion();
        }

        public function Listar_Producto(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_PRODUCTO()";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll(PDO::FETCH_ASSOC);
            foreach($resultado as $resp){
                $arreglo["data"][]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }

        public function Modificar_Producto($id,$producto,$estado){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_MODIFICAR_PRODUCTO(?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query -> bindParam(1,$id);
            $query -> bindParam(2,$producto);
            $query -> bindParam(3,$estado);
            $query->execute();
            if($row = $query->fetchColumn()){
                    return $row;
            }
            conexionBD::cerrar_conexion();
        }

        public function Cargara_Select_Producto(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_CARGAR_SELECT_PRODUCTO()";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll();
            foreach($resultado as $resp){
                $arreglo[]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
    }
?>