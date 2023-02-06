<?php
    require_once  'model_conexion.php';

    class Modelo_Cliente extends conexionBD{
    
        public function Listar_Cliente(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_CLIENTE()";
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

        public function Registrar_Cliente($ruc,$raz,$dire,$cel,$email){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_REGISTRAR_CLIENTE(?,?,?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$ruc);
            $query ->bindParam(2,$raz);
            $query ->bindParam(3,$dire);
            $query ->bindParam(4,$cel);
            $query ->bindParam(5,$email);
            $query->execute();
            if($row = $query ->fetchColumn()){
                return $row;

            }
            conexionBD::cerrar_conexion();
        }

        public function Modificar_Cliente($id,$ruc,$raz,$dire,$cel,$email,$esta){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_MODIFICAR_CLIENTE(?,?,?,?,?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$id);
            $query ->bindParam(2,$ruc);
            $query ->bindParam(3,$raz);
            $query ->bindParam(4,$dire);
            $query ->bindParam(5,$cel);
            $query ->bindParam(6,$email);
            $query ->bindParam(7,$esta);
            $query->execute();
            if($row = $query ->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }

    }

?>
