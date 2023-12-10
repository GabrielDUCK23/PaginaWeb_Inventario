/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelado.DAO_Solicitud;
import Modelado.DAO_Usuario;
import UML.Solicitud;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Solicitudes extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            DAO_Solicitud dao = new DAO_Solicitud();
            Solicitud s = new Solicitud();
            List<Solicitud> datos = new ArrayList<>();
            String respuesta = "";
            RequestDispatcher rd = null;
            String Camp;
            int user = 0;

            try {
//                 -------------------------------------- Solicitudes de materiales ---------------------------------------------------------------------
//               Codigo sirve para crear solicitudes de material
//               Recibe los datos para mandarlos al metodo insertar 
                if (request.getParameter("Insertar") != null) {
                    s.setCorreo(request.getParameter("Correo"));
                    s.setId_L(Integer.parseInt(request.getParameter("Id_Ltxt")));//Laboratorio
                    s.setDepart(request.getParameter("Deptxt"));
                    s.setDepart2(request.getParameter("des2"));
                    s.setAsig(request.getParameter("Asigtxt"));
                    s.setTipo(request.getParameter("tipo"));
                    s.setDescr(request.getParameter("desc"));
                    s.setTiempo(request.getParameter("tiempo"));
                    s.setRespon(request.getParameter("Profe"));
                    respuesta = dao.Insertar(s);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("Eleccion_Material.jsp");

                }
                if (request.getParameter("Insertar_Profesores") != null) {
                    s.setCorreo(request.getParameter("Correo"));
                    s.setId_L(Integer.parseInt(request.getParameter("Id_Ltxt")));//Laboratorio
                    s.setDepart(request.getParameter("Deptxt"));
                    s.setDepart2(request.getParameter("des2"));
                    s.setAsig(request.getParameter("Asigtxt"));//Asignatura
                    s.setTipo(request.getParameter("tipo"));
                    s.setDescr(request.getParameter("desc"));
                    s.setTiempo(request.getParameter("tiempo"));
                    s.setRespon(request.getParameter("Profe"));
                    respuesta = dao.Insertar(s);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("Solicitudes_Profesores.jsp");

                } else if (request.getParameter("btnActualizar") != null) {
                    s.setCorreo(request.getParameter("Codtxt"));//Usuario
//                    s.setId_M(Integer.parseInt(request.getParameter("Id_Mtxt")));//Material
                    s.setId_L(Integer.parseInt(request.getParameter("Id_Ltxt")));//Laboratorio
                    s.setDepart(request.getParameter("Deptxt"));
                    s.setDepart2(request.getParameter("des2"));
                    s.setAsig(request.getParameter("Asigtxt"));//Asignatura
//                    s.setNom_M(request.getParameter("Nom_Mtxt"));//Material
//                    s.setNum_S(request.getParameter("NUMS"));//Serie
                    s.setDescr(request.getParameter("desc"));
                    s.setTiempo(request.getParameter("tiempo"));
                    respuesta = dao.Actualizar(s);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("Solicitud.jsp");

                } else if (request.getParameter("Consultar") != null) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    datos = dao.Consultarid(id);
                    request.setAttribute("BR1", datos);
                    rd = request.getRequestDispatcher("Entregar_Material.jsp");

                } else if (request.getParameter("Entregar") != null) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    respuesta = dao.Entregar(id);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("Solicitudes_individuales.jsp");

                } else if (request.getParameter("Cancelar") != null) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    respuesta = dao.Cancelar(id);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("Solicitudes_individuales.jsp");

                } else if (request.getParameter("Entregar_Profesores") != null) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    respuesta = dao.Entregar(id);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("Solicitudes_Profesores.jsp");

                } else if (request.getParameter("Cancelar_Profesores") != null) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    respuesta = dao.Cancelar(id);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("Solicitudes_Profesores.jsp");

                } else if (request.getParameter("EntregarMaterial") != null) {
                    s.setId_S(Integer.parseInt(request.getParameter("Id")));//Usuario
                    s.setEstatus(request.getParameter("Estatus"));
                    s.setCom(request.getParameter("Com"));
                    respuesta = dao.EntregarMaterial(s);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("RevisionMaterial.jsp");
   
                }
            } catch (Exception e) {
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
            Logger.getLogger(Solicitudes.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Solicitudes.class.getName()).log(Level.SEVERE, null, ex);
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

//  Codigo Muerto 



// } else if (request.getParameter("excel") != null) {
//                    respuesta = dao.ArchivosExcel();
//                    request.setAttribute("respuesta", respuesta);
//                    rd = request.getRequestDispatcher("Solicitudes_Usuarios.jsp");
//                }
//}else if(request.getParameter("btnEliminar")!=null){
//                     u.setId_U(Integer.parseInt(request.getParameter("idutxt")));
//                    dao.Eliminar (u);
//                    respuesta = dao.Actualizar(u);
//                    request.setAttribute("R", respuesta);
//                    rd = request.getRequestDispatcher("Usuarioss.jsp");
//                } else if (request.getParameter("Filtrar") != null) {
//                    String filtro = "";
//                    filtro = request.getParameter("CTR");
//                    datos = dao.FiltrarTodos(filtro);
//                    request.setAttribute("BR", datos);
//                    rd = request.getRequestDispatcher("Solicitudes_Usuarios.jsp");
//
//                } else if (request.getParameter("Rei") != null) {
//                    datos = dao.consultarGRL();
//                    request.setAttribute("RP", datos);
//                    rd = request.getRequestDispatcher("Solicitudes_Usuarios.jsp");
//
//                } else if (request.getParameter("Filtrar2") != null) {
//                       String filtro = "";
//                    String Correo ="";
//                    filtro = request.getParameter("CTR");
//                    Correo = request.getParameter("Correo");
//                    datos = dao.Filtrar(Correo, filtro);
//                    request.setAttribute("BR", datos);
//                    rd = request.getRequestDispatcher("Solicitudes_individuales.jsp");
//
//                } else if (request.getParameter("Rei2") != null) {
//                    datos = dao.consultarGRL();
//                    request.setAttribute("RP", datos);
//                    rd = request.getRequestDispatcher("Solicitudes_individuales.jsp");
//
//                }else if (request.getParameter("Filtrar3") != null) {
//                     String filtro = "";
//                    String Correo ="";
//                    filtro = request.getParameter("CTR");
//                    Correo = request.getParameter("Correo");
//                    datos = dao.Filtrar(Correo, filtro);
//                    request.setAttribute("BR", datos);
//                    rd = request.getRequestDispatcher("Solicitudes_Profesores.jsp");
//
//                } else if (request.getParameter("Rei3") != null) {
//                    datos = dao.consultarGRL();
//                    request.setAttribute("RP", datos);
//                    rd = request.getRequestDispatcher("Solicitudes_Profesores.jsp");
//
//                } else if (request.getParameter("Reir") != null) {
//                    datos = dao.consultarGRL();
//                    request.setAttribute("RP", datos);
//                    rd = request.getRequestDispatcher("Solicitudes_Usuarios.jsp");
//                } else if (request.getParameter("Archivo") != null) {
//                    int archivo = Integer.parseInt(request.getParameter("Id_S"));//id de la solicitud
//                    respuesta = dao.Archivos(archivo);
//                    request.setAttribute("respuesta", respuesta);
//                    rd = request.getRequestDispatcher("Solicitudes_Usuarios.jsp");
//
