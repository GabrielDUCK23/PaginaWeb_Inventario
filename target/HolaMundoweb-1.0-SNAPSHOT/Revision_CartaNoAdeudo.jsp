<%-- 
    Document   : CartaAdeudo
    Created on : 1/02/2023, 11:28:14 PM
    Author     : netor
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="UML.Usuarios"%>
<%@page import="Modelado.DAO_Usuario"%>

<%@page import= "java.util.*" %>
<%@page import="UML.Materiales" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menu</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link rel="stylesheet" href="CSS/CSS.css">
        <link rel="stylesheet" href="//cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="//cdn.datatables.net/buttons/1.7.1/css/buttons.dataTables.min.css">
        <link href="https://cdn.datatables.net/v/dt/jszip-3.10.1/dt-1.13.6/b-2.4.1/b-html5-2.4.1/date-1.5.1/datatables.min.css" rel="stylesheet"
    </head>
    <body>
        <%    DAO_Usuario dao = new DAO_Usuario();
            List<Usuarios> datos = new ArrayList();
            HttpSession objesesion = request.getSession(false);
            String Correo;
            Correo = (String) objesesion.getAttribute("user");

            String Nombre;
            Nombre = (String) objesesion.getAttribute("Nombre");

            int Nivel;
            Nivel = Integer.parseInt(objesesion.getAttribute("Nivel").toString());
            if (Nombre.equals("")) {
                response.sendRedirect("Login.jsp");
            } else if (Nivel != 2) {
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
                    <li> <a href="Menu_Principal.jsp"><img class="logo" src="imagenes/logo.png" alt="logo"></a></li>
                    <ul class="links">

                        <li>
                            <a href="#" class="desktop-link">Usuarios</a>
                            <input type="checkbox" id="show-features">
                            <label for="show-features">Usuarios</label>
                            <ul>
                                <li><a href="Registro_SuperUsuario.jsp">Registrar usuarios</a></li>
                                <li><a href="Administrar_U.jsp">Actualizar usuarios</a></li>
                                <li><a href="EditarSuperUsuario.jsp">Actualizar Perfil</a></li>
                                

                            </ul>
                        </li>
                        <li>
                            <a href="#" class="desktop-link">Solicitudes</a>
                            <input type="checkbox" id="show-features1">
                            <label for="show-features1">Solicitudes</label>
                            <ul>
                                
                                <li><a href="RevisionMaterial.jsp"> Revisión  de solicitudes pendiente</a></li>
                               <!-- <li><a href="Entregar_Material.jsp">Entrega de material</a></li> -->
                                <li><a href="Solicitudes_Usuarios.jsp">Todas las Solicitudes</a></li>


                            </ul>
                        </li>
                        
                        
                        <li>
                            <a href="#" class="desktop-link">Reportes</a>
                            <input type="checkbox" id="show-features6">
                            <label for="show-features6">Reportes</label>
                            <ul>
                                  <li><a href="Reporte.jsp">Realizar Reporte</a></li>
                                  <li><a href="VistaReporte.jsp">Visualizar Reportes</a></li>
                                  <li><a href="Reportes_Encargados.jsp">Reportes Compartidos</a></li>
                                 
                             

                            </ul>
                        </li>


                        <li>
                            <a href="#" class="desktop-link">Laboratorios</a>
                            <input type="checkbox" id="show-features2">
                            <label for="show-features2">Laboratorio</label>
                            <ul>
                                <li><a href="Registro_Laboratorios.jsp">Registrar Laboratorios</a></li>
                                <li><a href="Actualizacion_Laboratorios.jsp">Actualizar Laboratorios</a></li>
                                <li><a href="Revision_Agenda.jsp">Agenda de laboratorios</a></li>

                            </ul>
                        </li>
                        <li>
                            
                               <li>
                            <a href="#" class="desktop-link">Carta de no adeudo</a>
                            <input type="checkbox" id="show-features2">
                            <label for="show-features2">Laboratorio</label>
                            <ul>
                                 <li><a href="Revision_CartaNoAdeudo.jsp">Revision</a></li>
                                 <li><a href="Todas_CartasAdeudo.jsp">Todas las solicitudes</a></li>
                                

                            </ul>
                        </li>
                            
                               
                                

                        <li>
                            <a href="#" class="desktop-link">Material</a>
                            <input type="checkbox" id="show-features4">
                            <label for="show-features4">Materiales</label>
                            <ul>
                                <li><a href="AgregaMaterial.jsp">Añadir Material</a></li>    
                                <li><a href="ActualizarMaterial.jsp">Actualizar Material</a></li>

                            </ul>
                        </li>



                        <li><a href="Login.jsp">Cerrar sesion</a></li>
                    </ul>
                </div>
            </nav>
        </div>
        </nav>
        <br><br>
        <br><br>


        <%                   String respuesta = (String) request.getAttribute("respuesta");
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
        <div class="form-box">
            <div class="button-box">
                <div id="btn"></div>
                <button type="button" id="boton1" class="toggle-btn" onclick="moveToLeft()">Solicitudes pendientes</button>
                <button type="button" id="boton2" class="toggle-btn" onclick="moveToRight()">Entregar de Carta</button>
            </div>
        </div>        </center>

    <br><br>

    <center>
        <div class="flex-container2" id="tabla1" >
            <div class="fondo1">
                <table id="tablaDatos">

                    <thead>
                        <tr>
                            <th>id</th>
                            <th>Correo</th>
                            <th>Codigo </th> 
                            <th>Nombre </th>
                            <th>Carrera</th> 
                            <th>Semestre</th> 
                            <th>Ciclo escolar</th>
                            <th>Motivo</th> 
                            <th>Estatus de carta no adeudo</th>
                            <th>Fecha de entrega</th>
                            <th>Ver más</th>

                        </tr>
                    </thead>
                    <tbody>

                        <%    if (request.getAttribute("BR") != null) {
                                datos = (List<Usuarios>) request.getAttribute("BR");
                            } else if (request.getAttribute("RP") != null) {
                                datos = dao.CartaNoAdeudo();
                            } else {
                                datos = dao.CartaNoAdeudo();
                            }
                            for (Usuarios u : datos) {
                        %>  




                        <tr>
                            <td data-column="Correo:"><br><%= u.getC()%></td>
                            <td data-column="Correo:"><br><%= u.getCorreo()%></td>
                            <td data-column="Codigo:"><br> <%= u.getCod()%> </td>
                            <td data-column="Nombre:"><br> <%= u.getNom()%> </td>
                            <td data-column="Carrera:"><br> <%= u.getCar()%> </td>
                            <td data-column="Semestre"><br> <%= u.getSem()%> </td>
                            <td data-column="Ciclo"><br><%= u.getCiclo()%></td>
                            <td data-column="Motivo:"><br><%= u.getMotivo()%></td>
                            <td data-column="Estatus:"><br><%= u.getEstatus()%></td>
                            <td data-column="Fecha de Entrega"><br><br>
                                <form name="Usuario" method="POST" action="Usuario" ><br>
                                    <input class="controls"  type="date" name="Dia" id="fecha" min="<%= LocalDate.now().plusDays(1).toString()%>"
                                           max="<%= LocalDate.now().plusDays(30).toString()%>" required>
                                    <input type="hidden" name="id" value="<%= u.getC()%>">
                                    <input type="hidden" name="Correo" value="<%=u.getCorreo()%>">
                                    <input type="hidden" name="Crit" value="En Proceso">
                                    <input type="submit" name="Fecha" value="Fecha" class="buttonEntregar">
                                </form>

                            </td>
                            <td data-column="Ver más"><br>
                                <form method="POST" action="Ver_RevicionCarta.jsp" >
                                    <input type="hidden" name="id" value="<%= u.getC()%>">
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


    <div class="flex-container2" id="tabla2" style="display:none;">
        <div class="fondo1">
            <table id="tablaDatos2">

                <thead>
                    <tr>

                        <th>Correo</th>
                        <th>Codigo </th> 
                        <th>Nombre </th> 
                        <th>Carrera</th> 
                        <th>Semestre</th> 
                        <th>Ciclo escolar</th>
                        <th>Motivo</th> 
                        <th>Estatus de carta no adeudo</th>
                        <th>Fecha de entrega</th>
                        <th>Esta completa la solicitud</th>
                        <th>Entregada</th> 
                        <th>Postergar la solicitud</th>
                        <th>Ver más</th>

                    </tr>
                </thead>
                <tbody>
                    <%     if (request.getAttribute("BR") != null) {
                            datos = (List<Usuarios>) request.getAttribute("BR");
                        } else if (request.getAttribute("RP") != null) {
                            datos = dao.EntregarCarta();
                        } else {
                            datos = dao.EntregarCarta();
                        }
                        for (Usuarios u : datos) {
                    %>  





                    <tr>

                        <td data-column="Correo:"><br><%= u.getCorreo()%></td>
                        <td data-column="Codigo:"> <br><%= u.getCod()%> </td>
                        <td data-column="Nombre:"><br> <%= u.getNom()%> </td>
                        <td data-column="Carrera:"><br> <%= u.getCar()%> </td>
                        <td data-column="Semestre"><br> <%= u.getSem()%> </td>
                        <td data-column="Ciclo"><br><%= u.getCiclo()%></td>
                        <td data-column="Motivo:"><br><%= u.getMotivo()%></td>
                        <td data-column="Estatus:"><br><%= u.getEstatus()%></td>
                        <td data-column="Fecha de Entrega"><br>
                            <%= u.getFecha_E()%>

                        </td>

                        <td data-column="Completada:"><br>
                            <form name="Usuario" method="POST" action="Usuario" >
                                <input type="hidden" name="Dia" value="<%= u.getFecha_E()%>">
                                <input type="hidden" name="id" value="<%= u.getC()%>">
                                <input type="hidden" name="Crit" value="Pasar Por ella">
                                <input type="hidden" name="Correo" value="<%= u.getCorreo()%>">
                                <%
                                    String Est = u.getEstatus();
                                    String a = "En Proceso";
                                    String b ="Fecha Postergada";
                                %>
                                <button <% if (Est.equals(a) || Est.equals(b)) { // 
                                        out.print("enabled"); // 
                                    } else {
                                        out.print("disabled");
                                    }%> type="submit" name="EntregarCartaAdeudo" value="EntregarCartaAdeudo" class="buttonEntregar">Marcar como lista</button>

                            </form>
                        </td>
                        <td data-column="Solicitud lista"><br>
                            <form name="Usuario" method="POST" action="Usuario" >
                                <input type="hidden" name="Dia" value="<%= u.getFecha_E()%>">
                                <input type="hidden" name="Correo" value="<%= u.getCorreo()%>">
                                <input type="hidden" name="id" value="<%= u.getC()%>">
                                <input type="hidden" name="Crit" value="Entregado">
                                <%
                                    Est = u.getEstatus();
                                    a = "Pasar Por ella";
                                    
                                %>
                                <button <% if (Est.equals(a)) { // 
                                        out.print("enabled"); // 
                                    } else {
                                        out.print("disabled");
                                    }%> type="submit" name="EntregarCartaAdeudo" value="EntregarCartaAdeudo" class="buttonEntregar">Marcar como entregada</button>

                            </form>
                        </td>

                        <td data-column="Postergar"><br>
                            <form name="Usuario" method="POST" action="Usuario" >
                                <input class="controls"  type="date" name="Dia" id="fecha" min="<%= LocalDate.now().plusDays(1).toString()%>"
                                       max="<%= LocalDate.now().plusDays(30).toString()%>" required>
                                <input type="hidden" name="id" value="<%= u.getC()%>">
                                 <input type="hidden" name="Correo" value="<%= u.getCorreo()%>">
                                <input type="hidden" name="Crit" value="Fecha Postergada">


                                <%
                                    Est = u.getEstatus();
                                    a = "En Proceso";
                                    b ="Fecha Postergada";
                                    String e = "Pasar Por ella";
                                %>
                                <button <% if (Est.equals(a) || Est.equals(e) || Est.equals(b)) { // 
                                        out.print("enabled"); // 
                                    } else {
                                        out.print("disabled");
                                    }%> type="submit" name="PostegarFecha" value="PostegarFecha" class="button1">Postegar Fecha</button> 

                            </form>
                        </td>
                        <td data-column="Ver más"><br>
                            <form method="POST" action="Ver_RevicionCarta.jsp" >
                                <input type="hidden" name="id2" value="<%= u.getC()%>">
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











    <script src="Js/BotonSwitch.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/v/dt/dt-1.13.6/b-2.4.1/b-html5-2.4.1/datatables.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="Js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/v/dt/jszip-3.10.1/dt-1.13.6/b-2.4.1/b-html5-2.4.1/date-1.5.1/datatables.min.js"></script>
    <script  src ="https://cdn.jsdelivr.net/npm/datatables-buttons-excel-styles@1.2.0/js/buttons.html5.styles.min.js " ></script> 
    <script  src = "https://cdn.jsdelivr.net/npm/datatables-buttons-excel-styles@1.2.0/js/buttons.html5.styles.templates.min.js" > </script >
        <script src="Js/Funciones.js"></script>

</body>
</html>