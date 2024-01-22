<%-- 
    Document   : Registro_SuperUsuario
    Created on : 24/04/2023, 02:39:12 PM
    Author     : netor
--%>
<%@page import="UML.Usuarios"%>
<%@page import="Modelado.DAO_Usuario"%>
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
    </head>
    <body>
        <%    DAO_Usuario dao = new DAO_Usuario();
            List<Usuarios> datos = new ArrayList();
            List<Usuarios> datos2 = new ArrayList();
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
        <br><br>        <br>

  
    <center>
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

        <section class="form-Alumnos" id="formulario" >
            <form name="Usuario" method="POST" action="Usuario">
                                            <img class="ImgLogo" src="imagenes/CUTNEW.png" alt="logo"></a><br>

            
                <div class="texto">  <br>
                    <label for="Correo">Correo Electronico:</label> <br><br>
                    <input class="controls" type="text" name="Correo" id="Correo" placeholder="Correo Electronico" required>
                    
                    <label for="Codigo">Codigo:</label> <br>
                    <br><input class="controls" type="text" name="Codtxt" placeholder="Ingrese su Codigo" maxlength="9" minlength="7" pattern="[0-9]{7,9}" title="El código debe tener entre 7 y 9 dígitos numéricos" required>

                    <label for="Nombre">Nombre:</label> <br><br>
                    <input class="controls" type="text" name="Nomtxt"  placeholder="Ingrese su Nombre" required>  
                    
                    <label for="Carrera">Seleccione la Carrera:</label> <br><br>
                    <select class="controls" type="select" name="Cartxt" id="Carrera" placeholder="Ingrese su Carrera" >
                        <option value='Maestro'>Maestro</option>
                        <option value='Encargado de laboratorio'>Encargado de laboratorio</option>
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
                    <label for="Pefil">Seleccione el perfil del usuario:</label> <br><br>
                    <select class="controls" type="select" name="Pertxt" id="Perfil" >
                        <option>Profesor/a</option>
                        <option>Encargado Laboratorio</option>
                        <option value="Estudiante">Alumnos o investigadores</option>

                    </select>
                    <label for="Semestre">Seleccione el Semestre:</label> <br><br>
                    <select class="controls" type="select" name="Semtxt" id="Semestre" placeholder="Semestre que Cursa">
                        <option value="0">Maestro/Encargado</option>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                        <option>11</option>
                        <option>12</option>
                        

                    </select>
                  
                    <label for="Contraseña">Contraseña:</label> <br><br>
                    <div class="password-input">
                        <input class="controls" type="password" name="Pass"  placeholder="Contraseña" id="password" required>
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

                    <input  type="submit" name="admInsertar" value="Crear" class=" botons">

                </div>
            </form>

        </section>
    </center>
</body>
</html>
