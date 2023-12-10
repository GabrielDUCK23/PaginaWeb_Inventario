

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
        <link rel="stylesheet" href="//cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />
        <link rel="stylesheet" href="//cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js" />
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
                                <li><a href="Entregar_Material.jsp">Entrega de material</a></li> 
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
                            <a href="#" class="desktop-link">Carta de no adeudo</a>
                            <input type="checkbox" id="show-features3">
                            <label for="show-features3">Carta de no adeudo</label>
                            <ul>
                                <li><a href="Revision_CartaNoAdeudo.jsp">Revision de carta de no adeudo</a></li>
                                <li><a href="EntregaCarta.jsp">Entrega de carta de no adeudo</a></li>

                            </ul>

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
        <br><br>
        <br><br>
    <center>

        <br><br>
        <div class="flex-container2">
    <div class="fondo1">
            <table id="tablaDatos">

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

                        <td data-column="Correo:"><br><%= u.getCor()%></td>
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
                                <input type="hidden" name="Codtxt" value="<%= u.getC()%>">
                                <input type="hidden" name="Crit" value="Pasar Por ella">
                                <input type="hidden" name="Codtxt" value="<%= u.getC()%>">
                                <%
                                    String Est = u.getEstatus();
                                    String a = "Por Entregar";
                                %>
                                <button <% if (Est.equals(a)) { // 
                                        out.print("enabled"); // 
                                    } else {
                                        out.print("disabled");
                                    }%> type="submit" name="EntregarCartaAdeudo" value="EntregarCartaAdeudo" class="buttonEntregar">Marcar como lista</button>

                            </form>
                        </td>
                        <td data-column="Solicitud lista"><br>
                            <form name="Usuario" method="POST" action="Usuario" >
                                <input type="hidden" name="Codtxt" value="<%= u.getC()%>">
                                <input type="hidden" name="Crit" value="Entregado">
                                <%
                                    Est = u.getEstatus();
                                    a = "Recibido";
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
                                <input type="hidden" name="Codtxt" value="<%= u.getC()%>">
                                <input type="hidden" name="Crit" value="Por Entregar">


                                <%
                                    Est = u.getEstatus();
                                    a = "Por Entregar";
                                    String e = "Pasar Por ella";
                                %>
                                <button <% if (Est.equals(a) || Est.equals(e)) { // 
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
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
                 <script src="Js/Funciones.js"></script>


        </div>




        <br> <br> <br> <br>
        <br> <br> <br> <br>
        <br> <br> <br> <br>
        <br> <br> <br> <br>
        </body>
        </html>