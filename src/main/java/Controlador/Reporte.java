/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelado.DAO_Reportes;
import Modelado.Database;
import UML.Reportes;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.Part;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.MultipartConfig;

import javax.servlet.annotation.WebServlet;

/**
 *
 * @author netor
 */
@WebServlet("/reporte")
@MultipartConfig(maxFileSize = 16177215)    // Tamaño máximo de archivo: 16 MB
public class Reporte extends HttpServlet {

    Database db = new Database();
    Connection con;

    /**
     * Maneja una solicitud POST para procesar los datos del formulario de reporte.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Correo = request.getParameter("Cotxt");
        String nombrePractica = request.getParameter("Nomtxt");
        String laboratorio = request.getParameter("labtxt");
        String especificaciones = request.getParameter("txtEsp");
        String responsableMaestro = request.getParameter("RM");
        String fechaPractica = request.getParameter("fc");
        String horaEntrada = request.getParameter("HE");
        String horaSalida = request.getParameter("HS");
        String Permitir = request.getParameter("Permitir");
        Part archivo = request.getPart("Archivo");

        // Verificar el tamaño del archivo
        if (archivo.getSize() > 2097152) {
            // Si el archivo es demasiado grande, mostrar un mensaje de error
            response.getWriter().write("El archivo es demasiado grande");
            return;
        }

        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            String sql = "INSERT INTO reportes(id_R,Correo_U,Nombre_R,Laboratorio,Especificaciones,Tipo,Fecha,Hora_E,Hora_S,Archivos,Permitir) VALUES (null,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, Correo);
            pstmt.setString(2, nombrePractica);
            pstmt.setString(3, laboratorio);
            pstmt.setString(4, especificaciones);
            pstmt.setString(5, responsableMaestro);
            pstmt.setString(6, fechaPractica);
            pstmt.setString(7, horaEntrada);
            pstmt.setString(8, horaSalida);
            pstmt.setBinaryStream(9, archivo.getInputStream());
            pstmt.setString(10, Permitir);
            pstmt.executeUpdate();
            con.close();
           String respuesta = "Archivo generado y guardado";
           request.setAttribute("respuesta", respuesta);
        } catch (SQLException e) {
            request.setAttribute("error", "Error al guardar los datos en la base de datos: " + e.getMessage());
            String errorMensaje = "Error al guardar los datos en la base de datos: " + e.getMessage();
            request.setAttribute("error", errorMensaje);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Reporte.jsp");
            dispatcher.forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Reporte.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Redirige según la página de origen
        if (request.getHeader("Referer").contains("Practicas_Externas.jsp")) {
            response.sendRedirect(request.getContextPath() + "/Practicas_Externas.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/Reporte.jsp");
        }
    }


//            try {
//                if (request.getParameter("archivo") != null) {
//                    u.setCorreo(request.getParameter("Codtxt"));
//                    u.setNombre(request.getParameter("Nomtxt"));
//                    u.setLab(request.getParameter("labtxt"));
//                    u.setEsp(request.getParameter("txtEsp"));
//                    u.setProf(request.getParameter("RM"));
//                    u.setFecha(request.getParameter("fc"));
//                    u.setHora(request.getParameter("HE"));
//                    u.setHoraS(request.getParameter("HS"));
//                    Part filePart = request.getPart("Archivo");
//                    if (filePart.getSize() > 0) {
//                        System.out.println(filePart.getName());
//                        System.out.println(filePart.getSize());
//                        System.out.println(filePart.getContentType());
//                        inputStream = filePart.getInputStream();
//                    }
//                    u.setArchivopdf(inputStream);
//                    respuesta = dao.Insertar(u);
//                    request.setAttribute("respuesta", respuesta);
//                   rd = request.getRequestDispatcher("Reportes.jsp");
//                                   
//                }else if (request.getParameter("Reiniciar2") != null) {
//                    
//                }
//
//            } catch (IOException | ServletException e) {
//            }
//            rd.forward(request, response);
//
//        }
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

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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



