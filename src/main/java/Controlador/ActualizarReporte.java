/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelado.Database;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


/**
 *
 * @author netor
 */
@WebServlet("/ActualizarReporte")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class ActualizarReporte extends HttpServlet {

    Database db = new Database();
    Connection con;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String Correo = request.getParameter("Cotxt");
        String nombrePractica = request.getParameter("Nomtxt");
        String laboratorio = request.getParameter("labtxt");
        String especificaciones = request.getParameter("txtEsp");
        String responsableMaestro = request.getParameter("RM");
        String fechaPractica = request.getParameter("fc");
        String horaEntrada = request.getParameter("HE");
        String horaSalida = request.getParameter("HS");
        String Permitir= request.getParameter("Permitir");
        Part archivo = request.getPart("Archivo");
    // Verificar el tamaño del archivo
    if (archivo.getSize() > 2097152) {
        // Si el archivo es demasiado grande, mostrar un mensaje de error
        response.getWriter().write("El archivo es demasiado grande");
        return;
    }

        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(),
                    db.getUsuario(),
                    db.getContraseña());
            String sql = "UPDATE reportes SET Correo_U = ?, Nombre_R = ?, Laboratorio = ?, Especificaciones = ?, Tipo = ?,  Fecha = ?, Hora_E = ?, Hora_S = ?, Archivos = ?, Permitir = ? WHERE id_R = ?";
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
            pstmt.setInt(11, id);
            pstmt.executeUpdate();
            con.close();
        } catch (SQLException e) {
            request.setAttribute("error", "Error al guardar los datos en la base de datos: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/VistaReporte.jsp");
            dispatcher.forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Reporte.class.getName()).log(Level.SEVERE, null, ex);
        }


           if (request.getHeader("Referer").contains("Vista_Practicas.jsp")) {
        response.sendRedirect(request.getContextPath() + "/Vista_Practicas.jsp");
    } else {
        response.sendRedirect(request.getContextPath() + "/VistaReporte.jsp");
    }
    }   
}
