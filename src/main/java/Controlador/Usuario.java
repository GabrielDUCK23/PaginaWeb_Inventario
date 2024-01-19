/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelado.DAO_Usuario;
import UML.Carta;
import UML.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author netor
 */
public class Usuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            DAO_Usuario dao = new DAO_Usuario();
            Usuarios u = new Usuarios();
            Carta c = new Carta();
            String respuesta = "";
            RequestDispatcher rd = null;

//            Pricipalmente aqui se manejaron 3 perfiles los cuales son los siguientes: 
//            Nivel 1: Estudiantes.
//            Nivel 2: Encargados de Laboratorio.
//            Nivel 3: Profesores
            try {
//                -------------------------------------- Agregar Usuarios ---------------------------------------------------------------------

                if (request.getParameter("Insertar") != null) {
                    String correo = request.getParameter("Correo");
                    u.setCorreo(correo);
                    int Codigo = Integer.parseInt(request.getParameter("Codtxt"));

                    int Nivel = 0;
                    String Perfil = "";

                    String codigoString = String.valueOf(Codigo);
                    switch (codigoString.length()) {
                        case 7:
                            Nivel = 3;
                            Perfil = "Profesor/a";
                            break;
                        case 9:
                            Nivel = 1;
                            Perfil = "Estudiante";
                            break;
                        default:
                            respuesta = "Código de usuario no válido";
                            request.setAttribute("respuesta", respuesta);
                            rd = request.getRequestDispatcher("Registro.jsp");
                            break;
                    }

                    u.setCod(Codigo);
                    u.setPer(Perfil);
                    u.setNom(request.getParameter("Nomtxt"));
                    u.setCar(request.getParameter("Cartxt"));
                    u.setSem(Integer.parseInt(request.getParameter("Semtxt")));
                    u.setPassword(request.getParameter("Pass"));
                    u.setNivel(Nivel);

                    if (correo.endsWith("udg.mx")) {
                        boolean VerificarCodigo = dao.verificarCodigo(Codigo);
                        if (VerificarCodigo) {
                            respuesta = dao.InsertarU(u);
                            request.setAttribute("respuesta", respuesta);
                        } else {
                            respuesta = "Código de usuario en uso, verifica que esté correcto.";
                            request.setAttribute("respuesta", respuesta);
                        }
                    } else {
                        respuesta = "El correo electrónico debe ser de la Universidad de Guadalajara (UDG).";
                        request.setAttribute("respuesta", respuesta);
                    }

                    rd = request.getRequestDispatcher("Login.jsp");

                    //Tecnicamente es lo mismo que el codigo de arriba solo que este es para el jsp registros_superUsuario
                } else if (request.getParameter("admInsertar") != null) {
                    String correo = request.getParameter("Correo");
                    u.setCorreo(correo);
                    int Codigo = Integer.parseInt(request.getParameter("Codtxt"));
                    u.setCod(Codigo);
                    u.setNom(request.getParameter("Nomtxt"));
                    u.setCar(request.getParameter("Cartxt"));
                    String Perf = (request.getParameter("Pertxt"));
                    u.setPer(Perf);
                    u.setSem(Integer.parseInt(request.getParameter("Semtxt")));
                    int Nivel;
                    switch (Perf) {
                        case "Estudiante":
                            Nivel = 1;
                            break;
                        case "Profesor/a":
                            Nivel = 3;
                            break;
                        case "Encargado Laboratorio":
                            Nivel = 2;
                            break;
                        default:
                            Nivel = 0; // Otra opción por defecto si Perf no coincide con ninguna categoría
                            break;
                    }
                    u.setNivel(Nivel);
                    u.setPassword(request.getParameter("Pass"));
                    
                    if (correo.endsWith("udg.mx")) {
                        boolean VerificarCodigo = dao.verificarCodigo(Codigo);
                        if (VerificarCodigo) {
                            respuesta = dao.Insertar(u);
                            request.setAttribute("respuesta", respuesta);
                        } else {
                            respuesta = "Código de usuario en uso, verifica que esté correcto.";
                            request.setAttribute("respuesta", respuesta);
                        }
                    } else {
                        respuesta = "El correo electrónico debe ser de la Universidad de Guadalajara (UDG).";
                            request.setAttribute("respuesta", respuesta);
                    }
                    rd = request.getRequestDispatcher("Registro_SuperUsuario.jsp");

//                  -------------------------------------- Actualiza Datos de usuarios ---------------------------------------------------------------------
//                    Codigo para actualizar los datos de los usuarios desde el perfil de encargado de laboratorio
                } else if (request.getParameter("btnActualizar") != null) {
                    u.setCorreo(request.getParameter("Correo"));
                    u.setCod(Integer.parseInt(request.getParameter("Codtxt")));
                    u.setNom(request.getParameter("Nomtxt"));
                    u.setCar(request.getParameter("Cartxt"));
                    u.setPer(request.getParameter("Pertxt"));
                    u.setSem(Integer.parseInt(request.getParameter("Semtxt")));
                    u.setPassword(request.getParameter("Pass"));
                    u.setNivel(Integer.parseInt(request.getParameter("Nivel")));
                    respuesta = dao.ActualizarAdmnistrador(u);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("Administrar_U.jsp");

//                    este codigo es para que el estudiante pueda editar su informacion 
                } else if (request.getParameter("Actualizar") != null) {
                    u.setCorreo(request.getParameter("Correo"));
                    u.setNom(request.getParameter("Nomtxt"));
                    u.setCar(request.getParameter("Cartxt"));
                    u.setSem(Integer.parseInt(request.getParameter("Semtxt")));
                    u.setPassword(request.getParameter("Pass"));
                    respuesta = dao.Actualizar(u);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("Editar_Alumnos.jsp");

                    //                    este codigo es para que el Profesor/a pueda editar su informacion 
                } else if (request.getParameter("Actualizar_Profesor") != null) {
                    u.setCorreo(request.getParameter("Correo"));
                    u.setNom(request.getParameter("Nomtxt"));
                    u.setCar(request.getParameter("Cartxt"));
                    u.setSem(Integer.parseInt(request.getParameter("Semtxt")));
                    u.setPassword(request.getParameter("Pass"));
                    respuesta = dao.Actualizar(u);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("Editar_Profesores.jsp");

                    //     este codigo es para que el Encargado de laboratorio pueda editar su informacion 
                } else if (request.getParameter("ActualizarSuper") != null) {
                    u.setCorreo(request.getParameter("Correo"));
                    u.setNom(request.getParameter("Nomtxt"));
                    u.setCar(request.getParameter("Cartxt"));
                    u.setSem(Integer.parseInt(request.getParameter("Semtxt")));
                    u.setPassword(request.getParameter("Pass"));
                    respuesta = dao.Actualizar(u);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("EditarSuperUsuario.jsp");

//             
//          -------------------------------------- Carta de no adeudo ---------------------------------------------------------------------
                    //Solicita Carta de no adeudo 
                } else if (request.getParameter("Carta") != null) {
                    c.setCorreo(request.getParameter("Correo"));
                    c.setCiclo(request.getParameter("Ciclo"));
                    c.setMotivo(request.getParameter("Mot"));
                    respuesta = dao.insertarCarta(c);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("Solicitud_CartaNoAdeudo.jsp");

//          Permite ver mas informacion sobre el usuario que solicito la carta de no adeudo
                } else if (request.getParameter("VerMas") != null) {
                    int id = Integer.parseInt(request.getParameter("Id"));//id de la solicitud
                    dao.VerMas(id);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("Estatus_Carta.jsp");

                    // Permite darle una fecha aproximada de cuando tendra lista la carta de no adeudo: 
                } else if (request.getParameter("Fecha") != null) {

                    String Gm = request.getParameter("Correo");
                    int user = Integer.parseInt(request.getParameter("id"));//id de la solicitud
                    String Crit = request.getParameter("Crit");
                    String fechaOriginal = request.getParameter("Dia");
                    // Crea un objeto SimpleDateFormat para analizar la fecha en formato original
                    SimpleDateFormat sdfOriginal = new SimpleDateFormat("yyyy-MM-dd");
                    // Analiza la fecha original en formato año-mes-día
                    Date fechaDate = sdfOriginal.parse(fechaOriginal);
                    // Crea un nuevo objeto SimpleDateFormat para formatear la fecha en el nuevo formato día-mes-año
                    SimpleDateFormat sdfNuevo = new SimpleDateFormat("dd-MM-yyyy");
                    // Formatea la fecha en el nuevo formato día-mes-año
                    String fechaNuevo = sdfNuevo.format(fechaDate);

                    dao.FechaCarta(user, Crit, fechaNuevo);

                    try {
                        dao.SendEstatus(Gm, Crit, fechaDate);
                        respuesta = "Se ha enviado al usuario el nuevo estatus: " + Crit;
                    } catch (Exception e) {
                        respuesta = "Ocurrió un error al enviar el correo: " + e.getMessage();
                    }
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("Revision_CartaNoAdeudo.jsp");

                } else if (request.getParameter("EntregarCartaAdeudo") != null) {
                    String Gm = request.getParameter("Correo");
                    int user = Integer.parseInt(request.getParameter("id"));//id de la solicitud
                    String Crit = request.getParameter("Crit");
                    Date fechaActual = new Date();
                    dao.CartaAdeudo(user, Crit);
                    try {
                        dao.SendEstatus(Gm, Crit, fechaActual);
                        respuesta = "Se ha enviado al usuario el nuevo estatus: " + Crit;
                    } catch (Exception e) {
                        respuesta = "Ocurrió un error al enviar el correo: " + e.getMessage();
                    }

                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("Revision_CartaNoAdeudo.jsp");

                } else if (request.getParameter("PostegarFecha") != null) {
                    String Gm = request.getParameter("Correo");
                    int user = Integer.parseInt(request.getParameter("id"));//id de la solicitud
                    String Crit = request.getParameter("Crit");
                    String fechaOriginal = request.getParameter("Dia");
                    // Crea un objeto SimpleDateFormat para analizar la fecha en formato original
                    SimpleDateFormat sdfOriginal = new SimpleDateFormat("yyyy-MM-dd");
                    // Analiza la fecha original en formato año-mes-día
                    Date fechaDate = sdfOriginal.parse(fechaOriginal);
                    // Crea un nuevo objeto SimpleDateFormat para formatear la fecha en el nuevo formato día-mes-año
                    SimpleDateFormat sdfNuevo = new SimpleDateFormat("dd-MM-yyyy");

                    // Formatea la fecha en el nuevo formato día-mes-año
                    String fechaNuevo = sdfNuevo.format(fechaDate);
                    dao.FechaCarta(user, Crit, fechaNuevo);
                    try {
                        dao.SendEstatus(Gm, Crit, fechaDate);
                        respuesta = "Se ha enviado al usuario el nuevo estatus: " + Crit;
                    } catch (Exception e) {
                        respuesta = "Ocurrió un error al enviar el correo: " + e.getMessage();
                    }

                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("Revision_CartaNoAdeudo.jsp");

                } else if (request.getParameter("Datos") != null) {
                    int user = Integer.parseInt(request.getParameter("Codtxt"));//id de la solicitud
                    respuesta = dao.ArchivosU(user);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("Revision_CartaNoAdeudo.jsp");

                } else if (request.getParameter("Recuperar") != null) {
                    String Correo = request.getParameter("Correo");
                    int Codigo = Integer.parseInt(request.getParameter("Codigo"));
                    boolean usuarioExiste = dao.validarUsuario(Correo, Codigo);
                    if (usuarioExiste == true) {
                        dao.generarYGuardarContrasenaTemporal(Correo);

                        String PASS = dao.obtenerPassword(Correo);
                        try {
                            dao.sendMain(Correo, PASS);
                            respuesta = "Se ha enviando una contraseña temporal al correo: " + Correo;
                        } catch (Exception e) {
                            respuesta = "Ocurrió un error al enviar el correo: " + e.getMessage();
                        }
                        request.setAttribute("respuesta", respuesta);
                        rd = request.getRequestDispatcher("Recuperacion_Password.jsp");

                    } else {
                        respuesta = "No se encontró usuario: verifique que el Correo y Código sean correctos";
                        request.setAttribute("respuesta", respuesta);
                        rd = request.getRequestDispatcher("Recuperacion_Password.jsp");
                    }

                } else if (request.getParameter("Cancelar") != null) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    respuesta = dao.Cancelar(id);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("Solicitudes_individuales.jsp");

                }
//            
            } catch (IOException | NumberFormatException | SQLException | ParseException e) {
            }
            rd.forward(request, response);

        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

//Codigo que no tiene utilidad de momentos
//                } else if (request.getParameter("bus") != null) {
//                    Cri = (request.getParameter("CTR"));
//                    datos = dao.consultar(Cri);
//                    request.setAttribute("BR", datos);
//                    rd = request.getRequestDispatcher("Administrar_U.jsp");
//
//                } else if (request.getParameter("Consultar") != null) {
//                    request.setAttribute("habilitarFormulario", true);
//
//                    rd = request.getRequestDispatcher("Administrar_U.jsp");
//
//                } else if (request.getParameter("Buscar") != null) {
//                    int bus = Integer.parseInt(request.getParameter("CTR"));
//                    datos = dao.buscar(bus);
//                    request.setAttribute("BR", datos);
//                    rd = request.getRequestDispatcher("Administrar_U.jsp");
//
//                } else if (request.getParameter("Reiniciar") != null) {
//                    datos = dao.consultarGRL();
//                    request.setAttribute("RP", datos);
//                    rd = request.getRequestDispatcher("Administrar_U.jsp");
//
//                    
//                }else if (request.getParameter("Buscar2") != null) {
//                    String id = "";
//                    id = request.getParameter("id");
//                    String Correo = request.getParameter("Correo");
//                    datos = dao.BuscadorCarta(Correo, id);
//                    request.setAttribute("BR", datos);
//                    rd = request.getRequestDispatcher("Estatus_Carta.jsp");
//
//                
//                }else if (request.getParameter("Rei123") != null) {
//                    datos = dao.consultarGRL();
//                    request.setAttribute("RP", datos);
//                    rd = request.getRequestDispatcher("Estatus_Carta.jsp");
//
//                }else if (request.getParameter("Rei") != null) {
//                    datos = dao.consultarGRL();
//                    request.setAttribute("RP", datos);
//                    rd = request.getRequestDispatcher("Administrar_U.jsp");
//
//      } else if (request.getParameter("EntregarCartaAdeudo") != null) {
//                    String Gm = request.getParameter("Correo");
//                    Date fechaActual = new Date();
//                    int user = Integer.parseInt(request.getParameter("Codtxt"));//id de la solicitud
//                    String Crit = request.getParameter("Crit");
//                    dao.CartaAdeudo(user, Crit);
//                    dao.SendEstatus(Gm, Crit, fechaActual);
//
//                    request.setAttribute("respuesta", respuesta);
//                    rd = request.getRequestDispatcher("Revision_CartaNoAdeudo.jsp");
//
//                    
//                    
//                } else if (request.getParameter("Entrega") != null) {
//                    int user = Integer.parseInt(request.getParameter("Codtxt"));//id de la solicitud
//                    String Crit = request.getParameter("Crit");
//                    dao.CartaAdeudo(user, Crit);
//                    request.setAttribute("respuesta", respuesta);
//                    rd = request.getRequestDispatcher("Estatus_Carta.jsp");
