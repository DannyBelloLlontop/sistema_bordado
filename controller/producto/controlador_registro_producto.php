<?php
    require '../../model/model_producto.php';
    $MU = new Modelo_Producto();//Instaciamos
    $producto = strtoupper(htmlspecialchars($_POST['producto'],ENT_QUOTES,'UTF-8'));
    $consulta = $MU->Registrar_Producto($producto);
        echo json_encode($consulta);
?>