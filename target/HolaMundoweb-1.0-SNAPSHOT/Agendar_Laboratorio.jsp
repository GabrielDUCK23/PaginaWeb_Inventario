<%-- 
    Document   : Agendar_Laboratorio
    Created on : 8/04/2023, 12:43:02 AM
    Author     : netor
--%>
<%@page import="Modelado.DAO_Laboratorio"%>
<%@page import="UML.Laboratorio"%>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
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
        <%   DAO_Laboratorio dao = new DAO_Laboratorio();
            List<Laboratorio> datos = new ArrayList();
            HttpSession objesesion = request.getSession(false);
            String Correo;
            Correo = (String) objesesion.getAttribute("user");
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
                        <li><a href="Editar_Profesores.jsp">Administrar Perfil</a></li>

                        <li>
                            <a href="#" class="desktop-link">Solicitudes</a>
                            <input type="checkbox" id="show-features">
                            <label for="show-features">Solicitudes</label>
                            <ul>
                                <li><a href="Seleccion_MaterialProfesores.jsp"> Hacer una Solicitud</a></li>
                                <li><a href="Solicitudes_Profesores.jsp">Mis Solicitudes</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="#" class="desktop-link">Agenda de Laboratorios</a>
                            <input type="checkbox" id="show-features1">
                            <label for="show-features1">Agenda de Laboratorios</label>
                            <ul>
                                <li><a href="Agendar_Laboratorio.jsp">Agendar Laboratorio</a></li>
                                <li><a href="Agenda_Individual.jsp">Visualizar Agenda </a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="#" class="desktop-link">Practicas Externas</a>
                            <input type="checkbox" id="show-features2">
                            <label for="show-features2">Practicas Externas</label>
                            <ul>
                                <li><a href="Practicas_Externas.jsp">Agregar Practica</a></li>
                                <li><a href="Vista_Practicas.jsp">Visualizar Practica </a></li>

                            </ul>
                        </li>
                        <li><a href="Login.jsp">Cerrar sesion</a></li>
                    </ul>
                </div>
            </nav>
        </div>
        <br><br>
        <br><br>
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


        <div class="container">
            <div class="left-panel">

                <section class="form-Solicitud">
                    <img class="ImgLogo" src="imagenes/CUTNEW.png" alt="logo"></a><br>

                    <div class="texto"> Agendar Laboratorio <br>

                        <form name="LaboratorioS" method="POST" action="LaboratorioS">

                            <% if (request.getAttribute("respuesta") != null) {%>
                            <div style="color: #ddd;"><%= request.getAttribute("respuesta")%></div>
                            <% }%>
                            <br>

                            <input class="controls"  type="hidden" name="Correo" id="correo" value="<%out.print(Correo);%>" readonly><br>
                            <label for="lab">Laboratorio:</label><br>

                            <select class="controls" type="select" name="Lab" id="lab" required>
                                <%
                                    if (request.getAttribute("BR") != null) {
                                        datos = (List<Laboratorio>) request.getAttribute("BR");
                                    } else if (request.getAttribute("RP") != null) {
                                        datos = dao.DatosLAb();
                                    } else {
                                        datos = dao.DatosLAb();
                                    }
                                    for (Laboratorio lab : datos) {
                                %>
                                <option value="<%= lab.getIdL()%>"><%= lab.getNom()%></option>
                                <%
                                    }
                                %>
                            </select><br>

                            <br>

                            <label for="fecha">Fecha:</label>
                            <input class="controls"  type="date" name="Dia" id="fecha" min="<%= LocalDate.now().plusDays(1).toString()%>"
                                   max="<%= LocalDate.now().plusDays(6).toString()%>" required>

                            <label for="horaInicio">Hora de inicio:</label>
                            <select class="controls"  name="hora_inicio" id="horaInicio" type="number" required>
                                <option>8:00 - 10:00 am</option>
                                <option>10:00 - 12:00 am/pm</option>
                                <option>12:00 - 2:00 pm</option>
                                <option>2:00 - 4:00 pm</option>
                                <option>4:00 - 6:00 pm</option>
                                <option>6:00 - 8:00</option> 
                            </select>


                            <br>

                            <input  type="submit" name="Agendar" value="Agendar" class="botons">

                        </form>
                    </div>
                </section>

            </div>
            <br>
            <br>


            <div class="right-panel">
                <br>
                       <div class="flex-container1">
            <div class="fondo1">


                    <table id="tablaDatos">

                        <thead>
                            <tr>
                                <th>Nombre de laboratorio</th>
                                <th>Dia de la solicitud</th>
                                <th>Hora</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                if (request.getAttribute("BR") != null) {
                                    datos = (List<Laboratorio>) request.getAttribute("BR");
                                } else if (request.getAttribute("RP") != null) {
                                    datos = dao.LabAgendados();
                                } else {
                                    datos = dao.LabAgendados();
                                }
                                for (Laboratorio r : datos) {
                            %>  


                            <tr>
                                <td data-column="Nombre:"><br><%= r.getNom()%></td>
                                <td data-column="Fecha"><br><%= r.getDia()%></td>
                                <td data-column="Hora inicio"><br><%= r.getHora_I()%> </td>  

                            </tr>

                                <% }%>
                        </tbody>
                    </table>
                         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
           <script src="Js/Funciones.js"></script>
                </div>
            </div>
            </div>

                </div>
            </div>
            <br>
            <br>
            <br>
            <br>
            </body>
            </html>