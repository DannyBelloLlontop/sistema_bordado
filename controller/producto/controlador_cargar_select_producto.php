<?php
    require '../../model/model_producto.php';
    $MU = new Modelo_Producto();//Instaciamos
    $consulta = $MU->Cargara_Select_Producto();
    echo json_encode($consulta);

?>