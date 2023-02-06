<?php
require_once __DIR__ . '/../vendor/autoload.php';
require_once '../conexion.php';
$mpdf = new \Mpdf\Mpdf();
$query = "SELECT
documento.documento_id, 
cliente.cli_nro_ruc, 
cliente.cli_razon_social, 
cliente.cli_direccion, 
cliente.cli_celular, 
cliente.cli_email, 
documento.documento_total, 
documento.doc_fecharegistro
FROM
documento
INNER JOIN
cliente
ON 
    documento.cliente_id = cliente.cliente_id
    where documento.documento_id='".$_GET['codigo']."'";
$resultado = $mysqli -> query($query);
while($row1 = $resultado->fetch_assoc()){
  $html = '<!DOCTYPE html>
  <html lang="en">
    <head>
      <meta charset="utf-8">
      <title>Reporte Venta</title>
      <link rel="stylesheet" href="style.css" media="all" />
      <style>
        @page {
            size: auto;
            odd-footer-name: html_myFooter1;
        }
      </style>
    </head>
    <body>
      <header class="clearfix">
        <table style="border-collapse;" border="1">
          <thead>
            <tr>
              <th width="20%" style="border-top:0px;border-left:0px;border-bottom:0px;border-right:0px"><img src="img/logo.png" width="100px"></th>
              <th width="50%" style="border-top:0px;border-left:0px;border-bottom:0px;border-right:0px;text-align:left">
                <b>SOFTNET SOLUTIONS PE</b><br>
                <b style="color:black;font-size:12px">Domicilio</b>: <span  style="color:black;font-size:12px">Per&uacute; - Chimbote</span><br>
                <b style="color:black;font-size:12px">Tel&eacute;fono</b>: <span  style="color:black;font-size:12px"> +51 928 255 930</span><br>
                <b style="color:black;font-size:12px">Correo</b>: <span  style="color:black;font-size:12px"> softnet.solutions.pe@gmail.com</span><br>
              </th>
              <th width="30%" style="text-align:center">
                <h3 style="color:black">DOCUMENTO: '.$row1['documento_id'].'</h3>
              </th>
            </tr>
          </thead>
        </table>
        <div id="project">
          <div><span style="color:black;font-size:13px"><b>RUC:</b> '.$row1['cli_nro_ruc'].'</span></div>
          <div><span style="color:black;font-size:13px"><b>CLIENTE:</b> '.utf8_encode($row1['cli_razon_social']).'</span></div>
          <div><span style="color:black;font-size:13px"><b>NÚMERO CONTACTO:</b> '.$row1['cli_celular'].'</span></div>
          <div><span style="color:black;font-size:13px"><b>FECHA:</b> '.$row1['doc_fecharegistro'].'</span></div>
        </div>
      </header>
      <main>
        <table>
          <thead>
            <tr>
              <th class="service">ITEM</th>
              <th class="desc">DESCRIPCIÓN</th>
              <th style="text-align:center">PRECIO</th>
              <th style="text-align:center">CANTIDAD</th>
              <th>SUB TOTAL</th>
            </tr>
          </thead>
          <tbody>';
          $query2 = "SELECT
          detalle_documento.detadocu_id, 
          detalle_documento.documento_id, 
          detalle_documento.producto_id, 
          detalle_documento.detadocu_cantidad, 
          detalle_documento.detadocu_precio, 
          detalle_documento.detadocu_subtotal, 
          producto.producto_nombre
      FROM
          detalle_documento
          INNER JOIN
          producto
          ON 
              detalle_documento.producto_id = producto.producto_id
              WHERE 	detalle_documento.documento_id='".$row1['documento_id']."'";
            $contador=0;
            $resultado2 = $mysqli -> query($query2);
            while($row2 = $resultado2->fetch_assoc()){
              $contador++;
            $html.='<tr>
                <td class="service">'.$contador.'</td>
                <td class="desc">'.utf8_encode($row2['producto_nombre']).'</td>
                <td class="unit">S/.'.$row2['detadocu_precio'].'</td>
                <td class="qty">'.$row2['detadocu_cantidad'].'</td>
                <td class="total">S/.'.round($row2['detadocu_subtotal'],2).'</td>
              </tr>';
            }
            
            $html.='<tr>
              <td colspan="4" class="TOTAL"><b>TOTAL</b></td>
              <td class="grand total">S/.'.$row1['documento_total'].'</td>
            </tr>
          </tbody>
        </table>
        <htmlpagefooter name="myFooter1" style="display:none">
        <table width="100%" style="text-align:center;">
            <tr>
                <td width="100%" style="text-align:right;background-color:white;">
                    <hr><br>
                    Page: {PAGENO}/{nbpg}
                </td>
            </tr>
        </table>
      </htmlpagefooter>
    </body>
  </html>';
}
$css = file_get_contents('css/style.css');
$mpdf->WriteHTML($css,1);
$mpdf->WriteHTML($html);
$mpdf->Output();
