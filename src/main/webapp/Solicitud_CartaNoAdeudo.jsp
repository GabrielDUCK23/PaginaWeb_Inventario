


<%@page import="UML.Solicitud"%>
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
            List<Solicitud> datos2 = new ArrayList();
            HttpSession objesesion = request.getSession(false);
            String Correo;
            String Nombre;
            String Mensaje;
            Correo = (String) objesesion.getAttribute("user");
            Nombre = (String) objesesion.getAttribute("Nombre");
            int Nivel;
            Nivel = Integer.parseInt(objesesion.getAttribute("Nivel").toString());
            if (Nombre.equals("")) {
                response.sendRedirect("Login.jsp");
            } else if (Nivel != 1) {
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
                    <li> <a href="Menu_Alumnos.jsp"><img class="logo" src="imagenes/logo.png" alt="logo"></a></li>
                    <ul class="links">
                        <li> <a class="titulo"> Bienvenido <% out.println(Nombre);%></a> </li> 
                        <li><a href="Editar_Alumnos.jsp">Administrar Perfil</a></li>

                        <li>
                            <a href="#" class="desktop-link">Solicitudes</a>
                            <input type="checkbox" id="show-features1">
                            <label for="show-features1">Solicitar</label>
                            <ul>
                                <li><a href="Eleccion_Material.jsp">Solicitar material de laboratorio</a></li>
                                <li><a href="Solicitud_CartaNoAdeudo.jsp">Solicitar carta de no adeudo</a></li>  
                               

                            </ul>
                        </li>
                         <li><a href="Solicitudes_individuales.jsp">Mis Solicitudes Pendientes</a></li>
                        
                                 <!-- <li><a href="Estatus_Carta.jsp">Estatus de carta no adeudo</a></li> -->

                           
           
                        
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
        <div class="container">
            <div class="left-panel">
                <section class="form-Alumnos">
                    <img class="ImgLogo" src="imagenes/CUTNEW.png" alt="logo"></a><br>
                    <h4>Comprueba que tus Datos esten Correctos</h4>
                    <form name="Usuario" method="POST" action="Usuario">  
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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


                        <div class="texto">
                            <label class="texto" for="cod">Codigo</label> <br>
                            <input class="controls" name ="Codtxt" type="number" id="Codigo" value = "<%= u.getCod()%>" readonly><br>
                            <label class="texto" for="Nom">Nombre</label> <br>
                            <input class="controls" type="text" name="Nomtxt" id="nombres" value=" <%= u.getNom()%> " placeholder="Ingrese su Nombre" readonly><br> 
                            <label class="texto" for="carrera">Carrera</label>
                            <select class="controls" type="select" name="Cartxt" id="Carrera" value="<%= u.getCar()%>"  placeholder="Ingrese su Carrera"readonly><br>
                                <option value=""> <%= u.getCar()%> </option>

                            </select><br>

                            <label class="texto" for="Perfil">Perfil</label> <br>
                            <select class="controls" type="select" name="Pertxt" id="Perfil" value=" <%= u.getPer()%> " placeholder="Ingrese su Perfil" readonly>
                                <option> <%= u.getPer()%> </option>
                            </select>
                            <label class="texto" for="Semestre">Semestre</label> <br>
                            <select class="controls" type="select" name="Semtxt" value=" <%= u.getSem()%> " id="Semestre" placeholder="Semestre que Cursa" readonly >
                                <option> <%= u.getSem()%></option>
                            </select><br>
                            <label class="texto" >Correo</label> <br>
                            <input class="controls" type="text" name="Correo" value="<%= u.getCorreo()%>" id="Correo" placeholder="Correo" readonly><br>
                            <input name ="Crit" value="Pendiente" type="hidden">

                            <label class="texto" >Ciclo Escolar</label> <br>
                            <input class="controls" type="text" name="Ciclo" required  id="Correo" placeholder="Ciclo" ><br>


                        </div>
                        <label class="texto" for="Motivo">Motivo</label> <br>
                        <select class="controls" type="select" name="Mot" id="Perfil" placeholder="Ingrese su Perfil" readonly>
                            <option value="Baja Voluntaria"> Por baja voluntaria</option>
                            <option value="Titulacion"> Titulacion </option>
                        </select>


                        <%
                            Mensaje = "Tienes solicitudes pendiendes";
                            boolean deshabilitarBoton = true;

                            // variable para determinar si se debe deshabilitar el botón
                            boolean esEntregado = dao.Validar_botton(Correo);
                            boolean esCanceladoOEntregadoONoHayRegistros = dao.Validar_botton2(Correo);

                            // Verificar las condiciones para deshabilitar el botón
                            if (esEntregado && esCanceladoOEntregadoONoHayRegistros) {
                                deshabilitarBoton = false;
                                Mensaje = "Puedes hacer tu solicitud";

                            }
                        %>

                        <button <% if (deshabilitarBoton) {
                                out.print("disabled");
                            } else {
                                out.print("enabled");
                            }%> type="submit" name="Carta" value="Carta" class="botons"> Solicitar</button>

                </section>
            </div>
            <div class="right-panel">
                <section class="form-Alumnos">

                    <%


                    %>  



                    <label class="texto" for="cod">Estatus de solicitud</label> <br>
                    <input class="controls" type="text" name="Nomtxt" id="nombres" value=" <% out.print(Mensaje);%> " placeholder="No has solicitado ninguna carta" readonly><br> 


                </section>




                <%
                    }

                %>
            </div>

    </body>
</html>