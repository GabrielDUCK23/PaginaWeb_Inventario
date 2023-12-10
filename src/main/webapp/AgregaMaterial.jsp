<%-- 
    Document   : AñadirMaterial
    Created on : 10/04/2023, 04:58:50 PM
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
     
        
        
        <section class="form-Alumnos">
                     <img class="ImgLogo" src="imagenes/CUTNEW.png" alt="logo"></a><br>
                     <h2 class="texto">Agregar material</h2>
            <form name="Material" method="POST" action="Material">


                <div class="texto">  <br>
                    <label for="Nombre">Nombre del material:</label> <br><br>
                    <input class="controls" type="text" name="Nom"  placeholder="Nombre del material" required>

                    <label for="Codigo">Marca</label> <br>
                    <br><input class="controls" type="text" name="Marca"  placeholder="Marca"required>

                    <label for="Nombre">Cantidad de producto</label> <br><br>
                    <input class="controls" type="text" name="Cantidad"  placeholder="Ingrese la Cantidad del producto."> 

                    <label for="Nombre">Lote: </label> <br><br>
                    <input class="controls" type="text" name="Lote"  placeholder="Lote"> 

                    <label for="Nombre">Clasificacacion</label> <br><br>
                    <input class="controls" type="text" name="Clas"  placeholder="Clasificacion"> 


                    <label for="Nombre">Formula</label> <br><br>
                    <input class="controls" type="text" name="For"  placeholder="Formula"> 
                    
                         <label for="Semestre">Selecion el tipo de material es:</label> <br><br>
                    <select class="controls" type="select" name="Tipo" id="Semestre" required>
                        <option>Selecciones el material</option>
                        <option value="Cristaleria">Cristaleria</option>
                        <option value="Reactivo">Reactivo</option>
                        <option value="Estrumentado">Estrumentado</option>

                    </select>
                            <label for="Nombre">Ingrese la numero de piezas:</label> <br><br>
                            <input class="controls" type="number" name="C_Total"  placeholder="Numero de piezas del material" required>

                    
                    <input  type="submit" name="btnInsertar" value="Agregar" class="botons">
                </div>
            </form>
               
                    </section>
                    </body>
                    </html>
