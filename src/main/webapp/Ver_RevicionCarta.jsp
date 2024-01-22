<%-- 
    Document   : VerMas_CartaAdeudo
    Created on : 25/04/2023, 11:20:53 PM
    Author     : netor
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="UML.Usuarios"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Modelado.DAO_Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menu</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link rel="stylesheet" href="CSS/Style.css">
    </head>
    <body>
        <%    DAO_Usuario dao = new DAO_Usuario();
            List<Usuarios> datos = new ArrayList();
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
                                <li><a href="EditarSuperUsuario.jsp">Editar usuario Propio</a></li>


                            </ul>
                        </li>
                        <li>
                            <a href="#" class="desktop-link">Solicitudes</a>
                            <input type="checkbox" id="show-features1">
                            <label for="show-features1">Solicitudes</label>
                            <ul>

                                <li><a href="RevisionMaterial.jsp">Revision de solicitudes pendiente</a></li>
                                <li><a href="Entregar_Material.jsp">Entrega de material</a></li> 
                                <li><a href="Solicitudes_Usuarios.jsp">Todas las Solicitudes</a></li>


                            </ul>
                        </li>


                        <li>
                            <a href="#" class="desktop-link">Reportes</a>
                            <input type="checkbox" id="show-features6">
                            <label for="show-features6">Reportes</label>
                            <ul>
                                <li><a href="Reportes.jsp">Reportes</a></li>
                                <li><a href="#">Visualizar Reportes</a></li>


                            </ul>
                        </li>


                        <li>
                            <a href="#" class="desktop-link">Laboratorio</a>
                            <input type="checkbox" id="show-features2">
                            <label for="show-features2">Laboratorio</label>
                            <ul>
                                <li><a href="Registro_Laboratorios.jsp">Registro de Laboratorios</a></li>
                                <li><a href="Actualizacion_Laboratorios.jsp">Actalizar Laboratorios</a></li>
                                <li><a href="Revision_Agenda.jsp">Revision de agenda de laboratorios</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="#" class="desktop-link">Carta de no adeudo</a>
                            <input type="checkbox" id="show-features3">
                            <label for="show-features3">Carta de no adeudo</label>
                            <ul>
                                <li><a href="Revision_CartaNoAdeudo.jsp">Revision de carta de no adeudo</a></li>
                                <li><a href="EntregaCarta.jsp">Entrega de carta de no adeudo</a></li>

                            </ul>

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
        <br><br>
        <br><br>
        <br><br>
        <br><br>

    <center>
        <table>
            <tbody>
                <%   int id2 = 0;
                    String idParam2 = request.getParameter("id2");
                    if (idParam2 != null && !idParam2.isEmpty()) {
                        id2 = Integer.parseInt(idParam2);
                        // Resto del código que usa el valor de "id"
                    }

                    if (request.getAttribute("BR") != null) {
                        datos = (List<Usuarios>) request.getAttribute("BR");
                    } else if (request.getAttribute("RP") != null) {
                        datos = dao.VerMas(id2);
                    } else {
                        datos = dao.VerMas(id2);
                    }
                    for (Usuarios u : datos) {
                %>
                <tr>
                    <td>Volver</td>
                    <td>  <form action="Revision_CartaNoAdeudo.jsp" method="POST">
                            <input  type="submit" value="Volver" class=" botons">
                        </form></td>
                </tr>
                <tr>
                    <td>Correo</td>
                    <td><%= u.getCorreo()%></td>
                </tr>
                <tr>
                    <td>Codigo:</td>
                    <td><%= u.getCod()%></td>
                </tr>
                <tr>
                    <td>Nombre Usuario:</td>
                    <td><%= u.getNom()%></td>
                </tr>
                <tr>
                    <td>Carrera:</td>
                    <td><%= u.getCar()%></td>
                </tr>
                <tr>
                    <td>Perfil de usuario:</td>
                    <td><%= u.getPer()%></td>
                </tr>
                <tr>
                    <td>Semestre:</td>
                    <td><%= u.getSem()%></td>
                </tr>


                <tr>
                    <td>id: de la solicitud</td>
                    <td><%= u.getC()%></td>
                </tr>
                <tr>
                    <td>Ciclo escolar:</td>
                    <td><%= u.getCiclo()%></td>
                </tr>
                <tr>
                    <td>Motivo</td>
                    <td><%= u.getMotivo()%></td>
                </tr>
                <tr>
                    <td>Estatus:</td>
                    <td><%= u.getEstatus()%></td>
                </tr>
                <tr>
                    <td>Fecha De entrega</td>
                    <td><%= u.getFecha_E()%></td>
                </tr>

                <tr>
                    <td>Marcar como lista:</td>
                    <td>   <form name="Usuario" method="POST" action="Usuario" >
                            <input type="hidden" name="Dia" value="<%= u.getFecha_E()%>">
                            <input type="hidden" name="Correo" value="<%= u.getCorreo()%>">
                            <input type="hidden" name="id" value="<%= u.getC()%>">
                            <input type="hidden" name="Crit" value="Entregado">
                            <%
                                String Est = u.getEstatus();
                                String a = "Pasar Por ella";

                            %>
                            <button <% if (Est.equals(a)) { // 
                                    out.print("enabled"); // 
                                } else {
                                    out.print("disabled");
                                }%> type="submit" name="EntregarCartaAdeudo" value="EntregarCartaAdeudo" class="buttonEntregar">Marcar como entregada</button>

                        </form>
                    <td>
                </tr>
                <tr>
                    <td>Entregado</td>
                    <td>   <form name="Usuario" method="POST" action="Usuario" >
                            <input type="hidden" name="Dia" value="<%= u.getFecha_E()%>">
                            <input type="hidden" name="id" value="<%= u.getC()%>">
                            <input type="hidden" name="Crit" value="Pasar Por ella">
                            <input type="hidden" name="Correo" value="<%= u.getCorreo()%>">
                            <%
                                Est = u.getEstatus();
                                a = "En Proceso";
                                String b = "Fecha Postergada";
                            %>
                            <button <% if (Est.equals(a) || Est.equals(b)) { // 
                                    out.print("enabled"); // 
                                } else {
                                    out.print("disabled");
                                }%> type="submit" name="EntregarCartaAdeudo" value="EntregarCartaAdeudo" class="buttonEntregar">Marcar como lista</button>

                        </form>
                    </td>
                </tr>
                <tr> 
                    <td>Postegar Fecha</td> 
                    <td>  <form name="Usuario" method="POST" action="Usuario" >
                            <input class="controls"  type="date" name="Dia" id="fecha" min="<%= LocalDate.now().plusDays(1).toString()%>"
                                   max="<%= LocalDate.now().plusDays(30).toString()%>" required>
                            <input type="hidden" name="id" value="<%= u.getC()%>">
                            <input type="hidden" name="Correo" value="<%= u.getCorreo()%>">
                            <input type="hidden" name="Crit" value="Fecha Postergada">


                            <%
                                Est = u.getEstatus();
                                a = "En Proceso";
                                b = "Fecha Postergada";
                                String e = "Pasar Por ella";
                            %>
                            <button <% if (Est.equals(a) || Est.equals(e) || Est.equals(b)) { // 
                                    out.print("enabled"); // 
                                } else {
                                    out.print("disabled");
                                }%> type="submit" name="PostegarFecha" value="PostegarFecha" class="button1">Postegar Fecha</button> 

                        </form>
                    </td>
                </tr>


                <% }%>
            </tbody>
        </table>
    </center>

    <center>
        <table>
            <tbody>
                <%   int id = 0;
                    String idParam = request.getParameter("id");
                    if (idParam != null && !idParam.isEmpty()) {
                        id = Integer.parseInt(idParam);
                        // Resto del código que usa el valor de "id"
                    }

                    if (request.getAttribute("BR") != null) {
                        datos = (List<Usuarios>) request.getAttribute("BR");
                    } else if (request.getAttribute("RP") != null) {
                        datos = dao.VerMas(id);
                    } else {
                        datos = dao.VerMas(id);
                    }
                    for (Usuarios u : datos) {
                %>

                <tr>
                    <td>Volver</td>
                    <td>  <form action="Revision_CartaNoAdeudo.jsp" method="POST">
                            <input  type="submit" value="Volver" class=" botons">
                        </form></td>
                </tr>


                <tr>
                    <td>Correo:</td>
                    <td><%= u.getCorreo()%></td>
                </tr>
                <tr>
                    <td>Codigo:</td>
                    <td><%= u.getCod()%></td>
                </tr>
                <tr>
                    <td>Nombre Usuario:</td>
                    <td><%= u.getNom()%></td>
                </tr>
                <tr>
                    <td>Carrera:</td>
                    <td><%= u.getCar()%></td>
                </tr>
                <tr>
                    <td>Perfil de usuario:</td>
                    <td><%= u.getPer()%></td>
                </tr>
                <tr>
                    <td>Semestre:</td>
                    <td><%= u.getSem()%></td>
                </tr>


                <tr>
                    <td>id de la solicitud:</td>
                    <td><%= u.getC()%></td>
                </tr>
                <tr>
                    <td>Ciclo escolar:</td>
                    <td><%= u.getCiclo()%></td>
                </tr>
                <tr>
                    <td>Motivo:</td>
                    <td><%= u.getMotivo()%></td>
                </tr>
                <tr>
                    <td>Estatus:</td>
                    <td><%= u.getEstatus()%></td>
                </tr>

                <tr>
                    <td>Fecha</td>
                    <td>  <form name="Usuario" method="POST" action="Usuario" ><br>
                            <input class="controls"  type="date" name="Dia" id="fecha" min="<%= LocalDate.now().plusDays(1).toString()%>"
                                   max="<%= LocalDate.now().plusDays(30).toString()%>" required>
                            <input type="hidden" name="id" value="<%= u.getC()%>">
                            <input type="hidden" name="Correo" value="<%=u.getCorreo()%>">
                            <input type="hidden" name="Crit" value="En Proceso">
                            <input type="submit" name="Fecha" value="Fecha" class="buttonEntregar">
                        </form>

                    </td>
                </tr>

                <% }%>
            </tbody>
        </table>
    </center>






</body>
</html>
