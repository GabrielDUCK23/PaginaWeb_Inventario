<%-- 
    Document   : Editar_Profesores
    Created on : 8/04/2023, 12:27:01 AM
    Author     : netor
--%>
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
            DAO_Usuario dao = new DAO_Usuario();
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
        <section class="form-Alumnos">
                                        <img class="ImgLogo" src="imagenes/CUTNEW.png" alt="logo"></a><br>

                        <h2 class="texto">Actualizacion de datos</h2>
            <form name="Usuario" method="POST" action="Usuario">

                <%
                    if (request.getAttribute("BR") != null) {
                        datos = (List<Usuarios>) request.getAttribute("BR");
                    } else if (request.getAttribute("RP") != null) {
                        datos = dao.consultar(Correo);
                    } else {
                        datos = dao.consultar(Correo);
                    }
                    for (Usuarios u : datos) {
                %>

                <div class="texto">  <br>
                    <label for="Correo">Correo Electronico:</label> <br><br>
                    <input class="controls" type="text" name="Correo" value="<%= u.getCorreo()%>" placeholder="Correo Electronico" readonly>

                    <label for="Codigo">Codigo:</label> <br>
                    <br><input class="controls" type="number" name="Codtxt" value="<%= u.getCod()%>" placeholder="Ingrese su Codigo" min="100000000" max="999999999" readonly>

                    <label for="Nombre">Nombre:</label> <br><br>
                    <input class="controls" type="text" name="Nomtxt" value="<%= u.getNom()%>" placeholder="Ingrese su Nombre"> 

                    <label for="Carrera">Carrera:</label> <br><br>
                    <select class="controls" type="select" name="Cartxt" id="Carrera" placeholder="Ingrese su Carrera">
                        <option value="<%= u.getCar()%>"> <%= u.getCar()%> </option>
                        <option value="MUTT">MUTT - MAE EN MOVILIDAD URBANA Y TRANSPORTE</option>
                        <option value="MMOT">MMOT - MAE EN MOVI URBANA TRANS Y TERRRITORIO</option>
                        <option value="MGGL">MGGL - MAE EN GESTION DE GOBIERNOS LOCALES</option>
                        <option value="MCAE">MCAE - MAE EN CS EN ING DEL AGUA Y LA ENERGIA</option>
                        <option value="MATT">MATT - MAE EN MOV URBANA TRANSP Y TERRITORIO</option>
                        <option value="MIGA">MIGA - MAE EN CS EN ING DEL AGUA Y LA ENERGIA</option>
                        <option value="MAAE">MAAE - MAE EN ING DEL AGUA Y LA ENERGIA</option>
                        <option value="DDHU">DDHU - DOCT EN DERECHOS HUMANOS</option>
                        <option value="DOTT">DOTT - DOC EN MOV URBANA TRANSP Y TERRITORIO</option>
                        <option value="DAYE">DAYE - DOCT EN AGUA Y ENERGIA</option>
                        <option value="DAGE">DAGE - DOCT EN AGUA Y ENERGIA</option>
                        <option value="DERC">DERC - Abogado</option>
                        <option value="LNTO">LNTO - Licenciatura en Nutrición</option>
                        <option value="DECH">DECH - Abogado</option>
                        <option value="MBIO">MBIO - MAESTRIA EN BIOETICA</option>
                        <option value="MCIU">MCIU - Maestría en Ciencias de la Ciudad</option>
                        <option value="MCP">MCP - MEDICO CIRUJANO Y PARTERO</option>
                        <option value="MCPE">MCPE - Médico Cirujano y Partero</option>
                        <option value="CPU">CPU - Licenciatura en Contaduría Pública</option>
                        <option value="LIAN">LIAN - Licenciatura en Administración de Negocios</option>
                        <option value="CGTI">CGTI - Coordinación de Tecnologías</option>
                        <option value="NUT">NUT - Licenciatura en Nutrición</option>
                        <option value="PRUE">PRUE - Pruebas</option>
                        <option value="LISP">LISP - Licenciatura en Salud Pública</option>
                        <option value="LIEL">LIEL - Licenciatura en Estudios Liberales</option>
                        <option value="LIDA">LIDA - Licenciatura en Diseño de Artesanías</option>
                        <option value="DERR">DERR - Abogado</option>
                        <option value="ARQ">ARQ - Arquitectura</option>
                        <option value="ICCO">ICCO - Ingeniería en Ciencias Computacionales</option>
                        <option value="INAN">INAN - Ingeniería en Nanotecnología</option>
                        <option value="INEL">INEL - Ingeniería en Energía</option>
                        <option value="INEN">INEN - Ingeniería en Energía</option>
                        <option value="INGC">INGC - Ingeniería en Ciencias Computacionales</option>
                        <option value="LCOP">LCOP - Licenciatura en Contaduría Pública</option>
                        <option value="LESL">LESL - Licenciatura en Estudios Liberales</option>
                        <option value="LGER">LGER - Licenciatura en Gerontología</option>
                        <option value="LHAR">LHAR - Licenciatura en Historia del Arte</option>
                        <option value="DER">DER - Abogado</option>
                        <option value="LIAR">LIAR - Licenciatura en Arquitectura</option>
                        <option value="LICF">LICF - Licenciatura en Ciencias Forenses</option>
                        <option value="SEMS">SEMS - Sistema de Educación Media Superior</option>
                    </select>


                        <input name="Semtxt" value="0" hidden>
                    
                
                </div>

<label for="Contraseña">Contraseña:</label> <br><br>
<div class="password-input">
  <input class="controls" type="password" name="Pass" value="<%= u.getPassword()%>" placeholder="Contraseña" id="password">
  <i class="fa fa-eye-slash" aria-hidden="true" onclick="togglePasswordVisibility()"></i>
</div>

<script src="https://kit.fontawesome.com/your-kit-id.js" crossorigin="anonymous"></script>

<script>
function togglePasswordVisibility() {
  var passwordField = document.getElementById("password");
  var eyeIcon = document.querySelector(".password-input i");

  if (passwordField.type === "password") {
    passwordField.type = "text";
    eyeIcon.classList.remove("fa-eye-slash");
    eyeIcon.classList.add("fa-eye");
  } else {
    passwordField.type = "password";
    eyeIcon.classList.remove("fa-eye");
    eyeIcon.classList.add("fa-eye-slash");
  }
}
</script>

                <input  type="submit" name="Actualizar_Profesor" value="Actualizar" class="botons">


                <% }%>
            </form>
        </section>


    </body>
</html>