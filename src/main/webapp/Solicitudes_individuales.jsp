<%@page import="UML.Usuarios"%>
<%@page import="Modelado.DAO_Usuario"%>
<%@page import="java.util.List"%>
<%@page import="UML.Solicitud"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelado.DAO_Solicitud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menu</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link rel="stylesheet" href="CSS/CSS.css">
        <link rel="stylesheet" href="//cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />
        <link rel="stylesheet" href="//cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js" />
    </head>
    <body>
        <%
            DAO_Solicitud dao = new DAO_Solicitud();
            DAO_Usuario dao2 = new DAO_Usuario();
            List<Solicitud> datos = new ArrayList();
            List<Usuarios> datos2 = new ArrayList();
            HttpSession objesesion = request.getSession(false);
            String Correo;
            Correo = (String) objesesion.getAttribute("user");
            String Nombre;
            Nombre = (String) objesesion.getAttribute("Nombre");
            dao.Codigo(Correo);
            int Nivel;
            Nivel = Integer.parseInt(objesesion.getAttribute("Nivel").toString());
            if (Nombre.equals("")) {
                response.sendRedirect("Login.jsp");
            } else if (Nivel != 1) {
                response.sendRedirect("Login.jsp");
            }
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
        <br>
        
               <%
    String respuesta = (String) request.getAttribute("respuesta");
    if (respuesta != null) {
%>
<script>
    window.onload = function() {
        alert("<%= respuesta %>");
    };
</script>
<%
    }
%>

    <center>
        <div class="form-box">
            <div class="button-box">
                <div id="btn"></div>
                <button type="button" id="boton1" class="toggle-btn" onclick="moveToLeft()">Ver estatus de solicitud de material</button>
                <button type="button" id="boton2" class="toggle-btn" onclick="moveToRight()">Ver estatus carta no adeudo</button>
            </div>
        </div>        </center>
    <br><br>

    <center>

        <div class="flex-container3" id="tabla1">
            <div class="fondo1">

                <table id="tablaDatos">

                    <thead>
                        <tr>
                            <th>Estatus</th>
                            <th>Fecha</th>
                            <th>Hora</th> 
                            <th>Laboratorio</th>
                            <th>Departamento donde se encuentra</th>
                            <th>Fecha de entrega </th>
                            <th>Hora de entrega  </th> 
                            <th>Más detalles</th>
                       
                        </tr>
                    </thead>

                    <tbody>

                        <%

                            if (request.getAttribute("BR") != null) {
                                datos = (List<Solicitud>) request.getAttribute("BR");
                            } else if (request.getAttribute("RP") != null) {
                                datos = dao.consultar(Correo);
                            } else {
                                datos = dao.consultar(Correo);
                            }
                            for (Solicitud s : datos) {
                        %>  



                        <tr>
                            <td data-column="Estatus"><br><%= s.getEstatus()%></td>
                            <td data-column="Fecha"><br><%= s.getFecha()%></td>
                            <td data-column="Hora"><br><%= s.getHora()%></td>
                            <td data-column="Laboratorio"><br> <%= s.getLab()%> </td>
                            <td data-column="Lugar "><br> <%= s.getDepart()%> <%= s.getDepart2()%></td>      
                            <td data-column="Fecha de entrega"><br><%= s.getFecha_E()%></td>
                            <td data-column="Hora de entrega "><br><%= s.getHora_E()%></td>
                            <td data-column="Ver más"><br>
                            <form method="POST" action="Vista_Solicitudes_Alumnos.jsp" >
                                  <input type="hidden" name="IDS" value="<%= s.getId_S() %>">
                                 <button type="submit" class="button1">Ver Más </button>
                            </form>

                        </td>
                           
                        </tr>




                        <%
                            }

                        %>
                    </tbody>
                </table>

            </div>
        </div>

    </center>
    <center>
        <div class="flex-container1" id="tabla2" style="display:none;">
            <div class="fondo1">

                <table id="tablaDatos2">
                    <thead>
                        <tr>

                            <th>Fecha de la solicitud</th>
                            <th>Hora</th>
                            <th>Motivo</th>
                            <th>Ciclo escolar</th>
                            <th>Estatus</th>
                            <th>Fecha de entrega</th>

                            <th>Cancelar</th>
                        </tr>
                    </thead>

                    <tbody>

                        <%                    if (request.getAttribute("BR") != null) {
                                datos2 = (List<Usuarios>) request.getAttribute("BR");
                            } else if (request.getAttribute("RP") != null) {
                                datos2 = dao2.solicitudes_Carta(Correo);
                            } else {
                                datos2 = dao2.solicitudes_Carta(Correo);
                            }
                            for (Usuarios s2 : datos2) {
                        %>  



                        <tr>


                            <td data-column="Fecha:"><br><%= s2.getHora()%> </td>
                            <td data-column="Fecha:"><br><%= s2.getFecha()%> </td>
                            <td data-column="Motivo:"><br><%= s2.getMotivo()%></td>


                            <td data-column="Ciclo:"><br><%= s2.getCiclo()%></td>
                            <td data-column="Estatus:"><br><%= s2.getEstatus()%></td>
                            <td data-column="Fecha de entrega:"><br><%= s2.getFecha_E()%></td>

                            <td data-column="Cancelar">  <br>
                                <form name="Usuario" method="POST" action="Usuario" >
                                    <input class="button" type="hidden" name="id" value="<%= s2.getC()%>">
                                    <%
                                        String a;
                                        String sss = s2.getEstatus();
                                        a = "Pendiente";

                                    %>
                                    <button <% if (sss.equals(a)) { // Se corrigió el operador lógico de 'sss.equals(a)  sss.equals(e)' a 'sss.equals(a) || sss.equals(e)'
                                            out.print("enabled"); // Se corrigió el valor de 'enable' a 'enabled'
                                        } else {
                                            out.print("disabled");
                                        } %> type="submit" name="Cancelar" value="Cancelar" class="buttonCancelar">Cancelar</button>

                                </form>
                            </td>

                        </tr>




                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

    </center>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="Js/Funciones_Table.js"></script>

    <script src="Js/BotonSwitch.js">

    </script>
    <br>
    <br><br> 
</body>

</html>