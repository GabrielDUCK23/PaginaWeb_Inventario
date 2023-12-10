<%-- 
    Document   : Agendar_Individual
    Created on : 17/04/2023, 01:25:28 PM
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
       <div class="flex-container5">
            <div class="fondo1">

        <table id="tablaDatos">

                    <thead>
                        <tr>
                            <th>Nombre de laboratorio</th> 
                            <th>Dia de la solicitud</th> 
                            <th>Hora</th> 
                            <th>Cancelar</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        if (request.getAttribute("BR") != null) {
                            datos = (List<Laboratorio>) request.getAttribute("BR");
                        } else if (request.getAttribute("RP") != null) {
                            datos = dao.AgendaIndividual(Correo);
                        } else {
                            datos = dao.AgendaIndividual(Correo);
                        }
                        for (Laboratorio r : datos) {
                    %>  

                    
                        <tr>
                            <td data-column="Nombre:"><br><%= r.getNombre_Lab()%></td>
                            <td data-column="Fecha"><br><%= r.getDia()%></td>
                            <td data-column="Hora"><br><%= r.getHora_I()%> </td>  
                            <td data-column="Cancelar">  <br>
                                <form name="LaboratorioS" method="POST" action="LaboratorioS" >
                                    <input type="hidden" name="id" value="<%= r.getId_R()%>">
                                    <button type="submit" name="Cancelar" value="Cancelar" class="buttonCancelar">Cancelar</button>


                                </form>
                            </td>
                        </tr>
                                <% }
%>
                    </tbody>
                </table>
                    
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
      <script src="Js/Funciones_Table.js"></script>


    </div>
       </div>

         
                            <br>
                     <br>
                      <br>
                       <br>
    </body>
</html>
