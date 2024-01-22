<%-- 
    Document   : VerMas_Solicitud
    Created on : 27/04/2023, 01:18:18 AM
    Author     : netor
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelado.DAO_Solicitud"%>
<%@page import="UML.Solicitud"%>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalDate"%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menu</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link rel="stylesheet" href="CSS/Style.css">
    </head>
    <body>
        <%    DAO_Solicitud dao = new DAO_Solicitud();
            List<Solicitud> datos = new ArrayList();
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
                            
                                <li><a href="Revision_CartaNoAdeudo.jsp">Carta de no adeudo</a></li>
                                

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
         <br><br>
        <br><br>

 <center>
        <table>
            <tbody>
                <%   int id2 = 0;
            String idParam2 = request.getParameter("id2");
            if (idParam2 != null && !idParam2.isEmpty()) {
                id2 = Integer.parseInt(idParam2);
                // Resto del código que usa el valor de "id"
            }    
                    
                    if (request.getAttribute("BR") != null) {
                        datos = (List<Solicitud>) request.getAttribute("BR");
                    } else if (request.getAttribute("RP") != null) {
                        datos = dao.VerMas(id2);
                    } else {
                        datos = dao.VerMas(id2);
                    }
                    for (Solicitud s : datos) {
                %>
          
                 <td data-column="Seleccionar">
                     <form  method="POST" action="Entregar_Material.jsp"> 
                        <input type="hidden" name="id" id="correoInput"  value="<%= s.getId_S()%>">
                        <button class="buttonEntregar" type="submit" type="button" name="Consultar" value="Actualizar">Seleccionar</button>
                    </form>
               
                <tr>
                    <td>Correo:</td>
                    <td><%= s.getCorreo()%></td>
                </tr>
                
                     <tr>
                    <td>Codigo:</td>
                    <td><%= s.getCodigo()%></td>
                </tr>
                
                <tr>
                    <td>Nombre Usuario:</td>
                    <td><%= s.getNombre()%></td>
                </tr>
                <tr>
                    <td>Carrera:</td>
                    <td><%= s.getCarrera() %></td>
                </tr>
                <tr>
                    <td>Perfil de usuario:</td>
                    <td><%= s.getCarrera() %></td>
                </tr>
                <tr>
                    <td>Semestre:</td>
                    <td><%= s.getSem() %></td>
                </tr>
             
                <tr>
                    <td>Laboratorio:</td>
                    <td><%= s.getLab()  %></td>
                </tr>
                <tr>
                    <td>Departamento:</td>
                    <td><%= s.getDepart()%> <%= s.getDepart2()%></td>
                </tr>
                <tr>
                    <td>Asignatura:</td>
                    <td><%= s.getAsig() %></td>
                </tr>
                 <tr>
                    <td>Tipo:</td>
                    <td><%= s.getTipo()%></td>
                </tr>
                 <tr>
                    <td>Descripcion:</td>
                     <td> <%=replaceDotsWithNewlines(s.getDescr())%></td>
                               
                </tr>
                 <tr>
                    <td>Tiempo:</td>
                    <td><%= s.getTiempo()%></td>
                </tr>
                <tr>
                    <td>Profesor Responsable:</td>
                    <td><%= s.getRespon()%></td>
                </tr>
                <tr>
                    <td>Fecha:</td>
                    <td><%= s.getFecha()%></td>
                </tr>
                <tr>
                    <td>Hora:</td>
                    <td><%= s.getHora()%></td>
                </tr>
                <tr>
                    <td>Fecha de Entrega:</td>
                    <td><%= s.getFecha_E()%></td>
                </tr>
                 <tr>
                    <td>Hora de Entrega:</td>
                    <td><%= s.getHora_E()%></td>
                </tr>
                <tr>
                    <td>Comentarios:</td>
                    <td><%= s.getCom()%></td>
                </tr>
                  
            
                
                <% }%>
            </tbody>
        </table>
    </center>

    
    
    
    
    
    
    
    
    
    
    
    
    <center>
        <table>
            <tbody>
                <%   int id = 0;
            String idParam = request.getParameter("id");
            if (idParam != null && !idParam.isEmpty()) {
                id = Integer.parseInt(idParam);
                // Resto del código que usa el valor de "id"
            }    
                    
                    if (request.getAttribute("BR") != null) {
                        datos = (List<Solicitud>) request.getAttribute("BR");
                    } else if (request.getAttribute("RP") != null) {
                        datos = dao.VerMas(id);
                    } else {
                        datos = dao.VerMas(id);
                    }
                    for (Solicitud s : datos) {
                %>
                 <tr>
                  <td>Seleccionar</td>
                  <td>
                    <form  method="POST" action="RevisionMaterial.jsp"> 
                        <input type="hidden" name="id" id="correoInput"  value="<%= s.getId_S()%>">
                        <button class="buttonEntregar" type="submit" type="button" name="Consultar" value="Actualizar">Seleccionar</button>
                    </form>
                  </td>
                 </tr>
                <tr>
                    <td>Correo:</td>
                    <td><%= s.getCorreo()%></td>
                </tr>
                 <tr>
                    <td>Codigo:</td>
                    <td><%= s.getCodigo()%></td>
                </tr>
                <tr>
                    <td>Nombre Usuario:</td>
                    <td><%= s.getNombre()%></td>
                </tr>
                <tr>
                    <td>Carrera:</td>
                    <td><%= s.getCarrera() %></td>
                </tr>
                <tr>
                    <td>Perfil de usuario:</td>
                    <td><%= s.getPer()  %></td>
                </tr>
                <tr>
                    <td>Semestre:</td>
                    <td><%= s.getSem() %></td>
                </tr>
             
                <tr>
                    <td>Laboratorio:</td>
                    <td><%= s.getLab()  %></td>
                </tr>
                <tr>
                    <td>Departamento:</td>
                    <td><%= s.getDepart()%> <%= s.getDepart2()%></td>
                </tr>
                <tr>
                    <td>Asignatura:</td>
                    <td><%= s.getAsig() %></td>
                </tr>
                 <tr>
                    <td>Tipo:</td>
                    <td><%= s.getTipo()%></td>
                </tr>
                 <tr>
                    <td>Descripcion</td>
                    <td><%=replaceDotsWithNewlines(s.getDescr())%></td>
                </tr>
                 <tr>
                    <td>Tiempo:</td>
                    <td><%= s.getTiempo()%></td>
                </tr>
                <tr>
                    <td>Profesor Responsable:</td>
                    <td><%= s.getRespon()%></td>
                </tr>
                <tr>
                    <td>Fecha:</td>
                    <td><%= s.getFecha()%></td>
                </tr>
                <tr>
                    <td>Hora:</td>
                    <td><%= s.getHora()%></td>
                </tr>
                <tr>
                    <td>Fecha de Entrega:</td>
                    <td><%= s.getFecha_E()%></td>
                </tr>
                 <tr>
                    <td>Hora de Entrega</td>
                    <td><%= s.getHora_E()%></td>
                </tr>
                <tr>
                    <td>Comentarios:</td>
                    <td><%= s.getCom()%></td>
                </tr>
                  
            
                
                <% }%>
            </tbody>
        </table>
    </center>
            
            <center>
        <table>
            <tbody>
                <%   int id3 = 0;
            String idParam3 = request.getParameter("id3");
            if (idParam3 != null && !idParam3.isEmpty()) {
                id3 = Integer.parseInt(idParam3);
                // Resto del código que usa el valor de "id"
            }    
                    
                    if (request.getAttribute("BR") != null) {
                        datos = (List<Solicitud>) request.getAttribute("BR");
                    } else if (request.getAttribute("RP") != null) {
                        datos = dao.VerMas(id3);
                    } else {
                        datos = dao.VerMas(id3);
                    }
                    for (Solicitud s : datos) {
                %>
          
                 <td data-column="Id">
                     <form  method="POST" action="Solicitudes_Usuarios.jsp"> 
                        <input type="hidden" name="id" id="correoInput"  value="<%= s.getId_S()%>">
                        <button class="buttonEntregar" type="submit" type="button" name="Consultar" value="Actualizar"><%= s.getId_S()%></button>
                    </form>
                
                <tr>
                    <td>Correo</td>
                    <td><%= s.getCorreo()%></td>
                </tr>
                  <tr>
                    <td>Codigo:</td>
                    <td><%= s.getCodigo()%></td>
                </tr>
                <tr>
                    <td>Nombre Usuario:</td>
                    <td><%= s.getNombre()%></td>
                </tr>
                <tr>
                    <td>Carrera:</td>
                    <td><%= s.getCarrera() %></td>
                </tr>
                <tr>
                    <td>Perfil de usuario:</td>
                    <td><%= s.getPer()  %></td>
                </tr>
                <tr>
                    <td>Semestre:</td>
                    <td><%= s.getSem() %></td>
                </tr>
             
                <tr>
                    <td>Laboratorio:</td>
                    <td><%= s.getLab()  %></td>
                </tr>
                <tr>
                    <td>Departamento:</td>
                    <td><%= s.getDepart()%> <%= s.getDepart2()%></td>
                </tr>
                <tr>
                    <td>Asignatura</td>
                    <td><%= s.getAsig() %></td>
                </tr>
                 <tr>
                    <td>Tipo:</td>
                    <td><%= s.getTipo()%></td>
                </tr>
                 <tr>
                    <td>Descripcion</td>
                    <td><%=replaceDotsWithNewlines(s.getDescr())%></td>
                     <%!
                                    public String replaceDotsWithNewlines(String input) {
                                        return input.replace(".", "<br>");
                                    }
                                %>
                </tr>
                 <tr>
                    <td>Tiempo</td>
                    <td><%= s.getTiempo()%></td>
                </tr>
                <tr>
                    <td>Profesor Responsable</td>
                    <td><%= s.getRespon()%></td>
                </tr>
                <tr>
                    <td>Fecha</td>
                    <td><%= s.getFecha()%></td>
                </tr>
                <tr>
                    <td>Hora</td>
                    <td><%= s.getHora()%></td>
                </tr>
                <tr>
                    <td>Fecha de Entrega</td>
                    <td><%= s.getFecha_E()%></td>
                </tr>
                 <tr>
                    <td>Hora de Entrega</td>
                    <td><%= s.getHora_E()%></td>
                </tr>
                <tr>
                    <td>Comentarios</td>
                    <td><%= s.getCom()%></td>
                </tr>
                  
            
                
                <% }%>
            </tbody>
        </table>
    </center>
    
    
            <br><br><br><br><br><br><br><br>
           

    
    
    </body>
</html>
