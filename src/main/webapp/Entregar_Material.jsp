<%-- 
    Document   : Entregar
    Created on : 23/11/2022, 11:36:15 PM
    Author     : netor
--%>

<%-- 
    Document   : Edit_Ma
    Created on : 13/11/2022, 02:30:32 PM
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
        <link rel="stylesheet" href="//cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />
        <link rel="stylesheet" href="//cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js" />
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




        <br> 
        <br>
    <center>
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


        <section class="form-Solicitud" >
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
            <%  }%>
        </section>
    </center>



    <center>
        <div class="flex-container">
            <div class="fondo1">
                <table id="tablaDatos">
                    <thead>
                        <tr>
                            <th>Seleccionar </th>
                            <th>Codigo Usuario </th>
                            <th>Id del Laboratorio</th>
                            <th>Departamento donde se encuentra</th>
                            <th>Asignatura</th>
                            <th>Responsable</th>
                            <th>Tipo</th>
                            <th>Descripcion</th>
                            <th>Fecha de la solictud</th>
                            <th> Hora de la solictud </th>
                            <th>Fecha de entrega</th>
                            <th>fecha de entrega</th> 
                            <th>Comentarios</th>
                            <th>Estatus</th>  
                            <th>Ver más</th>
                        </tr>


                    </thead>

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

                            <form  method="POST" action="Entregar_Material.jsp"> 
                                <input type="hidden" name="id" id="correoInput"  value="<%= s.getId_S()%>">
                                <button class="button1" type="submit" type="button" name="Consultar" value="Actualizar">Seleccionar</button>
                            </form>
                        </td>
                        <td data-column="Correo"><br> <%= s.getCorreo()%> </td>
                        <td data-column="Laboratorio"><br>  <%= s.getId_L()%> </td>

                        <td data-column="Lugar "><br> <%= s.getDepart()%> <%= s.getDepart2()%></td>
                        <td data-column="Asignatura"><br> <%= s.getAsig()%> </td>
                        <td data-column="Responsable"><br> <%= s.getRespon()%></td>

                        <td data-column="Tipo"><br> <%= s.getTipo()%></td>
                        <td data-column="Descripcion"><br> <%= s.getDescr()%></td>


                        <td data-column="Fecha"><br> <%= s.getFecha()%></td>
                        <td data-column="Hora"><br> <%= s.getHora()%></td>
                        <td data-column="Fecha Entrega"><br> <%= s.getFecha_E()%></td>
                        <td data-column="Hora Entrega"><br> <%= s.getHora_E()%></td>
                        <td data-column="Comentarios"><br> <%= s.getCom()%></td>


                        <td data-column="Estatus"><br> <%= s.getEstatus()%></td>
                        <td data-column="Ver más"><br> 
                            <form method="POST" action="Ver_Solicitud.jsp" >
                                <input type="hidden" name="id2" value="<%= s.getId_S()%>">
                                <button type="submit" class="button1">Ver Más </button>
                            </form>

                        </td>


                    </tr>


                    <%
                        }
                    %>
                </table>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
        <script src="Js/Funciones.js"></script>


    </div>

</center>

</body>
</html>