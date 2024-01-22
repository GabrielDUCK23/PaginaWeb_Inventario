<%-- 
    Document   : ActualizarMaterial
    Created on : 10/04/2023, 06:16:08 PM
    Author     : netor
--%>


<%@page import="UML.Materiales"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Modelado.DAO_Materiales"%>
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

            DAO_Materiales dao = new DAO_Materiales();
            List<Materiales> datos = new ArrayList();
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
        <br><br>
   <%                   String respuesta = (String) request.getAttribute("respuesta");
            if (respuesta != null) {
        %>
        <script>
            window.onload = function () {
                alert("<%= respuesta%>");
            };
        </script>
        <%
            }
        %>


    <center>
        <%   int id = 0;
            String idParam = request.getParameter("id");
            if (idParam != null && !idParam.isEmpty()) {
                id = Integer.parseInt(idParam);
                // Resto del código que usa el valor de "id"
            }

            if (request.getAttribute("BR2") != null) {
                datos = (List<Materiales>) request.getAttribute("BR2");
            } else if (request.getAttribute("RP2") != null) {
                datos = dao.ActUsuarios(id);
            } else {
                datos = dao.ActUsuarios(id);
            }
            for (Materiales m2 : datos) {


        %> 

        <section class="form-Alumnos" >
            <form name="Material" method="POST" action="Material">
                <img class="ImgLogo" src="imagenes/CUTNEW.png" alt="logo"></a><br>
                     <h4 class="texto">Actualizar de Datos</h4>


                <label for="id">Id:</label> <br><br>
                <input class="controls" type="text" name="id" value="<%= m2.getId()%>"  placeholder="Id" readonly="">


                <label for="Nombre">Nombre del material:</label> <br><br>
                <input class="controls" type="text" name="Nom"  value="<%= m2.getNombre() %>"  placeholder="Nombre" >

                <label for="Codigo">Marca</label> <br>
                <br><input class="controls" type="text" name="Marca"  value="<%= m2.getMarca() %>"  placeholder="Marca">

                <label for="Cantidad">Cantidad de producto</label> <br><br>
                <input class="controls" type="text" name="Cantidad"  value="<%= m2.getCantidad()%>"  placeholder="Ingrese la Cantidad de producto"> 

                <label for="Lote">Lote: </label> <br><br>
                <input class="controls" type="text" name="Lote"  value="<%= m2.getLote() %>" placeholder="Lote"> 

                <label for="Clasificacion">Clasificacacion</label> <br><br>
                <input class="controls" type="text" name="Clas"  value="<%= m2.getClasificacion()%>"  placeholder="Clasificacion"> 


                <label for="Formula">Formula</label> <br><br>
                <input class="controls" type="text" name="For"  value="<%= m2.getFormula() %>" placeholder="Formula"> 

                <label for="Semestre">Selecion el tipo de material es:</label> <br><br>
                <select class="controls" type="select" name="Tipo" id="Semestre" >
                    <option  value="<%= m2.getTipo() %>">"<%= m2.getTipo()%>"</option>
                    <option value="Cristaleria">Cristaleria</option>
                    <option value="Reactivo">Reactivo</option>
                    <option value="Estrumentado">Estrumentado</option>

                </select>
                          <label for="Nombre">Catidad del material:</label> <br><br>
                          <input class="controls" type="number" name="C_Total"  value="<%= m2.getCantidad_Total() %>" required>

                <input  type="submit" name="btnActualizar" value="Actualizar" class="botons">
            </form>
                           <form action="ActualizarMaterial.jsp" method="POST">
            
                <input  type="submit" value="Volver" class="botons">

            </form>
                  
            <% }%>
           
        </section>
    </center>
 <br><br>






       <center>
    <div class="flex-container">
<div class="fondo1">
        <table id="tablaDatos">

            <thead>
                <tr>
                    <th>Seleccionar </th>
                    <th>Nombre </th>
                    <th>Marca</th>
                    <th>Cantidad</th>
                    <th>Lote</th> 
                    <th>Clasificacion</th>
                    <th>Formula</th>
                    <th>Tipo</th>
                    <th>Piezas</th>
                </tr>
            </thead>
             <tbody>
            <%                if (request.getAttribute("BR") != null) {
                    datos = (List<Materiales>) request.getAttribute("BR");
                } else if (request.getAttribute("RP") != null) {
                    datos = dao.consultarGRL();
                } else {
                    datos = dao.consultarGRL();
                }
                for (Materiales m : datos) {


            %> 


           
                <tr>
                    <td data-column="Seleccionar"><br>
                        <form  method="POST" action="ActualizarMaterial.jsp"> 
                            <input type="hidden" name="id" id="correoInput"  value="<%= m.getId() %>">
                            <button class="button1" type="submit" type="button" name="Consultar" value="Actualizar">Seleccionar</button>
                        </form>
                    </td>
                    <td data-column="Nombre:"><br><%= m.getNombre()%></td>
                    <td data-column="Marca:"><br><%= m.getMarca()%> </td>
                    <td data-column="Cantidad"><br><%= m.getCantidad()%></td>
                    <td data-column="Lote"><br> <%= m.getLote()%></td>

                    <td data-column="Clasificacion:"><br><%= m.getClasificacion()%></td>
                    <td data-column="Formula:"><br><%= m.getFormula()%></td>
                    <td data-column="Tipo:"><br><%= m.getTipo()%></td>
                    <td data-column="Piezas"><br><%= m.getCantidad_Total()%></td>



           
            <% }%>
 </tbody>
        </table>
</div>
    </div>
    </center>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="datatable/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/v/dt/jszip-3.10.1/dt-1.13.6/b-2.4.1/b-html5-2.4.1/date-1.5.1/datatables.min.js"></script>
    <script  src =" https://cdn.jsdelivr.net/npm/datatables-buttons-excel-styles@1.2.0/js/buttons.html5.styles.min.js " ></script> 
    <script  src = " https://cdn.jsdelivr.net/npm/datatables-buttons-excel-styles@1.2.0/js/buttons.html5.styles.templates.min.js " > </script >
     <script src="Js/Funciones.js"> </script>

    </div>


    <br> 
    <br>


</body>
</html>
