<%-- 
    Document   : Practicas_Externas
    Created on : 29/04/2023, 04:23:21 PM
    Author     : netor
--%>

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
            String Reporte = "Practica Externa";
            HttpSession objesesion = request.getSession(false);
            String Correo;
            Correo = (String) objesesion.getAttribute("user");
            String Nombre;
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
    <center>
        <section class="form-Alumnos">
            <img class="ImgLogo" src="imagenes/CUTNEW.png" alt="logo"></a><br>

            <h2 class="texto">Agregar Reporte</h2>
            <br>

            <form name="Reporte" method="POST" action="Reporte" enctype="multipart/form-data">


                <div class="texto">

                    <input name ="Cotxt" type="hidden" id="Codigo" value = "<%= Correo%>">

                    <label class="texto" for="Nombre">Nombre de la practica</label> <br>
                    <input class="controls" type="text" name="Nomtxt" id="nombres" placeholder="Ingrese su Nombre de la practica"><br> 

                    <label class="texto" for="Laboratorio">Laboratorio</label> <br>
                    <select class="controls" type="select" name="labtxt" id="Semestre" placeholder="Laboratorio">
                        <option value="Fisica optica">Fisica optica</option>
                        <option value="Quimica">Quimica</option>
                        <option value="Nanotecnologia">Nanotecnologia</option>
                    </select><br>

                    <label class="texto" for="Especificaciones">Especificaciones de la practica</label> <br>
                    <input class="controls" type="text" name="txtEsp" id="esp" placeholder="Ingrese su Nombre de la practica">


                    <input class="controls" type="hidden" name="RM" value="Practicas Externas" id="esp"><br> 

                    <label class="date" for="Fecha de la practica">Fecha de la practica</label> <br>
                    <input class="controls" type="date" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}"  name="fc" id="esp" placeholder="Fecha de la practica"><br> 

                    <label class="time" for="Hora de Entrada">Hora de Entrada</label> <br>
                    <input class="controls" type="time" name="HE" id="esp" step="1" placeholder="Hora de Entrada"><br> 


                    <label class="time" for="Hora de Salida">Hora de Salida</label> <br>
                    <input class="controls" type="time" name="HS" step="1" id="esp" placeholder="Hora de Salida"><br> 
                    <label class="time" for="Hora de Salida">¿Quieres Compartirlo con los encargados de laboratorios?</label> <br>
                     <select class="controls" type="select" name="Permitir" id="Semestre" placeholder="Semestre que Cursa">
                        <option>No</option>
                        <option>Si</option>
                       

                    </select>
                    <input type="file" name="Archivo" maxlength="2097152">

                    <input type="submit" name="archivo" value="archivo" class="botons">
                    <% if (request.getAttribute("error") != null) {%>
                    <div class="error">
                        <%= request.getAttribute("error")%>
                    </div>
                    <% }%>
                </div>          


            </form>

        </section>
    </center>
</body>
</html>
