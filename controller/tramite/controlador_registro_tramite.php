<?php
      require '../../model/model_tramite.php';
      $MU = new Modelo_Tramite();//Instaciamos
    //DATOS DEL REMIENTE
    $id = strtoupper(htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8'));
    $total = strtoupper(htmlspecialchars($_POST['total'],ENT_QUOTES,'UTF-8'));
    $idusu = strtoupper(htmlspecialchars($_POST['idusu'],ENT_QUOTES,'UTF-8'));
    $arp = strtoupper(htmlspecialchars($_POST['arp'],ENT_QUOTES,'UTF-8'));
    $ard = strtoupper(htmlspecialchars($_POST['ard'],ENT_QUOTES,'UTF-8'));
    $asu = strtoupper(htmlspecialchars($_POST['asu'],ENT_QUOTES,'UTF-8'));
    $nombrearchivo = strtoupper(htmlspecialchars($_POST['nombrearchivo'],ENT_QUOTES,'UTF-8'));
    $producto = strtoupper(htmlspecialchars($_POST['producto'],ENT_QUOTES,'UTF-8'));
    $canti = strtoupper(htmlspecialchars($_POST['canti'],ENT_QUOTES,'UTF-8'));
    $preci = strtoupper(htmlspecialchars($_POST['preci'],ENT_QUOTES,'UTF-8'));
    $subto = strtoupper(htmlspecialchars($_POST['subto'],ENT_QUOTES,'UTF-8'));
    $ruta='controller/tramite/documentos/'.$nombrearchivo;
    $consulta = $MU->Registrar_Tramite($id,$total,$idusu,$arp,$ard,$asu,$ruta,$producto,$canti,$preci,$subto);
    //D00000001
    if($consulta){
        if($nombrearchivo !=""){
            move_uploaded_file($_FILES['archivoobj']['tmp_name'],"documentos/".$nombrearchivo);
        }
        echo $consulta;
    }
    

?>