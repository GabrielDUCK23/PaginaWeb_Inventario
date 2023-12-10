<%-- 
    Document   : Materiales_Profesor
    Created on : 13/04/2023, 12:26:35 AM
    Author     : netor
--%>




<%@page import="UML.Materiales"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Modelado.DAO_Materiales"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menu</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
      <link rel="stylesheet" href="CSS/CSS.css">
    </head>
    <body>
        <%
            HttpSession objesesion = request.getSession(false);
            String Codigo;
            Codigo = (String) objesesion.getAttribute("user");
            String Nombre;
            Nombre = (String) objesesion.getAttribute("Nombre");

            int Nivel;
            Nivel = Integer.parseInt(objesesion.getAttribute("Nivel").toString());
            if (Nombre.equals("")) {
                response.sendRedirect("Login.jsp");
            } else if (Nivel != 3) {
                response.sendRedirect("Login.jsp");
            }
        %>
        <div class="wrapper">
            <nav>
                <input type="checkbox" id="show-search">
                <input type="checkbox" id="show-menu">
                <label for="show-menu" class="menu-icon"><i class="fas fa-bars"></i></label>
                <div class="content">
                    <li> <a href="Menu_Profesores.jsp"><img class="logo" src="imagenes/logo.png" alt="logo"></a></li>
                    <ul class="links">
                        <li> <a class="titulo"> Bienvenido <% out.println(Nombre);%></a> </li> 
                        <li><a href="Editar_Profesores.jsp">Editar Usuarios</a></li>

                        <li>
                            <a href="#" class="desktop-link">Solicitudes</a>
                            <input type="checkbox" id="show-features">
                            <label for="show-features">Solicitudes</label>
                            <ul>
                                <li><a href="Seleccion_MaterialProfesores.jsp"> Hacer una Solicitudes</a></li>
                                <li><a href="Solicitudes_Profesores.jsp">Solicitudes Pendientes</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="#" class="desktop-link">Agenda de Laboratorios</a>
                            <input type="checkbox" id="show-features1">
                            <label for="show-features1">Agenda de Laboratorios</label>
                            <ul>
                                <li><a href="Agendar_Laboratorio.jsp">Agendar Laboratorio</a></li>
                                <li><a href="Agenda_Individual.jsp">Visualizar Agendas </a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="#" class="desktop-link">Practicas Externas</a>
                            <input type="checkbox" id="show-features2">
                            <label for="show-features2">Practicas Externas</label>
                            <ul>
                                <li><a href="#">Agregar practica</a></li>
                                <li><a href="#">Visualizar practica </a></li>

                            </ul>
                        </li>
                        <li><a href="Login.jsp">Cerrar sesion</a></li>
                    </ul>
                </div>
            </nav>
        </div>
        <br><br>
        <br><br>
        <br><br>

    <center>
<form name="MaterialEleccion" method="POST" action="MaterialEleccion">
    <textarea id="carrito" name="Material" placeholder="Describe el Material" cols="" class="controlstextArea"></textarea><br>
    <button type="submit" name="accion" value="accion" onclick="event.preventDefault(); this.form.submit();" id="limpiar-carrito">Comprar</button>
    <button id="boton-limpiar">Limpiar</button>
</form>
        <br>
        <form name="Material" method="POST" action="Material">
            <input class="controlsBuscador" type="text" placeholder="Ingrese el Nombre a buscar" name="CTR">
            <button type="submit" value="Buscar2" name="Buscar2">Buscar</button>
            <button type="submit" name="Reiniciar2" value="Reiniciar2">Reiniciar</button>
        </form><br>





        <table class="tablaDatos2">
            <%                           if (request.getAttribute("BR") != null) {
                    datos = (List<Materiales>) request.getAttribute("BR");
                } else if (request.getAttribute("RP") != null) {
                    datos = dao.Seleccion();
                } else {
                    datos = dao.Seleccion();
                }
                for (Materiales m : datos) {

            %> 
            <thead>
                <tr>
                    <td>Nombre </td>  <td>Cantidad</td> 
                </tr>
            </thead>
            <tbody>



                <tr>   
                    <td data-column="Nombre:"><%= m.getNombre()%></td>
                    <td data-column="Cantidad:">
                        <select class="controls" type="select" name="<%=m.getNombre()%>" id="<%=m.getNombre()%>">
                            <option> - Selecciona una opción - </option>
                            <option value="1">-1</option>
                            <option value="2">-2</option>
                            <option value="3">-3</option> 
                            <option value="4">-4</option>
                            <option value="5">-5</option>
                        </select> 
                        <button type="button" onclick="agregarProducto('<%=m.getNombre()%>')">Agregar al carrito</button>
                    </td>
                </tr>
                <% }%>
            </tbody>
        </table>
        <br> 
        <br>


    </center>

<script>
var carrito = {};

function agregarProducto(nombre) {
    var cantidad = document.getElementById(nombre).value;
    if (cantidad > 0) {
        if (carrito.hasOwnProperty(nombre)) {
            carrito[nombre] += parseInt(cantidad);
        } else {
            carrito[nombre] = parseInt(cantidad);
        }
        actualizarCarrito();
    } else {
        alert("Por favor seleccione una cantidad válida.");
    }
}

function actualizarCarrito() {
    var mensaje = "-";
    for (var producto in carrito) {
        mensaje += " " + producto + " Necesito(" + carrito[producto] + "),";
    }
    document.getElementById("carrito").innerHTML = mensaje;
    localStorage.setItem('carrito', JSON.stringify(carrito));
}

var carritoGuardado = localStorage.getItem('carrito');
if (carritoGuardado) {
    carrito = JSON.parse(carritoGuardado);
    actualizarCarrito();
}

var botonLimpiar = document.getElementById("boton-limpiar");
botonLimpiar.addEventListener("click", function() {
    carrito = {};
    actualizarCarrito();
    document.getElementById("carrito").innerHTML = "-";
});

var formMaterialEleccion = document.querySelector('form[name="MaterialEleccion"]');
formMaterialEleccion.addEventListener('submit', function(e) {
    eliminarCarrito();
});

function eliminarCarrito() {
    carrito = {};
    actualizarCarrito();
    document.getElementById("carrito").innerHTML = "-";
}

var botonComprar = document.getElementById("limpiar-carrito");
botonComprar.addEventListener("click", function() {
    eliminarCarrito();
});

</script>
</body>
</html>


