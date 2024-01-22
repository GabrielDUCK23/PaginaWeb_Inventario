<%-- 
    Document   : Vista_Solicitudes_Profesores
    Created on : 20 ene. 2024, 23:55:18
    Author     : netor
--%>

<%@page import="UML.Usuarios"%>
<%@page import="Modelado.DAO_Usuario"%>
<%@page import="java.util.List"%>
<%@page import="UML.Solicitud"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelado.DAO_Solicitud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menu</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link rel="stylesheet" href="CSS/Style.css">
        <link rel="stylesheet" href="//cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />
        <link rel="stylesheet" href="//cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js" />
    </head>
    <body>
        <%
            DAO_Solicitud dao = new DAO_Solicitud();
            DAO_Usuario daoU = new DAO_Usuario();
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


        <main>
     

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
 
    <br><br>
    
    <center>
        <table>
            <tbody>
                               <%
           int IDS = 0;
            String idParam = request.getParameter("IDS");
            if (idParam != null && !idParam.isEmpty()) {
                IDS = Integer.parseInt(idParam);
                // Resto del código que usa el valor de "id"
            }   
                            if (request.getAttribute("BR") != null) {
                                datos = (List<Solicitud>) request.getAttribute("BR");
                            } else if (request.getAttribute("RP") != null) {
                                datos = dao.VerMas(IDS);
                            } else {
                                datos = dao.VerMas(IDS);
                            }
                            for (Solicitud s : datos) {
                        %>  
          
                
                 <tr>
                    <td>Estatus:</td>
                    <td><%= s.getEstatus() %></td>
                </tr>
                <tr>
                    <td>Laboratorio</td>
                    <td><%= s.getLab()%></td>
                </tr>
                
                     <tr>
                    <td>Lugar:</td>
                    <td><%= s.getDepart()%><%= s.getDepart2()%></td>
                </tr>
                
                <tr>
                    <td>Asignatura:</td>
                    <td><%= s.getAsig()%></td>
                </tr>
                <tr>
                    <td>Responsable:</td>
                    <td><%= s.getRespon()%></td>
                </tr>
                <tr>
                    <td>Tipo:</td>
                    <td><%= s.getTipo()%></td>
                </tr>
                <tr>
                    <td>Descripcion:</td>
                    <td><%=replaceDotsWithNewlines(s.getDescr())%></td>
                                <%!
                                    public String replaceDotsWithNewlines(String input) {
                                        return input.replace(".", "<br>");
                                    }
                                %>
                </tr>
             
                <tr>
                    <td>Tiempo:</td>
                    <td><%= s.getTiempo()%></td>
                </tr>
                <tr>
                    <td>Fecha:</td>
                    <td> <%= s.getFecha()%></td>
                </tr>
                <tr>
                    <td>Hora:</td>
                    <td><%= s.getHora()%></td>
                </tr>
                 <tr>
                    <td>Fecha de Entrega:</td>
                    <td><%= s.getFecha_E()  %></td>
                </tr>
                 <tr>
                    <td>Hora de Entrega:</td>
                     <td> <%= s.getHora_E()%></td>
                               
                </tr>
                 <tr>
                    <td>Comentarios:</td>
                    <td><%= s.getCom() %></td>
                </tr>
              
                <tr>
                    <td>Entregar:</td>
                    <td>   <form name="Solicitudes" method="POST" action="Solicitudes" >
                                    <input class="button" type="hidden" name="id" value="<%= s.getId_S()%>">
                                    <%
                                        String sss = s.getEstatus();
                                        String a = "Material Disponible";
                                    %>
                                    <button <% if (sss.equals(a)) {
                                            out.print("enable");
                                        } else {
                                            out.print("disabled");
                                            }%> type="submit" name="Entregar_Profesores"  value="Entregar_Profesores"  class="buttonEntregar">Entregar</button>
                                </form></td>
                </tr> 
                <tr>
                    <td>Cancelar:</td> 
                    <td>  <form name="Solicitudes" method="POST" action="Solicitudes" >
                                    <input class="button" type="hidden" name="id" value="<%= s.getId_S()%>">
                                    <%
                                        a = "Pendiente";
                                        String e = "Material no Disponible";
                                    %>
                                    <button <% if (sss.equals(a) || sss.equals(e)) { // Se corrigió el operador lógico de 'sss.equals(a)  sss.equals(e)' a 'sss.equals(a) || sss.equals(e)'
                                            out.print("enabled"); // Se corrigió el valor de 'enable' a 'enabled'
                                        } else {
                                            out.print("disabled");
                                            } %> type="submit" name="Cancelar_Profesores" value="Cancelar_Profesores" class="buttonC">Cancelar</button>

                        </form></td>
                </tr>
             
                
                
                        
            
                
                <% }%>
            </tbody>
        </table>
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