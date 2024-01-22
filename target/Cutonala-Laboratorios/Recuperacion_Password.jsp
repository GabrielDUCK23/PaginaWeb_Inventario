<%-- 
    Document   : Recuperacion_Password
    Created on : 6/04/2023, 01:41:11 PM
    Author     : netor
--%>
<%-- 
    Document   : prueba
    Created on : 14/11/2022, 02:55:32 PM
    Author     : netor
--%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Landing Page Servicio Digital - MagtimusPro</title>

    <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="CSS/CSS.css"/>

   


</head>
<body>

 <%                   String respuesta = (String) request.getAttribute("respuesta");
            if (respuesta != null) {
        %>
        <script>
            window.onload = function () {
                alert("<%= respuesta%>");
            };
        </script>
        <%
            }
        %>
<center>
    <main>

        <div class="container__cover">
            <div class="cover">
                <div class="text">


                    <center>
                    <section class="form-Login" >
                        <h2>Recuperacion de Contraseña</h2><br>
                        <% if (request.getAttribute("respuesta") != null) {%>
                        <div style="color: #f9f9f9;"><%= request.getAttribute("respuesta")%></div>
                        <% }%>
                        <form name="Usuario" method="POST" action="Usuario">
                            <label for="correo">Correo electrónico:</label>
                            <input class="controls" type="text"  name="Correo" required placeholder="Ingresa tu Correo">
                            <label for="correo">Codigo de Usuario(SIIAU)</label>
                            <input class="controls" type="number"  name="Codigo" placeholder="Ingresa tu Codigo" required><br>
                            <input  type="submit" name="Recuperar" value="Recuperar Contraseña" class="botons">
                            
                            <a href="Login.jsp">¿Recuerdas tu contraseña? Inicia sesion!</a><br><br>
                            <a href="Registro.jsp">       ¿Aun no tienes cuenta? Regístrate!        </a><br>
                            <br>
                        </form>
               
                    </section>
                    </center>

                </div>

            </div>
        </div>

    </main>
</center>



<script src="js/script.js"></script>
</body>
</html>
