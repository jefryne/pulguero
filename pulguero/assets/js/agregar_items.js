
let productos = [];

$('.btnAgregar').on('click', function() {
    // Obtener la fila actual
    let fila = $(this).closest('tr');
    
    // Obtener los datos de la fila
    let id_inventario = fila.find('.id_inventario').text(); // Reemplaza '.nombre' por la clase o identificador de la columna correspondiente
    let nombre_usuario = fila.find('.nombre_usuario').text(); 
    let nombre_articulo = fila.find('.nombre_articulo').text(); 
    let descripcion_articulo = fila.find('.descripcion_articulo').text(); // Reemplaza '.precio' por la clase o identificador de la columna correspondiente
    
    // Crear un objeto con los datos
    let producto = {
        // price: nombre,
        // cost: precio,
        descripcion:descripcion_articulo,
        nombre: nombre_articulo,
        //id_category,
        id_user: nombre_usuario,

    };

    // Agregar el producto al arreglo
    productos.push(producto);
    actualizarTabla();
});


$('#botonEnviar').on('click', function() {
    $.ajax({
        url: 'http://[::1]/pulguero/index.php/Inventarios/listadoInventario', // Reemplaza 'url_del_controlador' por la URL de tu controlador en CodeIgniter
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

    // Limpiar la tabla antes de actualizarla para evitar duplicados
    cuerpoTabla.empty();

    // Recorrer el arreglo y agregar cada elemento a la tabla
    productos.forEach(function(producto) {
        let fila = `<tr>
                        <td>${producto.nombre}</td>
                        <td>${producto.descripcion}</td>
                    </tr>`;
        cuerpoTabla.append(fila);
    });
}