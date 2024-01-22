<%-- 
    Document   : Reportes_Encargados
    Created on : 23/08/2023, 03:54:33 AM
    Author     : netor
--%>

<%@page import="UML.Reportes"%>
<%@page import="Controlador.Reporte"%>
<%@page import="Modelado.DAO_Reportes"%>
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
        <link rel="stylesheet" href="CSS/CSS.css">

<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
       </head>
       <body class="fondo">
        <%
            DAO_Reportes dao = new DAO_Reportes();
            List<Reportes> datos = new ArrayList();
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
        <br><br><br>
 
   


                           

    
        <div class="flex-container">
            <div class="fondo1">
        <table id="tablaDatos"> 
        <thead>

            <tr>
                <th>Correo</th> 
                <th>Nombre de la practica</th> 
                <th>Laboratorio</th>
                <th>Especificaciones</th>
                <th>fecha de realización </th>
                <th>Hora en que comenzo la practica</th>
                <th>Hora en que termino la practica</th>
                <th>Archivo</th>
            </tr>
        </thead>

 <tbody>
        <%     if (request.getAttribute("BR") != null) {
                datos = (List<Reportes>) request.getAttribute("BR");
            } else if (request.getAttribute("RP") != null) {
                datos = dao.Encargados();
            } else {
                datos = dao.Encargados();
                
            }
            for (Reportes r : datos) {
        %>  

            <tr>
                 <td data-column="Correo:"><br> <%= r.getCorreo()%> </td>
                <td data-column="Nombre de la practica:"><br> <%= r.getNombre()%> </td>
                <td data-column="Laboratorio:"><br><%= r.getLab() %> </td>
                <td data-column="Especificaciones:"><br><%= r.getEsp()  %> </td>
                <td data-column="Fecha de realización: "><br><%= r.getFecha()%></td>
                <td data-column="Hora en que comenzo:"><br><%= r.getHora() %></td>
                <td data-column="Hora en que termino:"><br><%= r.getHoraS()%></td>
        <td data-column="Archivo PDF:"> <br>
 <%
                            if (r.getArchivopdf2() != null) {
                        %>
                        <a href="pdf?id=<%=r.getId()%>" target="_blank"><img src="imagenes/PDF.png" title="pdf" width="20%" height="30%"/></a>
                            <%
                                } else {
                                    out.print("Vacio");
                                }
                            %>
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
        <script src="Js/Funciones_Table.js"></script>

 <br>
     <br>

     
      <br>
     <br>
   
     </body>
</html>
