var  tbl_cliente;
function listar_cliente(){
    tbl_cliente = $("#tabla_cliente").DataTable({
        "ordering":false,   
        "bLengthChange":true,
        "searching": { "regex": false },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 10,
        "destroy":true,
        "async": false ,
        "processing": true,
        "ajax":{
            "url":"../controller/cliente/controlador_listar_cliente.php",
            type:'POST'
        },
        "columns":[
            {"defaultContent":""},
            {"data":"cli_nro_ruc"},
            {"data":"cli_razon_social"},
            {"data":"cli_direccion"},
            {"data":"cli_celular"},
            {"data":"cli_email"},
            {"data":"cli_estatus",
                render: function(data,type,row){
                        if(data=='ACTIVO'){
                        return '<span class="badge bg-success">ACTIVO</span>';
                        }else{
                        return '<span class="badge bg-danger">INACTIVO</span>';
                        }
                }   
            },
            {"defaultContent":"<button class='editar btn btn-primary'><i class='fa fa-edit'></i></button>"},
            
        ],
  
        "language":idioma_espanol,
        select: true
    });
    tbl_cliente.on('draw.td',function(){
      var PageInfo = $("#tabla_cliente").DataTable().page.info();
      tbl_cliente.column(0, {page: 'current'}).nodes().each(function(cell, i){
        cell.innerHTML = i + 1 + PageInfo.start;
      });
    });
}

$('#tabla_cliente').on('click','.editar',function(){
	var data = tbl_cliente.row($(this).parents('tr')).data();//En tamaño escritorio
	if(tbl_cliente.row(this).child.isShown()){
		var data = tbl_cliente.row(this).data();
	}//Permite llevar los datos cuando es tamaño celular y usas el responsive de datatable
    $("#modal_editar").modal('show');    
    document.getElementById('txt_idcliente').value=data.cliente_id;
    document.getElementById('txt_ruc_editar').value=data.cli_nro_ruc;
    document.getElementById('txt_raz_editar').value=data.cli_razon_social;
    document.getElementById('txt_dire_editar').value=data.cli_direccion;
    document.getElementById('txt_cel_editar').value=data.cli_celular;
    document.getElementById('txt_email_editar').value=data.cli_email;
    document.getElementById('select_estatus').value=data.cli_estatus;
})

function AbrirRegistro(){
    $("#modal_registro").modal({backdrop:'static',keyboard:false})
    $("#modal_registro").modal('show');
}

function Registar_Cliente(){
    let ruc = document.getElementById('txt_ruc').value;
    let raz = document.getElementById('txt_raz').value;
    let dire = document.getElementById('txt_dire').value;
    let cel = document.getElementById('txt_cel').value;
    let email = document.getElementById('txt_email').value;
    if(ruc.length==0 || raz.length==0  || dire.length==0  || cel.length==0  || email.length==0){
        return Swal.fire("Mensaje de Advertencia","Tiene campos vacios","warning");
    }
    if(validar_email(email)){

    }else{
        return Swal.fire("Mensaje de Advertencia","El formato de email es incorrecto","warning");
    }

    $.ajax({
        "url":"../controller/cliente/controlador_registro_cliente.php",
        type:'POST',
        data:{
            ruc:ruc,
            raz:raz,
            dire:dire,
            cel:cel,
            email:email
        }
    }).done(function(resp){
        if(resp>0){
            if(resp==1){
                Swal.fire("Mensaje de Confirmacion","Nuevo Cliente Registrado","success").then((value)=>{
                    document.getElementById('txt_ruc').value="";
                    document.getElementById('txt_raz').value="";
                    document.getElementById('txt_dire').value="";
                    document.getElementById('txt_cel').value="";
                    document.getElementById('txt_email').value="";
                    tbl_cliente.ajax.reload();
                    $("#modal_registro").modal('hide');
                });
            }else{
                Swal.fire("Mensaje de Advertencia","El Nro Ruc ingresado ya se encuentra en la base de datos","warning");
            }
        }else{
            return Swal.fire("Mensaje de Error","No se completo el registro","error");            
        }
    })
}

function Modificar_Cliente(){
    let id = document.getElementById('txt_idcliente').value;
    let ruc = document.getElementById('txt_ruc_editar').value;
    let raz = document.getElementById('txt_raz_editar').value;
    let dire = document.getElementById('txt_dire_editar').value;
    let cel = document.getElementById('txt_cel_editar').value;
    let email = document.getElementById('txt_email_editar').value;
    let esta = document.getElementById('select_estatus').value;
    if(id.length==0 || ruc.length==0 || raz.length==0  || dire.length==0  || cel.length==0  || email.length==0 || esta.length==0){
        return Swal.fire("Mensaje de Advertencia","Tiene campos vacios","warning");
    }
    if(validar_email(email)){

    }else{
        return Swal.fire("Mensaje de Advertencia","El formato de email es incorrecto","warning");
    }

    $.ajax({
        "url":"../controller/cliente/controlador_modificar_cliente.php",
        type:'POST',
        data:{
            id:id,
            ruc:ruc,
            raz:raz,
            dire:dire,
            cel:cel,
            email:email,
            esta:esta
        }
    }).done(function(resp){
        if(resp>0){
            if(resp==1){
                Swal.fire("Mensaje de Confirmacion","Cliente Modificado","success").then((value)=>{
                    tbl_cliente.ajax.reload();
                    $("#modal_editar").modal('hide');
                });
            }else{
                Swal.fire("Mensaje de Advertencia","El cliente ingresado ya se encuentra en la base de datos","warning");
            }
        }else{
            return Swal.fire("Mensaje de Error","No se completo la actualización","error");            
        }
    })
}

function validar_email(email) {
    let regex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test(email) ? true : false;
}