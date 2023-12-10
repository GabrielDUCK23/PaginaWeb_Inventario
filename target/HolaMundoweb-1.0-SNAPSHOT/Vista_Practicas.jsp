<%-- 
    Document   : Vista_Practicas
    Created on : 29/04/2023, 04:52:55 PM
    Author     : netor
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelado.DAO_Reportes"%>
<%@page import="UML.Reportes"%>
<%@page import="java.util.List"%>
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
        <br><br><br>
        <br><br>
        <br><br>

         <%    String dato = request.getParameter("id");
           if (request.getAttribute("BR") != null) {
                datos = (List<Reportes>) request.getAttribute("BR");
            } else if (request.getAttribute("RP") != null) {
                datos = dao.ConsultarID(dato);
            } else {
                datos = dao.ConsultarID(dato);
                
            }
            for (Reportes r2 : datos) {
        %>  
        <section class="form-Alumnos">
                     <img class="ImgLogo" src="imagenes/CUTNEW.png" alt="logo"></a><br>
                     <h2 class="texto">Agregar Reporte</h2>
            <br>

                   <form name="ActualizarReporte" method="POST" action="ActualizarReporte" enctype="multipart/form-data">
                   

         <input type="hidden" name="id" id="correoInput" value="<%= r2.getId() %>">
                       <input name="Cotxt" value="<%= Correo %>" type="hidden"><br>
                        <label class="texto" for="Nombre">Nombre de la practica</label> <br>
                        <input class="controls" type="text" name="Nomtxt" id="nombres" value="<%= r2.getNombre() %>"placeholder="Ingrese su Nombre de la practica"><br> 

 
                    <label class="texto" for="Laboratorio">Laboratorio </label> <br> <br>
                  <select class="controls" type="select" name="labtxt" id="Semestre" placeholder="Laboratorio">
                         <option value="Fisica optica">="<%= r2.getLab() %>"</option>
                      <option value="Fisica optica">Fisica optica</option>
                        <option value="Quimica">Quimica</option>
                        <option value="Nanotecnologia">Nanotecnologia</option>
                    </select><br>

                        <label class="texto" for="Especificaciones">Especificaciones de la practica</label> <br>
                        <input class="controls" type="text" name="txtEsp" id="esp" value="<%= r2.getEsp()%>"placeholder="Ingrese su Nombre de la practica"><br> 

                        <input class="controls" type="hidden" name="RM" value="Reporte" id="esp"><br> 

                        <label class="date" for="Fecha de la practica">Fecha de la practica</label> <br>
                        <input class="controls" type="date" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}"  name="fc" id="esp" placeholder="Fecha de la practica"><br> 

                        <label class="time" for="Hora de Entrada">Hora de Entrada</label> <br>
                        <input class="controls" type="time" name="HE" id="esp" step="1" placeholder="Hora de Entrada"><br> 


                        <label class="time" for="Hora de Salida">Hora de Salida</label> <br>
                        <input class="controls" type="time" name="HS" step="1" id="esp" placeholder="Hora de Salida"><br>
                         <label>Compartir con los Encargados de laboratorio:</label> <br><br>
                    <select class="controls" type="select" name="Permitir" id="Semestre" placeholder="Semestre que Cursa">
                        <option>No</option>
                        <option>Si</option>
                       

                    </select>

                          <input type="file" name="Archivo" maxlength="2097152">
                            
                        <input type="submit" name="archivo" value="archivo" class="botons">
                          <% if(request.getAttribute("error") != null) { %>
            <div class="error">
                <%= request.getAttribute("error") %>
            </div>
      
                    </div>          
               <% } %>
<% } %>
            </form>

        </section>


<center>


             

    
   <div class="flex-container2">
 <div class="fondo1">

        <table id="tablaDatos"> 
        
        <thead>

            <tr>
                 <th>Actualizar</th> 
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
                datos = dao.consultar(Correo);
            } else {
                datos = dao.consultar(Correo);
                
            }
            for (Reportes r : datos) {
        %>  


            <tr>
 <td data-column="Actualizar:">
     <form action="Vista_Practicas.jsp" method="POST">
                                    <input type="hidden" name="id" id="correoInput" value="<%= r.getId() %>">
                                    <button  type="submit" class="button1" type="button">Actualizar</button>
                                </form> </td>
                <td data-column="Nombre de la practica:"> <br><%= r.getNombre()%> </td>
                <td data-column="Laboratorio:"><br><%= r.getLab() %> </td>
                <td data-column="Especificaciones:"><br><%= r.getEsp()  %> </td>
                <td data-column="Fecha de realización: "><br><%= r.getFecha()%></td>
                <td data-column="Hora en que comenzo:"><br><%= r.getHora() %></td>
                <td data-column="Hora en que termino:"><br><%= r.getHoraS()%></td>     
              <td data-column="Archivo PDF:"><br> 
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






    </table>
             <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
       <script src="Js/Funciones_Table.js"></script>
            
   
</center>
</body>
</html>