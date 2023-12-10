/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelado.DAO_Usuario;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {

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
        String user = request.getParameter("txtUser");
        String Pass = request.getParameter("txtPass");
        String Nombre;

        int Nivel;

        DAO_Usuario dao = new DAO_Usuario();
        Nivel = dao.Login(user, Pass);
        Nombre = dao.validar(user);
        user = dao.obtenerCorreo(user);
        
        HttpSession objesesion = request.getSession(true);
        objesesion.setAttribute("user", user);

        if (Nivel != 0) {
            switch (Nivel) {
                case 1:

                    objesesion.setAttribute("Nombre", Nombre);
                    objesesion.setAttribute("Nivel", Nivel);
                    response.sendRedirect("Menu_Alumnos.jsp");
                    break;
                case 2:
                    objesesion.setAttribute("Nivel", Nivel);
                    objesesion.setAttribute("Nombre", Nombre);
                    response.sendRedirect("Menu_Principal.jsp");
                    break;
                case 3:
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
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
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