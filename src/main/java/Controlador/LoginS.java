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

public class LoginS extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String respuesta = "";
        String user = request.getParameter("txtUser");
        String Pass = request.getParameter("txtPass");
        String Nombre = "";

        int Nivel = 0;

        DAO_Usuario dao = new DAO_Usuario();
        Nivel = dao.Login(user, Pass);
        Nombre = dao.validar(user);
        HttpSession objesesion = request.getSession(true);
        

        if (Nivel != 0) {
            switch (Nivel) {
                case 1:
objesesion.setAttribute("user", user);
                    objesesion.setAttribute("Nombre", Nombre);
                    objesesion.setAttribute("Nivel", Nivel);
                    response.sendRedirect("Menu_Alumnos.jsp");
                    break;
                case 2:
                    objesesion.setAttribute("user", user);
                    objesesion.setAttribute("Nivel", Nivel);
                    objesesion.setAttribute("Nombre", Nombre);
                    response.sendRedirect("Menu_Principal.jsp");
                    break;
                case 3:
                    objesesion.setAttribute("user", user);
                     objesesion.setAttribute("Nivel", Nivel);
                    objesesion.setAttribute("Nombre", Nombre);
                    response.sendRedirect("Menu_Profesores.jsp");
                    break;
                default:
                  
            response.sendRedirect("Login.jsp");

            }
        } else {
            response.sendRedirect("Login.jsp");
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
            Logger.getLogger(LoginS.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(LoginS.class.getName()).log(Level.SEVERE, null, ex);
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