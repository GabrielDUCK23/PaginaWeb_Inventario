<%-- 
    Document   : Reportes
    Created on : 26/03/2023, 07:13:47 PM
    Author     : netor
--%>

<%@page import="UML.Laboratorio"%>
<%@page import="Modelado.DAO_Laboratorio"%>
<%@page import="java.util.List"%>
<%@page import="Modelado.DAO_Usuario"%>
<%@page import="Controlador.Usuario" %>
<%@page import= "java.util.*" %>
<%@page import="UML.Usuarios" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menu</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link rel="stylesheet" href="CSS/CSS.css">
    </head>
    <body>
        <%
             String Reporte = "Reporte de Laboratorio";
            DAO_Usuario dao = new DAO_Usuario();
            DAO_Laboratorio daoLab = new DAO_Laboratorio();
             List<Laboratorio> datosLab = new ArrayList();
            List<Usuarios> datos = new ArrayList();
            HttpSession objesesion = request.getSession(false);
            String Correo;
            String Nombre;
            Correo = (String) objesesion.getAttribute("user");
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
        <section class="form-Alumnos">
                     <img class="ImgLogo" src="imagenes/CUTNEW.png" alt="logo"></a><br>
                     <h2 class="texto">Agregar Reporte</h2>
            <br>

                   <form name="Reporte" method="POST" action="Reporte" enctype="multipart/form-data">
                   

        
                       <input name="Cotxt" value="<%= Correo %>" type="hidden"><br>
                        <label class="texto" for="Nombre">Nombre de la practica</label> <br>
                        <input class="controls" type="text" name="Nomtxt" id="nombres" placeholder="Ingrese su Nombre de la practica"><br> 

 
                    <label class="texto" for="Laboratorio">Laboratorio </label> <br> <br>
                  <select class="controls" type="select" name="labtxt" id="Semestre" placeholder="Laboratorio">
                        <option value="Fisica optica">Fisica optica</option>
                        <option value="Quimica">Quimica</option>
                        <option value="Nanotecnologia">Nanotecnologia</option>
                    </select><br>

                        <label class="texto" for="Especificaciones">Especificaciones de la practica</label> <br>
                        <input class="controls" type="text" name="txtEsp" id="esp" placeholder="Ingrese su Nombre de la practica"><br> 

                        <input class="controls" type="hidden" name="RM" value="<%= Reporte %>" id="esp"><br> 

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
        <% } %>
                    </div>          
              

            </form>

        </section>
                    </center>

    </body>
</html>