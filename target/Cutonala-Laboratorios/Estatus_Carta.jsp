<%-- 
    Document   : Estatus_Carta
    Created on : 10/04/2023, 02:14:36 PM
    Author     : netor
--%>

<%@page import="UML.Carta"%>
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
        <link rel="stylesheet" href="CSS/CSS.css">
        <link rel="stylesheet" href="//cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />
        <link rel="stylesheet" href="//cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js" />
    </head>
    <body>
        <%

            DAO_Usuario dao = new DAO_Usuario();
            List<Usuarios> datos = new ArrayList();
            HttpSession objesesion = request.getSession(false);
            String Correo;
            Correo = (String) objesesion.getAttribute("user");
            String Nombre;
            Nombre = (String) objesesion.getAttribute("Nombre");
            dao.Correo(Correo);
            int Nivel;
            Nivel = Integer.parseInt(objesesion.getAttribute("Nivel").toString());
            if (Nombre.equals("")) {
                response.sendRedirect("Login.jsp");
            } else if (Nivel != 1) {
                response.sendRedirect("Login.jsp");
            }

        %>


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
                            <label for="show-features1">Solicitudes</label>
                            <ul>
                                <li><a href="Eleccion_Material.jsp">Hacer una solicitud</a></li>
                                <li><a href="Solicitudes_individuales.jsp">Mis Solicitudes Pendientes</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="#" class="desktop-link">Carta de no adeudo</a>
                            <input type="checkbox" id="show-features2">
                            <label for="show-features2">Carta no adeudo</label>
                            <ul>
                             <li><a href="Solicitud_CartaNoAdeudo.jsp">Solicitar carta de no adeudo</a></li>    
                                 <li><a href="Estatus_Carta.jsp">Estatus de carta no adeudo</a></li>

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

    
      
      
            <center>
         <div class="flex-container1">
 <div class="fondo1">
        <table id="tablaDatos">
                    <thead>
                        <tr>
                            
                            <th>Fecha de la solicitud</th>
                            <th>Motivo</th>
                            <th>Ciclo escolar</th>
                            <th>Estatus</th>
                            <th>Fecha de entrega</th>
                            <th>Confirmacion</th>
                            <th>Cancelar</th>
                        </tr>
                    </thead>

   <tbody>

                    <%

                        if (request.getAttribute("BR") != null) {
                            datos = (List<Usuarios>) request.getAttribute("BR");
                        } else if (request.getAttribute("RP") != null) {
                            datos = dao.solicitudes_Carta(Correo);
                        } else {
                            datos = dao.solicitudes_Carta(Correo);
                        }
                        for (Usuarios s : datos) {
                    %>  


                 
                        <tr>
                          

                            <td data-column="Fecha:"><br><%= s.getFecha()%> </td>
                            <td data-column="Motivo:"><br><%= s.getMotivo()%></td>


                            <td data-column="Ciclo:"><br><%= s.getCiclo()%></td>
                            <td data-column="Estatus:"><br><%= s.getEstatus()%></td>
                            <td data-column="Fecha de entrega:"><br><%= s.getFecha_E()%></td>
                            <td data-column="Confirmacion"><br>
                                <form name="Usuario" method="POST" action="Usuario" >
                                    <input type="hidden" name="Codtxt" value="<%= s.getC()%>">
                                    <input type="hidden" name="Crit" value="Recibido">
                                    <%
                                        String Est = s.getEstatus();
                                        String a = "Pasar Por ella";
                                    %>
                                    <button <% if (Est.equals(a)) { // 
                                            out.print("enabled"); // 
                                        } else {
                                            out.print("disabled");
                                        } %> type="submit" name="Entrega" value="Entrega" class="button1">Marcar como recibida</button>

                                </form>
                            </td>
                             <td data-column="Cancelar">  <br>
                                <form name="Usuario" method="POST" action="Usuario" >
                                    <input class="button" type="hidden" name="id" value="<%= s.getC()%>">
                                    <%
                                        String sss = s.getEstatus();
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
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
       <script src="Js/Funciones.js"></script>
            </center>

        </main>

    </body>
</html>
