let productos = [];

// Función para agregar un producto a la lista
$('.btnAgregar').on('click', function() {
    // Obtener los datos de la fila
    let fila = $(this).closest('tr');
    let id_inventario = fila.find('.id_inventario').text();
    let nombre_usuario = fila.find('.nombre_usuario').text();
    let nombre_articulo = fila.find('.nombre_articulo').text();
    let nombre_categoria = fila.find('.nombre_categoria').text();
    let precio = fila.find('.precio').text();

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

// Función para actualizar la tabla con los productos
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
        $('.btnAgregar').prop('disabled', false);
    });
}

$('#formProductos').on('submit', function(event) {
    event.preventDefault(); // Evitar el envío del formulario por defecto

    // Limpiar los campos ocultos previos antes de agregar los productos
    $(this).find('input[name="productos"]').remove();

    // Convertir el array de productos a una cadena JSON
    let productosJSON = JSON.stringify(productos);

    // Agregar los productos al formulario como un campo oculto
    let input = $('<input>').attr({
        type: 'hidden',
        name: 'productos',
        value: productosJSON
    });
    $('#formProductos').append(input);

    // Enviar el formulario
    this.submit();
});
