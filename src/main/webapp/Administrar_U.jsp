
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
        <title>Usuarios Laboratorio</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link rel="stylesheet" href="CSS/CSS.css">
        <link rel="stylesheet" href="//cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="//cdn.datatables.net/buttons/1.7.1/css/buttons.dataTables.min.css">
        <link href="https://cdn.datatables.net/v/dt/jszip-3.10.1/dt-1.13.6/b-2.4.1/b-html5-2.4.1/date-1.5.1/datatables.min.css" rel="stylesheet"

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
        <br><br>



        <!-- servlet -->


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


        <%    String dato = request.getParameter("id");
            if (request.getAttribute("BR1") != null) {
                datos = (List<Usuarios>) request.getAttribute("BR1");
            } else if (request.getAttribute("RP1") != null) {
                datos = dao.consultar(dato);
            } else {
                datos = dao.consultar(dato);
            }
            for (Usuarios u2 : datos) {
        %> 


    <center>
        <section class="form-Alumnos" id="formulario" >
            <form name="Usuario" method="POST" action="Usuario">

                        <img class="ImgLogo" src="imagenes/CUTNEW.png" alt="logo"></a><br>
                        <h4 class="texto">Actualizacion</h4>




                <div class="texto">  <br>
                    <label for="Correo">Correo Electronico:</label> <br><br>
                    <input class="controls" type="text" name="Correo" id="Correo" placeholder="Correo Electronico" value="<%= u2.getCorreo()%>" readonly>
                    <label for="Codigo">Codigo:</label> <br>
                    <br><input class="controls" type="number" name="Codtxt" value="<%= u2.getCod()%>" placeholder="Ingrese su Codigo" >
                    <label for="Nombre">Nombre:</label> <br><br>
                    <input class="controls" type="text" name="Nomtxt"  placeholder="Ingrese su Nombre" value="<%= u2.getNom()%>"  >           
                    <label for="Carrera">Carrera:</label> <br><br>
                    <select class="controls" type="select" name="Cartxt" id="Carrera" placeholder="Ingrese su Carrera" >
                        <option value="<%= u2.getCar()%>"><%= u2.getCar()%></option>
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
                    <label for="Pefil">Perfil de Usuario:</label> <br><br>
                    <select class="controls" type="select" name="Pertxt" id="Perfil" >
                        <option value="<%= u2.getPer()%>"><%= u2.getPer()%></option>
                        <option>Alumnos</option>
                        <option>Encargado Laboratorio</option>
                        <option>Maestro</option>

                    </select>
                    <label for="Semestre">Semestre que Cursa:</label> <br><br>
                    <select class="controls" type="select" name="Semtxt" id="Semestre" placeholder="Semestre que Cursa">
                        <option value="<%= u2.getSem()%>">1</option>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>

                    </select>


                    <label for="Nivel">Tipo de usuario:</label> <br><br>
                    <select class="controls" type="select" name="Nivel" id="Nivel" placeholder="Nivel de Usuario">
                        <option value="<%= u2.getNivel()%>" >Que usuario es: <%= u2.getNivel()%> </option>
                        <option value="1">Alumnos e investigadores</option>
                        <option value="3">Maestros</option>
                        <option value="2">Encargado de laboratorios</option>
                    </select>
                    <label for="Contraseña">Contraseña:</label> <br><br>
                    <div class="password-input">
                        <input class="controls" type="password" name="Pass" value="<%= u2.getPassword()%>" placeholder="Contraseña" id="password">
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


                    <input  type="submit" name="btnActualizar" value="Actualizar" class="botons">
                </div>
            </form>
            <form action="Administrar_U.jsp" method="POST">
            
                <input  type="submit" value="Volver" class="botons">

            </form>
        </section>
    </center>

    <% }%>
    <br><br>







    <center>
        <div class="flex-container1">
            <div class="fondo1">
                <table id="tablaDatos" class="responsive" >
                    <thead>

                        <tr>

                            <th>Correo Electronico</th>
                            <th>Codigo </th> 
                            <th>Nombre </th>
                            <th>Carrera</th> 
                            <th>Perfil</th> 
                            <th>Semestre</th> 
                            
                        </tr>

                    </thead>
                    <tbody>
                        <%         if (request.getAttribute("BR") != null) {
                                datos = (List<Usuarios>) request.getAttribute("BR");
                            } else if (request.getAttribute("RP") != null) {
                                datos = dao.consultarGRL();
                            } else {
                                datos = dao.consultarGRL();
                            }
                            for (Usuarios u : datos) {
                        %> 

                        <tr>
                            <td data-column="Correo"><br>

                                <form action="Administrar_U.jsp" method="POST">
                                    <input type="hidden" name="id" id="correoInput" value="<%= u.getCorreo()%>">
                                    <button  type="submit" class="button1" type="button"><%= u.getCorreo()%></button>
                                </form>

                            </td>
                            <td data-column="Codigo:"><br><%= u.getCod()%></td>
                            <td data-column="Nombre"><br><%= u.getNom()%></td>
                            <td data-column="Carrera"><br><%= u.getCar()%> </td>
                            <td data-column="Perfil"><br> <%= u.getPer()%></td>
                            <td data-column="Semestre"><br><%= u.getSem()%></td>


                        </tr>


                            <% }%>
                    </tbody>
                </table>


            </div>
        </div>
    </center>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/v/dt/dt-1.13.6/b-2.4.1/b-html5-2.4.1/datatables.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="datatable/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/v/dt/jszip-3.10.1/dt-1.13.6/b-2.4.1/b-html5-2.4.1/date-1.5.1/datatables.min.js"></script>
    <script  src ="https://cdn.jsdelivr.net/npm/datatables-buttons-excel-styles@1.2.0/js/buttons.html5.styles.min.js " ></script> 
    <script  src = "https://cdn.jsdelivr.net/npm/datatables-buttons-excel-styles@1.2.0/js/buttons.html5.styles.templates.min.js" > </script >
                <script src="Js/Funciones.js"></script>


        <br>
 <br>



    
    </body>
</html>