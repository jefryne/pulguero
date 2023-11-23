
let productos = [];
$('.btnAgregar').on('click', function() {
    // Obtener la fila actual
    let btnAgregar = $(this); // Obtener el botón actual
    btnAgregar.prop('disabled', true); 
    let fila = $(this).closest('tr');
    console.log(productos);
    
    // Obtener los datos de la fila
    let id_inventario = fila.find('.id_inventario').text(); // Reemplaza '.nombre' por la clase o identificador de la columna correspondiente
    let nombre_usuario = fila.find('.nombre_usuario').text(); 
    let nombre_articulo = fila.find('.nombre_articulo').text(); 
    let nombre_categoria = fila.find('.nombre_categoria').text(); // Reemplaza '.precio' por la clase o identificador de la columna correspondiente
    let precio = fila.find('.precio').text(); // Reemplaza '.precio' por la clase o identificador de la columna correspondiente

    // Crear un objeto con los datos
    let producto = {
        id_inventario: id_inventario,
        nombre_articulo: nombre_articulo,
        nombre_categoria: nombre_categoria,
        nombre_usuario: nombre_usuario,
        precio: precio
    };

    // Agregar el producto al arreglo
    productos.push(producto);
    actualizarTabla();
});


$('#botonEnviar').on('click', function() {
    $.ajax({
        url: 'http://[::1]/pulguero/index.php/Items/crearFactura', // Reemplaza 'url_del_controlador' por la URL de tu controlador en CodeIgniter
        method: 'POST',
        data: { productos: productos },
        success: function(response) {
            
        },
        error: function(err) {
            // Manejar errores si ocurren
        }
    });
});





// Función para actualizar la tabla con los elementos del arreglo
function actualizarTabla() {
    let cuerpoTabla = $('#cuerpoTabla');

    cuerpoTabla.empty();

    productos.forEach(function(producto, index) {
        let fila = `<tr>
                        <td>${producto.nombre_articulo}</td>
                        <td>${producto.precio}</td>
                        <td><button class="btnCancelar btn btn-danger" data-indice="${index}">Cancelar</button></td>
                    </tr>`;
        cuerpoTabla.append(fila);
    });

    $('.btnCancelar').on('click', function() {
        let indice = $(this).data('indice');
        productos.splice(indice, 1);
        actualizarTabla();
        $('.btnAgregar').prop('disabled', false); // Reactivar el botón Agregar
    });
}