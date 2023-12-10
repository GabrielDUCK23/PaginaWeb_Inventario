/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var carrito = {};
function agregarProducto(nombre) {
    var cantidad = document.getElementById(nombre).value;
    if (cantidad > 0) {
        var tipo = document.querySelector('input[name="' + nombre + '_Tipo"]').value;
        if (!carrito.hasOwnProperty(nombre)) {
            carrito[nombre] = {
                cantidad: parseInt(cantidad),
                tipo: tipo
            };
            var tipoTextarea = document.getElementById("Tipo");
            if (tipoTextarea.value.indexOf(tipo) === -1) {
                tipoTextarea.value += (tipoTextarea.value ? ', ' : '') + tipo;
            }actualizarCarrito();
        } else {
 alert("Este material ya está en el carrito.");
        }
    } else {
        alert("Por favor seleccione una cantidad válida.");
          // Clear cart if new user logs in
   
    }
}function actualizarCarrito() {
    var mensaje = "";
    for (var producto in carrito) {
        mensaje +=producto + ": Cantidad: " + carrito[producto].cantidad +".\n";
    }
    document.getElementById("carrito").innerHTML = mensaje;
   
} 
    var botonLimpiar = document.getElementById("boton-limpiar");
    botonLimpiar.addEventListener("click", function () {
        carrito = {};
        actualizarCarrito();
        document.getElementById("carrito").innerHTML = "-";
    });
   var formMaterialEleccion = document.querySelector('form[name="MaterialEleccion"]');
formMaterialEleccion.addEventListener('submit', function (e) {
        eliminarCarrito();
    });function eliminarCarrito() {
        carrito = {};
        actualizarCarrito();
        document.getElementById("carrito").innerHTML = "-";
    }var botonComprar = document.getElementById("limpiar-carrito");
    botonComprar.addEventListener("click", function () {
        eliminarCarrito();
    });
