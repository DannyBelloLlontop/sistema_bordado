var  tbl_producto;
function listar_producto(){
    tbl_producto = $("#tabla_producto").DataTable({
        "ordering":false,   
        "bLengthChange":true,
        "searching": { "regex": false },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 10,
        "destroy":true,
        "async": false ,
        "processing": true,
        "ajax":{
            "url":"../controller/producto/controlador_listar_producto.php",
            type:'POST'
        },
        "columns":[
            {"defaultContent":""},
            {"data":"producto_nombre"},
            {"data":"producto_fecha_registro"},
            {"data":"producto_estado",
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
    tbl_producto.on('draw.td',function(){
      var PageInfo = $("#tabla_producto").DataTable().page.info();
      tbl_producto.column(0, {page: 'current'}).nodes().each(function(cell, i){
        cell.innerHTML = i + 1 + PageInfo.start;
      });
    });
}

$('#tabla_producto').on('click','.editar',function(){
	var data = tbl_producto.row($(this).parents('tr')).data();//En tamaño escritorio
	if(tbl_producto.row(this).child.isShown()){
		var data = tbl_producto.row(this).data();
	}//Permite llevar los datos cuando es tamaño celular y usas el responsive de datatable
    $("#modal_editar").modal('show');
    document.getElementById('txt_producto_editar').value=data.producto_nombre;
    document.getElementById('txt_idproducto').value=data.producto_id;
    document.getElementById('select_estatus').value=data.producto_estado;
})

function AbrirRegistro(){
    $("#modal_registro").modal({backdrop:'static',keyboard:false})
    $("#modal_registro").modal('show');
}

function Registrar_Producto(){
    let producto = document.getElementById('txt_producto').value;
    if(producto.length==0){
        return Swal.fire("Mensaje de Advertencia","Tiene campos vacios","warning");
    }

    $.ajax({
        "url":"../controller/producto/controlador_registro_producto.php",
        type:'POST',
        data:{
            producto:producto
        }
    }).done(function(resp){
        if(resp>0){
            if(resp==1){
                Swal.fire("Mensaje de Confirmacion","Nuevo Producto Registrado","success").then((value)=>{
                    document.getElementById('txt_producto').value="";
                    tbl_producto.ajax.reload();
                    $("#modal_registro").modal('hide');
                });
            }else{
                Swal.fire("Mensaje de Advertencia","El Producto ingresada ya se encuentra en la base de datos","warning");
            }
        }else{
            return Swal.fire("Mensaje de Error","No se completo el registro","error");            
        }
    })
}

function Modificar_Producto(){
    let id = document.getElementById('txt_idproducto').value;
    let producto = document.getElementById('txt_producto_editar').value;
    let estado = document.getElementById('select_estatus').value;
    if(id.length==0 || producto.length==0 || estado.length==0){
        return Swal.fire("Mensaje de Advertencia","Tiene campos vacios","warning");
    }

    $.ajax({
        "url":"../controller/producto/controlador_modificar_producto.php",
        type:'POST',
        data:{
            id:id,            
            producto:producto,
            estado:estado
        }
    }).done(function(resp){
        if(resp>0){
            if(resp==1){
                Swal.fire("Mensaje de Confirmacion","Datos del Producto Actualizados","success").then((value)=>{
                    tbl_producto.ajax.reload();
                    $("#modal_editar").modal('hide');
                });
            }else{
                Swal.fire("Mensaje de Advertencia","El Producto ingresada ya se encuentra en la base de datos","warning");
            }
        }else{
            return Swal.fire("Mensaje de Error","No se completo la actualizacion","error");            
        }
    })
}
