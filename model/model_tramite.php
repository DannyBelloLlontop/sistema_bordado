<?php
    require_once  'model_conexion.php';

    class Modelo_Tramite extends conexionBD{


        public function Registrar_Tramite($id,$total,$idusu,$arp,$ard,$asu,$ruta,$producto,$canti,$preci,$subto){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_REGISTRAR_TRAMITE(?,?,?,?,?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query -> bindParam(1,$id);
            $query -> bindParam(2,$total);
            $query -> bindParam(3,$idusu);
            $query -> bindParam(4,$arp);
            $query -> bindParam(5,$ard);
            $query -> bindParam(6,$asu);
            $query -> bindParam(7,$ruta);            
            $query->execute();
            if($row = $query->fetchColumn()){
                if ($row!='') {
                    $array_producto      = explode(",",$producto);
                    $array_canti      = explode(",",$canti);
                    $array_preci      = explode(",",$preci);
                    $array_subto      = explode(",",$subto);
                    $noregistradas=0;
                    for ($i=0; $i < count($array_producto); $i++) {
                        //die();
                        $c2 = conexionBD::conexionPDO();
                        $sql2 = "CALL SP_REGISTRAR_DOCUMENTO_DETALLE(?,?,?,?,?)";
                        $query2   = $c2->prepare($sql2);
                        $query2->bindParam(1,$row);
                        $query2->bindParam(2,$array_producto[$i]);
                        $query2->bindParam(3,$array_canti[$i]);
                        $query2->bindParam(4,$array_preci[$i]);
                        $query2->bindParam(5,$array_subto[$i]);
                        $resultado2 = $query2->execute();
                        if($resultado2){
                            $noregistradas++;
                        }
                       
                    }
                    if ($noregistradas>0) {
                        return $row;
                    }else{
                        return 0;
                    }
                }
            }
            conexionBD::cerrar_conexion();
        }

        public function Modificar_Usuario($id,$ide,$ida,$rol){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_MODIFICAR_USUARIO(?,?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query -> bindParam(1,$id);
            $query -> bindParam(2,$ide);
            $query -> bindParam(3,$ida);
            $query -> bindParam(4,$rol);
            $resul = $query->execute();
            if($resul){
                return 1;
            }else{
                return 0;
            }
            conexionBD::cerrar_conexion();
        }    
        



        public function Listar_Tramite(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_TRAMITE()";
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

        public function Listar_Tramite_Seguimiento($id){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_TRAMITE_SEGUIMIENTO(?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query -> bindParam(1,$id);
            $query->execute();
            $resultado = $query->fetchAll(PDO::FETCH_ASSOC);
            foreach($resultado as $resp){
                $arreglo["data"][]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }

        public function Cargara_Select_Tipo(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_CARGAR_SELECT_TIPO()";
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


        public function Traer_Datos_Ruc($ruc){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_TRAER_DATOS_RUC(?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query -> bindParam(1,$ruc);
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