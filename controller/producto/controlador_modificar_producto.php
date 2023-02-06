<?php
    require '../../model/model_producto.php';
    $MU = new Modelo_Producto();//Instaciamos    
    $id = strtoupper(htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8'));  
    $producto = strtoupper(htmlspecialchars($_POST['producto'],ENT_QUOTES,'UTF-8'));    
    $estado = strtoupper(htmlspecialchars($_POST['estado'],ENT_QUOTES,'UTF-8'));   
    $consulta = $MU->Modificar_Producto($id,$producto,$estado);
    echo $consulta;
?>