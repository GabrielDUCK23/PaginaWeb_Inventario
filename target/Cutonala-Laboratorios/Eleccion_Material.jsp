<%-- 
    Document   : Eleccion_Material
    Created on : 11/04/2023, 03:30:02 PM
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
        <link rel="stylesheet" href="//cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />
        <link rel="stylesheet" href="//cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>

    </head>
    <body>
        <%

            DAO_Materiales dao = new DAO_Materiales();
            List<Materiales> datos = new ArrayList();
            HttpSession objesesion = request.getSession(false);
            String Correo;
            Correo = (String) objesesion.getAttribute("user");
            String Nombre;
            Nombre = (String) objesesion.getAttribute("Nombre");

            int Nivel;
            Nivel = Integer.parseInt(objesesion.getAttribute("Nivel").toString());
            if (Nombre.equals("")) {
                response.sendRedirect("Login.jsp");
            } else if (Nivel != 1) {
                response.sendRedirect("Login.jsp");
            }
            int cant;

        %>
        <nav>
            <div class="wrapper">
                <nav>
                    <input type="checkbox" id="show-search">
                    <input type="checkbox" id="show-menu">
                    <label for="show-menu" class="menu-icon"><i class="fas fa-bars"></i></label>
                    <div class="content">
                        <li> <a href="Menu_Alumnos.jsp"><img class="logo" src="imagenes/logo.png" alt="logo"></a></li>
                        <ul class="links">
                            <li> <a class="titulo"> Bienvenido <% out.println(Nombre);%></a> </li> 
                            <li><a href="Editar_Alumnos.jsp">Administrar Perfil</a></li>

                            <li>
                                <a href="#" class="desktop-link">Solicitudes</a>
                                <input type="checkbox" id="show-features1">
                                <label for="show-features1">Solicitar</label>
                                <ul>
                                    <li><a href="Eleccion_Material.jsp">Solicitar material de laboratorio</a></li>
                                    <li><a href="Solicitud_CartaNoAdeudo.jsp">Solicitar carta de no adeudo</a></li>  


                                </ul>
                            </li>
                            <li><a href="Solicitudes_individuales.jsp">Mis Solicitudes Pendientes</a></li>

                            <!-- <li><a href="Estatus_Carta.jsp">Estatus de carta no adeudo</a></li> -->




                            <li><a href="Login.jsp">Cerrar sesion</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </nav>
        <br><br>
        <br><br>


        <%
            String respuesta = (String) request.getAttribute("respuesta");
            if (respuesta != null) {
        %>
        <script>
            window.onload = function () {
                alert("<%= respuesta%>");
            };
        </script>
        <%
            }
        %>

    <center>
        <form name="MaterialEleccion" method="POST" action="MaterialEleccion">
            <textarea id="carrito" name="Material" placeholder="Describe el Material" cols="" class="controlstextArea"></textarea><br>
            <textarea id="Tipo" name="Tipo" cols="" class="controlstextArea" hidden></textarea><br>
            <input name="Tipo" type="hidden">
            <button type="submit" class="buttonEntregar" name="Datos" value="Datos" onclick="event.preventDefault(); this.form.submit();" id="limpiar-carrito">Continuar</button>
            <button id="boton-limpiar" name="nada" class="buttonCancelar">Limpiar</button>
        </form><br>



        <br>



        <div class="flex-container1">
            <div class="fondo1">
                <table id="tablaDatos" >


                    <thead>
                        <tr>
                            <th>Nombre </th>
                            <th>Cantidad</th> 
                        </tr>
                    </thead>
                    <tbody>
                        <%                           
                            if (request.getAttribute("BR") != null) {
                                datos = (List<Materiales>) request.getAttribute("BR");
                            } else if (request.getAttribute("RP") != null) {
                                datos = dao.Seleccion();
                            } else {
                                datos = dao.Seleccion();
                            }
                            for (Materiales m : datos) {

                        %> 
                        <tr>   
                            <td data-column=""><%= m.getNombre()%></td>


                            <td data-column="Cantidad:"><br>
                                <select class="controls" type="select" name="<%=m.getNombre()%>" id="<%=m.getNombre()%>">
                                    <%

                                        int cantidadTotal = m.getCantidad_Total();
                                        for (cant = 1; cant <= cantidadTotal; cant++) {


                                    %>
                                    <option>  <%= cant%>
                                    </option>
                                    <% }%>
                                </select> 
                                <input type="hidden" name="<%=m.getNombre()%>_Tipo" value="<%= m.getTipo()%>">

                                <button type="button" class="button1" onclick="agregarProducto('<%=m.getNombre()%>'); this.setAttribute('data-tipo', '<%=m.getTipo()%>')">Agregar al carrito</button>

                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
        <br> 
        <br>


    </center>

    <script>var carrito = {};
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
                    }
                    actualizarCarrito();
                } else {
                    alert("Este material ya está en el carrito.");
                }
            } else {
                alert("Por favor seleccione una cantidad válida.");
                // Clear cart if new user logs in

            }
        }
        function actualizarCarrito() {
            var mensaje = "Material.\n";
            for (var producto in carrito) {
                mensaje += producto + ": Cantidad de producto: " + carrito[producto].cantidad + ".\n";
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
        });
        function eliminarCarrito() {
            carrito = {};
            actualizarCarrito();
            document.getElementById("carrito").innerHTML = "-";
        }
        var botonComprar = document.getElementById("limpiar-carrito");
        botonComprar.addEventListener("click", function () {
            eliminarCarrito();
            });
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="Js/Funciones.js"></script>

</body>
</html>


