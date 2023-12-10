<%-- 
    Document   : Login
    Created on : 7/11/2022, 05:16:37 PM
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
    <link rel="stylesheet" href="CSS/CSS.css">


</head>
<body>


<center>
    <main>

        <div class="container__cover">
            <div class="cover">
                <div class="text">

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
                    <section class="form-Login" >
                        <form method="POST" action="Login"> 
                            <img class="ImgLogo" src="imagenes/CUTNEW.png" alt="logo"></a><br>
                       <span class="corner-text">Inicia Sesión</span><br>

                           
                            <input type="text" name="txtUser" class="controls" placeholder="Ingrese Correo" requierd>
                       
                             <div class="password-input">
                                 <input class="controls" type="password" name="txtPass" required  placeholder="Contraseña" id="password">
                            <i class="fa fa-eye-slash" aria-hidden="true" onclick="togglePasswordVisibility()"></i>
                        </div>

                        <script src="https://kit.fontawesome.com/your-kit-id.js" crossorigin="anonymous"></script>

                        <script>
                              function togglePasswordVisibility() {
                                  var passwordField = document.getElementById("password");
                                  var eyeIcon = document.querySelector(".password-inputt t");

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
                        <input type="submit" class="botons" name="accion" value="Iniciar Sesion"><br><br>


                            <a href="Registro.jsp">¿Aun no tienes cuenta? Regístrate</a><br>
                            <a href="Recuperacion_Password.jsp">¿Has olvidado tu contraseña?</a>


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
