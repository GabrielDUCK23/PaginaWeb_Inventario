/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelado.DAO_Materiales;
import Modelado.DAO_Reportes;
import Modelado.DAO_Usuario;
import UML.Materiales;
import UML.Reportes;
import UML.Usuarios;
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

/**
 *
 * @author netor
 */
public class Material extends HttpServlet {

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
            DAO_Materiales dao = new DAO_Materiales();
            Materiales m = new Materiales();
            List<Materiales> datos = new ArrayList<>();
            DAO_Reportes dao2 = new DAO_Reportes();
            Reportes r = new Reportes();
            List<Reportes> datos2 = new ArrayList<>();
            String respuesta = "";
            RequestDispatcher rd = null;
            String Cri = "";

            try {
                if (request.getParameter("btnInsertar") != null) {
                    m.setNombre(request.getParameter("Nom"));
                    m.setMarca(request.getParameter("Marca"));
                    m.setCantidad(request.getParameter("Cantidad"));
                    m.setLote(request.getParameter("Lote"));
                    m.setClasificacion(request.getParameter("Clas"));
                    m.setFormula(request.getParameter("For"));
                    m.setTipo(request.getParameter("Tipo"));
                    m.setCantidad_Total(Integer.parseInt(request.getParameter("C_Total")));
                    respuesta = dao.Insertar(m);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("AgregaMaterial.jsp");

                } else if (request.getParameter("btnActualizar") != null) {
                    m.setId(Integer.parseInt(request.getParameter("id")));
                    m.setNombre(request.getParameter("Nom"));
                    m.setMarca(request.getParameter("Marca"));
                    m.setCantidad(request.getParameter("Cantidad"));
                    m.setLote(request.getParameter("Lote"));
                    m.setClasificacion(request.getParameter("Clas"));
                    m.setFormula(request.getParameter("For"));
                    m.setTipo(request.getParameter("Tipo"));
                    m.setCantidad_Total(Integer.parseInt(request.getParameter("C_Total")));
                    respuesta = dao.Actualizar(m);
                    request.setAttribute("respuesta", respuesta);
                    rd = request.getRequestDispatcher("ActualizarMaterial.jsp");

                } else if (request.getParameter("Eleccion") != null) {
                    int ID = Integer.parseInt(request.getParameter("ID"));
                    datos = dao.ActUsuarios(ID);
                    request.setAttribute("BR", datos);
                    rd = request.getRequestDispatcher("ActualizarMaterial.jsp");

                } else if (request.getParameter("Reiniciar") != null) {
                    datos = dao.consultarGRL();
                    request.setAttribute("RP", datos);
                    rd = request.getRequestDispatcher("ActualizarMaterial.jsp");

                } else if (request.getParameter("Reiniciar2") != null) {
                    datos = dao.consultarGRL();
                    request.setAttribute("RP", datos);
                    rd = request.getRequestDispatcher("Eleccion_Material.jsp");
                    
                } else if (request.getParameter("Reiniciar3") != null) {
                    datos = dao.consultarGRL();
                    request.setAttribute("RP", datos);
                    rd = request.getRequestDispatcher("Seleccion_MaterialProfesores.jsp");
                    
                } else if (request.getParameter("Reporte") != null) {
                     String Correo = request.getParameter("Correo");
                     String Reporte = request.getParameter("CTR");
                    datos2 = (List<Reportes>) dao2.Buscar(Correo,Reporte);
                    request.setAttribute("BR", datos2); // Agrega los datos al request

                    rd = request.getRequestDispatcher("VistaReporte.jsp");
                    
                } else if (request.getParameter("Reiniciar_Reporte") != null) {
                    datos2 = dao2.consultarGRL();
                    request.setAttribute("RP", datos2);
                    rd = request.getRequestDispatcher("VistaReporte.jsp");
                    
                } else if (request.getParameter("Practicas") != null) {
                     String Correo = request.getParameter("Correo");
                     String Reporte = request.getParameter("CTR");
                    datos2 = (List<Reportes>) dao2.Buscar(Correo,Reporte);
                    request.setAttribute("BR", datos2); // Agrega los datos al request

                    rd = request.getRequestDispatcher("Vista_Practicas.jsp");
                    
                } else if (request.getParameter("Reiniciar_Practicas") != null) {
                    datos2 = dao2.consultarGRL();
                    request.setAttribute("RP", datos2);
                    rd = request.getRequestDispatcher("Vista_Practicas.jsp");
                    
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
            Logger.getLogger(Material.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Material.class.getName()).log(Level.SEVERE, null, ex);
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
