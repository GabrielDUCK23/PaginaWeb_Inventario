<%-- 
    Document   : RevisionMaterial
    Created on : 18/04/2023, 01:08:47 AM
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
        <link rel="stylesheet" href="CSS/CSS.css">
        <link rel="stylesheet" href="//cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="//cdn.datatables.net/buttons/1.7.1/css/buttons.dataTables.min.css">
        <link href="https://cdn.datatables.net/v/dt/jszip-3.10.1/dt-1.13.6/b-2.4.1/b-html5-2.4.1/date-1.5.1/datatables.min.css" rel="stylesheet"
    </head>
    <body>
        <%
            DAO_Solicitud dao = new DAO_Solicitud();
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
                <button type="button" id="boton1" class="toggle-btn" onclick="moveToLeft()">Revision de solicitudes</button>
                <button type="button" id="boton2" class="toggle-btn" onclick="moveToRight()">Recepción de material</button>
            </div>
        </div>        </center>
    <br><br>

    <br>
    <center>
        <%            int id2 = 0;
            String idParam2 = request.getParameter("id2");
            if (idParam2 != null && !idParam2.isEmpty()) {
                id2 = Integer.parseInt(idParam2);
                // Resto del código que usa el valor de "id"
            }

            if (request.getAttribute("BR1") != null) {
                datos = (List<Solicitud>) request.getAttribute("BR1");
            } else if (request.getAttribute("RP1") != null) {
                datos = dao.Consultarid(id2);
            } else {
                datos = dao.Consultarid(id2);
            }
            for (Solicitud s2 : datos) {
        %> 

        <section class="form-Solicitud" id="for2">
            <img class="ImgLogo" src="imagenes/CUTNEW.png" alt="logo"></a><br>
            <h4>Entrega de material</h4>

            <form name="Solicitudes" method="POST" action="Solicitudes"> 
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <input class="controls" type="text" name="Id" id="Id" value="<%= s2.getId_S()%>" placeholder="Id de la Solicitud"><br>
                <select class="controls" type="select" name="Estatus" id="Estatus" >
                    <option readonly >Estatus</option>
                    <option value="Entregado"> Material Completo y en buen estado.</option>
                    <option value="Material incompleto"> Material incompleto o en mal estado.</option>
                </select>
                <textarea name="Com" placeholder="Cometarios o descripcion" cols="" class="controls" ></textarea><br>

                <input  type="submit" name="EntregarMaterial" value="Actualizar" class=" botons">

            </form>
            <form action="RevisionMaterial.jsp" method="POST">

                <input  type="submit" value="Volver" class=" botons">
            </form>
            <%  }%>
        </section>
    </center>

    <%   int id = 0;
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            id = Integer.parseInt(idParam);
            // Resto del código que usa el valor de "id"
        }

        if (request.getAttribute("BR1") != null) {
            datos = (List<Solicitud>) request.getAttribute("BR1");
        } else if (request.getAttribute("RP1") != null) {
            datos = dao.Consultarid(id);
        } else {
            datos = dao.Consultarid(id);
        }
        for (Solicitud s2 : datos) {
    %> 



    <center>
        <section class="form-Solicitud" id="for1">
            <img class="ImgLogo" src="imagenes/CUTNEW.png" alt="logo"></a><br>

            <h4 class="texto">Revision de solicitud pendiente</h4>



            <form name="Solicitudes" method="POST" action="Solicitudes"> 
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <input class="controls" type="text" name="Id" id="Id" readonly value="<%= s2.getId_S()%>" placeholder="Id de la Solicitud"><br>

                <select class="controls" type="select" name="Estatus" id="Estatus" >
                    <option readonly >Estatus</option>
                    <option value="Material Disponible"> Contamos con el material que el usuario requiere.</option>
                    <option value="Material no Disponible"> No Contamos con el material que el usuario requiere.</option>
                </select>
                <textarea name="Com" placeholder="Cometarios o descripcion" cols="" class="controls" ></textarea><br>

                <input  type="submit" name="EntregarMaterial" value="Enviar" class=" botons">

            </form>
            <form action="RevisionMaterial.jsp" method="POST">
                <input  type="submit" value="Volver" class=" botons">
            </form>
            <% } %>
        </section>
    </center>




    <center>
        <div class="flex-container3"  id="tabla1">
            <div class="fondo1">
                <table id="tablaDatos">

                    <thead>
                        <tr>
                            <th>Seleccionar </th>
                            <th>Correo Usuario </th> 
                            <th>Laboratorio</th>
                            <th>Departamento donde se encuentra</th>
                            <th>Asignatura</th>
                            <th>Responsable</th>
                            <th>Tipo</th>
                            <th>Descripcion</th>
                            <th>Fecha de la solictud</th>
                            <th>Hora de la solictud </th> 
                            <th>Estatus</th>
                            <th>Ver más</th>
                        </tr>


                    </thead>
                    <tbody>

                        <%

                            if (request.getAttribute("BR") != null) {
                                datos = (List<Solicitud>) request.getAttribute("BR");
                            } else if (request.getAttribute("RP") != null) {
                                datos = dao.ConsultaGralEspecifica1();
                            } else {
                                datos = dao.ConsultaGralEspecifica1();
                            }
                            for (Solicitud s : datos) {
                        %>  

                        <tr>
                            <td data-column="Id">
                                <form  method="POST" action="RevisionMaterial.jsp"> 
                                    <input type="hidden" name="id" id="correoInput"  value="<%= s.getId_S()%>">
                                    <button class="button1" type="submit" type="button" id="boton1" name="Consultar" value="Actualizar">Seleccionar</button>
                                </form>

                            </td>
                            <td data-column="Correo"><%= s.getCorreo()%> </td>
                            <td data-column="Laboratorio"> <%= s.getLab()%> </td>

                            <td data-column="Lugar "> <%= s.getDepart()%> <%= s.getDepart2()%></td>
                            <td data-column="Asignatura"><%= s.getAsig()%> </td>
                            <td data-column="Responsable"><%= s.getRespon()%></td>

                            <td data-column="Tipo"><%= s.getTipo()%></td>
                            <td data-column="Descripcion"><br> <%=replaceDotsWithNewlines(s.getDescr())%></td>
                               
                            <td data-column="Fecha"><%= s.getFecha()%></td>
                            <td data-column="Hora"><%= s.getHora()%></td>

                            <td data-column="Estatus"><%= s.getEstatus()%></td>

                            <td data-column="Ver más">
                                <form method="POST" action="Ver_Solicitud.jsp" >
                                    <input type="hidden" name="id" value="<%= s.getId_S()%>">
                                    <button type="submit" class="button1">Ver Más </button>
                                </form>

                            </td>


                        </tr>


                    </tbody>

                    <%
                        }
                    %>
                </table>
            </div>
        </div>
    </center>

    <center>

        <div class="flex-container3" id="tabla2" style="display:none;">
            <div class="fondo1">
                <table id="tablaDatos2">
                    <thead>
                        <tr>
                            <th>Seleccionar </th>
                            <th>Codigo Usuario </th>
                            <th>Laboratorio</th>
                            <th>Departamento</th>
                            <th>Asignatura</th>
                            <th>Responsable</th>
                            <th>Tipo</th>
                            <th>Descripcion</th>  
                            <th>Hora de entrega</th> 
                            <th>Fecha de entrega</th>
                            <th>Comentarios</th>
                            <th>Estatus</th>  
                            <th>Ver más</th>
                        </tr>


                    </thead>
                    <tbody>
                        <%
                            if (request.getAttribute("BR") != null) {
                                datos = (List<Solicitud>) request.getAttribute("BR");
                            } else if (request.getAttribute("RP") != null) {
                                datos = dao.ConsultaGralEspecifica();
                            } else {
                                datos = dao.ConsultaGralEspecifica();
                            }
                            for (Solicitud s : datos) {
                        %>  



                        <tr>
                            <td data-column="Id"><br> 

                                <form method="POST" action="RevisionMaterial.jsp">                       
                                    <input type="hidden" name="id2" id="correoInput"  value="<%= s.getId_S()%>">
                                    <button class="button1" type="submit" type="button" name="Consultar" value="Actualizar">Seleccionar</button>
                                </form>
                            </td>
                            <td data-column="Correo"><br> <%= s.getCorreo()%> </td>
                            <td data-column="Laboratorio"><br>  <%= s.getId_L()%> </td>

                            <td data-column="Lugar "><br> <%= s.getDepart()%> <%= s.getDepart2()%></td>
                            <td data-column="Asignatura"><br> <%= s.getAsig()%> </td>
                            <td data-column="Responsable"><br> <%= s.getRespon()%></td>

                            <td data-column="Tipo"><br> <%= s.getTipo()%></td>


                              <td data-column="Descripcion"><br> <%=replaceDotsWithNewlines(s.getDescr())%></td>
                                <%!
                                    public String replaceDotsWithNewlines(String input) {
                                        return input.replace(".", "<br>");
                                    }
                                %>

                            <td data-column="Fecha Entrega"><br> <%= s.getFecha_E()%></td>
                            <td data-column="Hora Entrega"><br> <%= s.getHora_E()%></td>
                            <td data-column="Comentarios"><br> <%= s.getCom()%></td>


                            <td data-column="Estatus"><br> <%= s.getEstatus()%></td>
                            <td data-column="Ver más"><br> 
                                <form method="POST" action="Ver_Solicitud.jsp" >
                                    <input type="hidden" name="id2" value="<%= s.getId_S()%>">
                                    <button type="submit" id="boton2" class="button1">Ver Más </button>
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


    <script src="Js/DataTable.js">
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="datatable/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/v/dt/jszip-3.10.1/dt-1.13.6/b-2.4.1/b-html5-2.4.1/date-1.5.1/datatables.min.js"></script>
    <script  src =" https://cdn.jsdelivr.net/npm/datatables-buttons-excel-styles@1.2.0/js/buttons.html5.styles.min.js " ></script> 
<script  src = " https://cdn.jsdelivr.net/npm/datatables-buttons-excel-styles@1.2.0/js/buttons.html5.styles.templates.min.js " > </script>
        <script src="Js/Funciones_Table.js"> </script>
        

</body>
</html>