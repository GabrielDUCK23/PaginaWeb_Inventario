<%-- 
    Document   : Menu_Usuario
    Created on : 7/11/2022, 05:45:14 PM
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
            HttpSession objesesion = request.getSession(false);
            String Codigo;
            Codigo = (String) objesesion.getAttribute("user");
            String Nombre;
            Nombre = (String) objesesion.getAttribute("Nombre");

            int Nivel=0;
            Nivel = Integer.parseInt(objesesion.getAttribute("Nivel").toString());
            if (Nombre.equals("")) {
                response.sendRedirect("Login.jsp");
            } else if (Nivel != 1) {
                response.sendRedirect("Login.jsp");
            }

        %>
    <nabvar>
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
    </nabvar>

</body>
</html>















 
