
<%@page import="UML.Laboratorio"%>
<%@page import="Modelado.DAO_Laboratorio"%>
<%@page import="UML.Usuarios"%>
<%@page import="Modelado.DAO_Usuario"%>
<%@page import="Modelado.DAO_Materiales"%>
<%@page import="Controlador.Material" %>
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
        String Codigo;
        Codigo = (String) objesesion.getAttribute("user");
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
                        <br><br>

    
    
     
               
                 <div class="container">
                   <div class="left-panel">
                       <section class="form-Solicitud" >
                                    <img class="ImgLogo" src="imagenes/CUTNEW.png" alt="logo"></a><br>
                                    <h4 class="texto">Registro de Laboratorio</h4>
                    <br>
                    <form name="LaboratorioVista" method="POST" action="LaboratorioS"> 
                          
                        <label class="texto" for="Laboratorio">Nombre del laboratorio</label> <br>
                            <input class="controls" type="text" name="Nomtxt" id="Nombre"   placeholder="Nombre de laboratorio">

                            <label class="texto" for="Correo">Correo del Encargado</label> <br>
                            <input class="controls" type="text" name="Encxt" id="Nombre" placeholder="Correo del encargado de laboratorio">

                            <input  type="submit" name="btnInsertarL" value="Crear" class="botons"<br>
                    </form>

                </section>
                   </div>
                     <br>
                     <br>
                     <br>
                   
                   <center>
 
                   <div class="right-panel">
                       <div class="flex-container3">
                            <div class="fondo1">
                <table id="tablaDatos">
               
                    <thead>
                          <tr>
                    <th>Id de Laboratorio </th>
                    <th>Nombre del Laboratorio </th> 
                    <th>Codigo del encargado</th>
                    <th>Nombre del Encargado</th> 
                          </tr>
                    </thead>
        <tbody>
                    <%
                        if (request.getAttribute("BR") != null) {
                            datos = (List<Laboratorio>) request.getAttribute("BR");
                        } else if (request.getAttribute("RP") != null) {
                            datos = dao.consultarGRL();
                        } else {
                            datos = dao.consultarGRL();
                        }
                         for (Laboratorio L : datos) {
                    %>  

                    
                                        <tr>
                                            <td data-column="Id de Laboratorio"><br>
                                                <%= L.getIdL()%>
                                               </td>
                                            <td data-column="Nombre"><br><%= L.getNom()%></td>
                                            <td data-column="Codigo del encargado:"><br><%= L.getEnca()%></td>
                                            <td data-column="Encargado"><br><%= L.getNomb_Enc()%></td>
                                         
                                        </tr>
                                      
                                     
                                    </tbody>

                    <%
                        }
                    %>

        </table>
                  
                            </div>
                   </div>
                   </div>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
          <script src="Js/Funciones.js"></script>
                    
                   </center>
</div>

               
</body>
</html>