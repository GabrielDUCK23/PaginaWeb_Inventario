
<%@page import="UML.Laboratorio"%>
<%@page import="Modelado.DAO_Laboratorio"%>
<%@page import="java.util.List"%>
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
            DAO_Materiales dao2 = new DAO_Materiales();
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
            } else if (Nivel != 3) {
                response.sendRedirect("Login.jsp");
            }
            String Material;
            String Tipo;
            Tipo = (String) objesesion.getAttribute("Tipo");
            Material = (String) objesesion.getAttribute("Material");
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
                    <li> <a href="Menu_Profesores.jsp"><img class="logo" src="imagenes/logo.png" alt="logo"></a></li>
                    <ul class="links">
                        <li> <a class="titulo"> Bienvenido <% out.println(Nombre);%></a> </li> 
                        <li><a href="Editar_Profesores.jsp">Administrar Perfil</a></li>

                        <li>
                            <a href="#" class="desktop-link">Solicitudes</a>
                            <input type="checkbox" id="show-features">
                            <label for="show-features">Solicitudes</label>
                            <ul>
                                <li><a href="Seleccion_MaterialProfesores.jsp"> Hacer una Solicitudes</a></li>
                                <li><a href="Solicitudes_Profesores.jsp">Solicitudes Pendientes</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="#" class="desktop-link">Agenda de Laboratorios</a>
                            <input type="checkbox" id="show-features1">
                            <label for="show-features1">Agenda de Laboratorios</label>
                            <ul>
                                <li><a href="Agendar_Laboratorio.jsp">Agendar Laboratorio</a></li>
                                <li><a href="Agenda_Individual.jsp">Visualizar Agendas </a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="#" class="desktop-link">Practicas Externas</a>
                            <input type="checkbox" id="show-features2">
                            <label for="show-features2">Practicas Externas</label>
                            <ul>
                                <li><a href="Practicas_Externas.jsp">Agregar practica</a></li>
                                <li><a href="Vista_Practicas.jsp">Visualizar practica </a></li>

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

            <img class="ImgLogo" src="imagenes/CUTNEW.png" alt="logo"></a><br>

            <meta name="viewport" content="width=device-width, initial-scale=1.0">    
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

                    <input class="controls" name ="Correo" type="text" value="<%= u.getCorreo()%>" hidden="" ><br>

                    <label class="texto" for="Laboratorio">Laboratorio </label> <br> <br>
                    <select class="controls" type="select" name="Id_Ltxt" id="lab" required>
                        <%
                            String Profesor = "Profesor: ";
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
                   
                    <select class="controls" type="select" name="Deptxt" id="Departamentos" placeholder="Ejemplo Departamento, Aula, Laboratorio ú Oficina ">
                        <option> - Selecciona una opcion - </option>
                        <option value="Aula">-Aula</option>
                        <option value="Laboratorio">-Laboratorio</option> 
                        <option value="Otro">-Otro</option>
                    </select>    <br>


                    <label class="texto" for="Departamento">Lugar donde estará.</label> <br> <br>
                    <input class="controls" type="text" name="des2" id="Depar" placeholder="Ejemplo: A201,Laboratorio de Quimica entre otros"><br> 


                    <label class="texto" for="Asignatuta">Asinatura</label> <br> <br>
                    <input class="controls" type="text" name="Asigtxt" id="Depar" placeholder="Asinatura">

                    <input class="controls" hidden type="text" name="Profe" id="Material"value="<%= Profesor + Nombre%>">

                    <label class="texto" for="Tiempo">indique cuanto tiempo tendra el material</label> <br> <br>
                    <input class="controls" type="text" name="tiempo" id="Num_Stxt" placeholder="Tiempo en el que usaras el material.">




                    <label class="texto" for="Describe">Describe el Material</label> <br> <br>
                    <textarea name="desc" readonly placeholder="Describe el Material" class="controlsMaterial"><% out.println("Material:" + Material); %></textarea>
                   
                    <label class="texto" for="tipo"> Tipo de Material:</label> <br>
                    <input name="tipo" value="<% out.println(Tipo); %>" readonly class="controls">



                    <br><input  type="submit" name="Insertar_Profesores" value="Crear" class="botons"><br>
                </div>

                <% }
                %>
            </form>
        </section>



    </body>
</html>