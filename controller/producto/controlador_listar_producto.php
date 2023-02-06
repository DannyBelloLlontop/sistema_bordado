<?php
    require '../../model/model_producto.php';
    $MU = new Modelo_Producto();//Instaciamos
    $consulta = $MU->Listar_Producto();
    if($consulta){
        echo json_encode($consulta);
    }else{
        echo '{
		    "sEcho": 1,
		    "iTotalRecords": "0",
		    "iTotalDisplayRecords": "0",
		    "aaData": []
		}';
    }
?>