/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelado.DAO_Laboratorio;
import UML.Laboratorio;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author netor
 */
public class LaboratorioS extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            DAO_Laboratorio dao = new DAO_Laboratorio();

            Laboratorio l = new Laboratorio();
            List<Laboratorio> datos = new ArrayList<>();
           
            String respuesta = "";
            RequestDispatcher rd = null;
            String Camp, Cri;

            try {
                if (request.getParameter("btnInsertarL") != null) {
                    
                    l.setNom(request.getParameter("Nomtxt"));
                    l.setEnca(request.getParameter("Encxt"));
                    respuesta = dao.Insertar(l);
                    request.setAttribute("R", respuesta);
                    rd = request.getRequestDispatcher("Registro_Laboratorios.jsp");

                } else if (request.getParameter("btnActualizar") != null) {
                    l.setIdL(Integer.parseInt(request.getParameter("idtxt")));
                    l.setNom(request.getParameter("Nomtxt"));
                    l.setEnca(request.getParameter("Encxt"));
                    respuesta = dao.Actualizar(l);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("Actualizacion_Laboratorios.jsp");

                } else if (request.getParameter("Agendar") != null) {
                    int Lab = Integer.parseInt(request.getParameter("Lab"));
                    l.setLab(Lab);
                    l.setCorreo(request.getParameter("Correo"));

                    // Obtener la fecha ingresada por el usuario y formatearla
                    String fecha = request.getParameter("Dia");
                    LocalDate fechaLocal = LocalDate.parse(fecha);
                    String fechaFormateada = fechaLocal.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                    l.setDia(fechaFormateada);

                    String hora = request.getParameter("hora_inicio");
                    l.setHora_I(hora);

                    // Verificar si la fecha y hora están disponibles antes de agregar los datos
                    if (dao.verificar(fechaFormateada, hora,Lab)) {
                        respuesta = dao.Agendar(l);
                        request.setAttribute("respuesta", respuesta);
                        rd = request.getRequestDispatcher("Agendar_Laboratorio.jsp");
                    } else {
                        // Mostrar un mensaje de error si la fecha y hora no están disponibles
                        respuesta = "Laboratorio no disponible en el dia y hora que lo requieres";
                        request.setAttribute("respuesta", respuesta);
                        rd = request.getRequestDispatcher("Agendar_Laboratorio.jsp");
                    }
                }
                else if (request.getParameter("Cancelar") != null) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    respuesta = dao.Cancelar(id);
                    request.setAttribute("respuesta", respuesta);  
                    rd = request.getRequestDispatcher("Agenda_Individual.jsp");
                    
//                }else if (request.getParameter("Buscar") != null) {
//                    int Id = Integer.parseInt(request.getParameter("id"));
//                    String fecha = request.getParameter("Dia");
//                    String Hora = request.getParameter("hora_inicio");
//                    datos = dao.Filtroagenda(fecha, Hora,Id);
//                    request.setAttribute("BR", datos);
//                    rd = request.getRequestDispatcher("Revision_Agenda.jsp");
//
//                }else if (request.getParameter("Reiniciar") != null) {
//                    datos = dao.TodasAgendas();
//                    request.setAttribute("RP", datos);
//                    rd = request.getRequestDispatcher("Revision_Agenda.jsp");
//                    
//                }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
//     int Lab = Integer.parseInt(request.getParameter("Lab"));
////                    String correo = request.getParameter("Correo");
////                    String Dia = request.getParameter("Dia");
////                    String hora_inicio = request.getParameter("hora_inicio");
////                    String hora_Fin = request.getParameter("hora_Fin");
