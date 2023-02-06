<script src="../js/console_cliente.js?rev=<?php echo time();?>"></script>
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">MANTENIMIENTO DE CLIENTES</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Cliente</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- /.col-md-6 -->
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header">
                <h5 class="card_title"><b>Listado de Clientes</b></h5>
                <button class="btn btn-danger btn-sm float-right" onclick="AbrirRegistro()"> <i class="fas fa-plus"> </i>Nuevo Registro</button>
              </div>
              <div class="card-body">
              <table id="tabla_cliente" class="display" style="width:100%">
                  <thead>
                      <tr>
                          <th>#</th>                          
                          <th>Ruc</th>
                          <th>Razon Social</th>
                          <th>Direccion</th>
                          <th>Celular</th>
                          <th>Email</th>
                          <th>Estatus</th>
                          <th>Acción</th>
                      </tr>
                  </thead>
              </table>
              </div>
            </div>

          </div>
          <!-- /.col-md-6 -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- Modal Registro -->
<div class="modal fade" id="modal_registro"  role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">REGISTRO DE CLIENTE</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
            <div class="col-4">
                <label for="">RUC</label>
                <input type="text" class="form-control" id="txt_ruc">
            </div>
            <div class="col-8">
                <label for="">RAZON SOCIAL</label>
                <input type="text" class="form-control" id="txt_raz">
            </div>
            <div class="col-12">
                <label for="">DIRECCION</label>
                <input type="text" class="form-control" id="txt_dire">
            </div>
            <div class="col-3">
                <label for="">CELULAR</label>
                <input type="text" class="form-control" id="txt_cel">
            </div>
            <div class="col-9">
                <label for="">EMAIL</label>
                <input type="text" class="form-control" id="txt_email">
            </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-success" onclick="Registar_Cliente()">REGISTRAR</button>
      </div>
    </div>
  </div>
</div>    
<!-- Modal -->
    <!-- Modal Editar -->
<div class="modal fade" id="modal_editar"  role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">EDITAR DATOS DEL CLIENTE</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
            <div class="col-4">
              <input type="text" id="txt_idcliente" hidden>
                <label for="">RUC</label>
                <input type="text" class="form-control" id="txt_ruc_editar">                
            </div>
            <div class="col-8">
                <label for="">RAZON SOCIAL</label>
                <input type="text" class="form-control" id="txt_raz_editar">
            </div>
            <div class="col-12">
                <label for="">DIRECCION</label>
                <input type="text" class="form-control" id="txt_dire_editar">
            </div>
            <div class="col-3">
                <label for="">CELULAR</label>
                <input type="text" class="form-control" id="txt_cel_editar">
            </div>
            <div class="col-9">
                <label for="">EMAIL</label>
                <input type="text" class="form-control" id="txt_email_editar">
            </div>
            <div class="col-12">
              <label for="">Estatus</label>
              <select name="" id="select_estatus" class="form-control">
                <option value="ACTIVO">ACTIVO</option>
                <option value="INACTIVO">INACTIVO</option>
              </select>
            </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-success" onclick="Modificar_Cliente()">MODIFICAR</button>
      </div>
    </div>
  </div>
</div>    
<!-- Modal -->
    <!-- Modal -->
    <div class="modal fade" id="modal_contra"  role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">EDITAR CONTRASEÑA DE USUARIO</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
            <div class="col-12">
                <label for="">CONTRASEÑA</label>
                <input type="password" class="form-control" id="txt_contra_nueva">
                <input type="text" id="txt_idusuario_contra" hidden>
            </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-success" onclick="Modificar_Usuario_Contra()">MODIFICAR</button>
      </div>
    </div>
  </div>
</div>    
<!-- Modal -->
    <!-- /.content -->
    <script>
      $(document).ready(function() {
        listar_cliente();
      } );
      $('#modal_registro').on('shown.bs.modal', function () {
        $('#txt_ruc').trigger('focus')
        })
    </script>