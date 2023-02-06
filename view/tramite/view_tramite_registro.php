<script src="../js/console_tramite.js?rev=<?php echo time();?>"></script>
<link rel="stylesheet" href="../plantilla/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">REGISITRO DE TRAMITE</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Tramite</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="col-12">
        <div class="row">
            <div class="col-md-6">
                    <div class="card card-danger">
                    <div class="card-header">
                        <h3 class="card-title"><b>Datos del Cliente</b></h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
                                <input type="hidden" id="idcliente" value="required">
                                <label for="">RUC</label>
                                <input type="text" class="form-control" id="txt_ruc">
                                <!-- <div class="input-group col-12">
                                    <input type="text" class="form-control" id="txt_dni">
                                    <div class="input-group-prepend">
                                        <button type="button" class="btn btn-success" onclick="Buscar_reniec()"><i class="fa fa-search"></i></button>
                                    </div>                  
                                </div> -->
                            </div>
       
                            <div class="col-12 form-group">
                                <label for="" style="font-size:small;">RAZON SOCIAL</label>
                                <input type="text" class="form-control" id="txt_razon" disabled required>
                            </div>
                            <div class="col-12 form-group">
                                <label for="" style="font-size:small;">DIRECCION</label>
                                <input type="text" class="form-control" id="txt_dire" disabled required>
                            </div>
                            <div class="col-12 form-group">
                                <label for="" style="font-size:small;">CELULAR</label>
                                <input type="text" class="form-control" id="txt_celular"disabled required>
                            </div>
                            <div class="col-12 form-group">
                                <label for="" style="font-size:small;">EMAIL</label>
                                <input type="text" class="form-control" id="txt_email"disabled required>
                            </div>
                            <!-- <div class="col-6 form-group">
                                <label for="" style="font-size:small;">EMAIL</label>
                                <input type="text" class="form-control" id="txt_email">
                            </div>
                            <div class="col-12">
                                <label for="" style="font-size:small;">DIRECCIÓN</label>
                                <input type="text" class="form-control" id="txt_dire">
                            </div>      -->
                            <!-- <div class="col-12">
                                <label for="" style="font-size:small;">EN REPRESENTACIÓN</label>
                            </div> -->
                            <!-- <div class="col-12 row">
                                    <div class="col-4 form-group clearfix">
                                        <div class="icheck-success d-inline">
                                            <input type="radio" id="rad_presentacion1" name="r1" checked value="A Nombre Propio">
                                            <label for="rad_presentacion1" style="font-weight:normal;font-size:small">
                                                A Nombre Propio
                                            </label>
                                        </div>
                                    </div>        
                                    <div class="col-4 form-group clearfix">
                                        <div class="icheck-success d-inline">
                                            <input type="radio" id="rad_presentacion2" name="r1" value="A Otra Persona Natural">
                                            <label for="rad_presentacion2" style="font-weight:normal;font-size:small">
                                                A Otra Persona Natural
                                            </label>
                                        </div>
                                    </div> 
                                    <div class="col-4 form-group clearfix">
                                        <div class="icheck-success d-inline">
                                            <input type="radio" id="rad_presentacion3" name="r1" value="Persona Jurídica">
                                            <label for="rad_presentacion3" style="font-weight:normal;font-size:small">
                                            Persona Jurídica
                                            </label>
                                        </div>
                                    </div>                                                            
                            </div>      -->
                            <!-- <div class="col-12" id="div_juridico" style="display:none">
                                <div class="row">
                                    <div class="col-4 form-group">
                                        <label for="" style="font-size:small;">RUC</label>
                                        <input type="text" class="form-control" id="txt_ruc">
                                    </div>
                                    <div class="col-8 form-group">
                                        <label for="" style="font-size:small;">RAZON SOCIAL</label>
                                        <input type="text" class="form-control" id="txt_razon">
                                    </div>
                                </div>
                            </div> -->
                        </div>                                     
                    </div>
                    <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
            </div>
            <div class="col-md-6">
                    <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title"><b>Datos del Documento</h3><b>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12 form-group">
                                <label for="" style="font-size:small;">PROCEDENCIA DEL DOCUMENTO</label>
                                <select class="js-example-basic-single" id="select_area_p" style="width:100%">
                                </select>
                            </div>
                            <div class="col-12 form-group">
                                <label for="" style="font-size:small;">AREA DE DESTINO</label>
                                <select class="js-example-basic-single" id="select_area_d" style="width:100%">
                                </select>
                            </div>
                            <div class="col-12 form-group">
                                <label for="" style="font-size:small;">ASUNTO DEL TRAMITE</label>
                                <textarea  id="txt_asunto" rows="3" class="form-control" style="resize:none"></textarea>
                            </div>
                            <div class="col-12 form-group">
                                <label for="" style="font-size:small;">Adjuntar documento</label>
                                <input type="file" class="form-control" id="txt_archivo">
                            </div>
                            <div class="col-12"><br>
                                    <!-- checkbox -->
                                <div class="form-group clearfix">
                                    <div class="icheck-success d-inline">
                                        <input type="checkbox" id="checkboxSuccess1" onclick="validar_informacion()">
                                        <label for="checkboxSuccess1" style="text-align:justify;">
                                            Estoy conforme con los politicas de servicio.
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
            </div>
        </div>
    </div>
    <div class="col-md-12">
                    <div class="card card-success">
                    <div class="card-header">
                        <h3 class="card-title"><b>Detalle del Documento</h3><b>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12" style="text-align:center">
                                <button class="btn  btn-success  btn-lg"  onclick="Registrar_Tramite()" id="btn_registro">REGISTRAR TRAMITE</button>
                            </div>
                            <div class="col-12 form-group">
                                <label for="" style="font-size:small;">PRODUCTO</label>
                                <select class="js-example-basic-single" id="select_producto" style="width:100%" name="select_producto">
                                </select>
                            </div>
                            <div class="col-3 form-group">
                                <label for="" style="font-size:small;">CANTIDAD</label>
                                <input type="number" class="form-control" id="txt_cantidad">
                            </div>
                            <div class="col-3 form-group">
                                <label for="" style="font-size:small;">Precio</label>
                                <input type="number" class="form-control" id="txt_precio">
                            </div>
                            <div class="col-3 form-group">
                                <label for="" style="font-size:small;">PRENDAS RECUADRO</label>
                                <input type="number" class="form-control" id="txt_prendas">
                            </div>
                            <div class="col-3 form-group">
                                <label for="">&nbsp;</label><br>
                                <button class="btn btn-success" style="width:100%" onclick="Agregar_Producto_Detalle()"><i class="fa fa-plus"></i>&nbsp;Agregar</button>
                            </div>
                            <div class="col-12 table-responsive">
                                <table id="detalle_ingreso" class="table">
                                    <thead>
                                        <tr>
                                            <th style="text-align:center" hidden>ID</th>
                                            <th style="text-align:left">PRODUCTO</th>
                                            <th style="text-align:center">CANTIDAD</th>
                                            <th style="text-align:center">PRECIO</th>
                                            <th style="text-align:center">SUB TOTAL</th>
                                            <th style="text-align:center">PRENDRAS RECUADRO</th>
                                            <th style="text-align:center">ACCI&Oacute;N</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody_detalle_ingreso">
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-8">

                            </div>
                            <div class="col-4">
                                <label for="">Total:</label>
                                <input type="text" class="form-control" id="txt_total" disabled>
                            </div>

                        </div>
                    </div>
                    <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
            </div>
    <script>
      $(document).ready(function() {
        $('.js-example-basic-single').select2();
        Cargar_Select_Area();
        Cargar_Select_Producto();
        $("#rad_presentacion1").on('click',function(){
            document.getElementById('div_juridico').style.display="none";
        });
        $("#rad_presentacion2").on('click',function(){
            document.getElementById('div_juridico').style.display="none";
        });
        $("#rad_presentacion3").on('click',function(){
            document.getElementById('div_juridico').style.display="block";
        });
      } );

      var input = document.getElementById("txt_ruc");
        input.addEventListener("keypress", function(event) {
        if (event.key === "Enter") {
            event.preventDefault();
            let ruc = document.getElementById("txt_ruc").value;
            Buscar_Datos_Ruc(ruc);
        }
        });
      validar_informacion();
      function validar_informacion(){

          if(document.getElementById('checkboxSuccess1').checked==false){
      
             $("#btn_registro").addClass("disabled");
          }else{
             $("#btn_registro").removeClass("disabled");
          }
      }

      $('input[type="file"]').on('change', function(){
            var ext = $( this ).val().split('.').pop();
            console.log($( this ).val());
            if ($( this ).val() != '') {
            if(ext == "PDF" || ext == "pdf" || ext == "docx"|| ext == "DOCX"|| ext == "zip" || ext == "png" || ext == "PNG" || ext == "jpg" || ext == "JPG" || ext == "jpeg"  || ext == "JPEG" || ext == "rar" || ext == "xlsx"  || ext == "xls" ){
                if($(this)[0].files[0].size > 31457280){ //---- 30 MB 
                //if($(this)[0].files[0].size > 1048576){ // 1 MB
                //if($(this)[0].files[0].size > 10485760){ // ---> 10 MB
                    Swal.fire("El archivo selecionado es demasiado pesado","<label style='color:#9B0000;'>seleccionar un archivo mas liviano</label>","warning");
                    $("#txt_archivo").val("");
                    return;
                    //$("#btn_subir").prop("disabled",true);
                }else{
                    //$("#btn_subir").attr("disabled",false);
                }
                $("#txtformato").val(ext);
                }
                else
                {
                $("#txt_archivo").val("");
                Swal.fire("Mensaje de Error","Extensión no permitida: " + ext,"","error");
                }
            }
        });
    </script>