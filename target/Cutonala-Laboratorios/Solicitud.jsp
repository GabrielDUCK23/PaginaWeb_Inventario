<%-- 
    Document   : 22
    Created on : 15/11/2022, 09:07:40 PM
    Author     : netor
--%>





<%@page import="Modelado.DAO_Laboratorio"%>
<%@page import="UML.Laboratorio"%>
<%@page import="Modelado.DAO_Materiales"%>
<%@page import="UML.Materiales"%>
<%@page import="UML.Usuarios"%>
<%@page import="Modelado.DAO_Usuario"%>
<%@page import="Modelado.DAO_Solicitud"%>
<%@page import="Controlador.Solicitudes" %>
<%@page import= "java.util.*" %>
<%@page import="UML.Solicitud" %>
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
            DAO_Solicitud dao = new DAO_Solicitud();
            DAO_Laboratorio dao3 = new DAO_Laboratorio();
            List<Laboratorio> datos3 = new ArrayList();
            DAO_Usuario daoU = new DAO_Usuario();
            List<Materiales> datos2 = new ArrayList();
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
            } else if (Nivel != 1) {
                response.sendRedirect("Login.jsp");
            }

            String Material;
            String Tipo;
            Material = (String) objesesion.getAttribute("Material");
            Tipo = (String) objesesion.getAttribute("Tipo");
            if (Material.equals("")) {
                response.sendRedirect("Eleccion_Material.jsp");
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
                        <li><a href="Editar_Alumnos.jsp">Administrar Usuarios</a></li>

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



         <section class="form-Alumnos">


          
            <form name="Solicitudes" method="POST" action="Solicitudes"> 

   <%
                    if (request.getAttribute("BR") != null) {
                        datos = (List<Usuarios>) request.getAttribute("BR");
                    } else if (request.getAttribute("RP") != null) {
                        datos = daoU.consultar(Correo);
                    } else {
                        datos = daoU.consultar(Correo);
                    }
                    for (Usuarios u : datos) {
                %>  
                
              
                

                <div class="texto">
                                 <img class="ImgLogo" src="imagenes/CUTNEW.png" alt="logo"></a><br>

                      <input class="controls" name ="Correo" type="text" id="Codigo" value = "<%= u.getCorreo() %>" hidden><br>
                 
                   <label class="texto" for="Laboratorio">Laboratorio </label> <br> <br>
                    <select class="controls" type="select" name="Id_Ltxt" id="lab" required>
                        <%
                            if (request.getAttribute("BR") != null) {
                                datos3 = (List<Laboratorio>) request.getAttribute("BR");
                            } else if (request.getAttribute("RP") != null) {
                                datos3 = dao3.DatosLAb();
                            } else {
                                datos3 = dao3.DatosLAb();
                            }
                            for (Laboratorio lab : datos3) {
                        %>
                        <option value="<%= lab.getIdL()%>"><%= lab.getNom()%></option>
                        <%
                            }
                        %>
                    </select><br>


                    <label class="texto" for="Departamento">Ingrese donde estará el Material</label> <br> <br>
                    <select class="controls" type="select" required name="Deptxt" id="Departamentos">
                        <option value="Aula"> -Aula</option>
                        <option value="Laboratorio">-Laboratorio</option> 
                      
                    </select>    <br>


                    <label class="texto" for="Departamento">Lugar donde estará.</label> <br> <br>
                    <input class="controls" type="text" name="des2" id="Depar" required placeholder="Ejemplo: A201,Laboratorio de Quimica entre otros"><br> 


                    <label class="texto" for="Asignatuta">Ingrese la Asinatura</label> <br> <br>
                    <input class="controls" type="text" name="Asigtxt" id="Depar" placeholder="Asinatura" required>


                    <label class="texto" for="Profe">Maestro Responsable</label> <br> <br>
                    <input class="controls" type="text" name="Profe" id="Material" placeholder="Maestro Responsable" required>
                    
                <label class="texto" for="Tiempo">indique cuanto tiempo tendra el material</label> <br> <br>
                <input class="controls" type="text" name="tiempo" id="Num_Stxt" required placeholder="Tiempo en el que usaras el material.">


                    <label class="texto" for="Describe">Material Seleccionado:</label> <br> 
               <textarea name="desc" readonly placeholder="Describe el Material" required class="controlsMaterial"><% out.println(Material); %></textarea>
 
                    <label class="texto" for="tipo"> Tipo de Material:</label> <br>
                    <input name="tipo" value="<% out.println(Tipo); %>" readonly class="controls">



              

                 <br><input  type="submit" name="Insertar" value="Solicitar" class="botons"><br>
                </div>

<% } 
%>
            </form>
        </section>



    </body>
</html>