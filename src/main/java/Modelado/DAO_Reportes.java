/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelado;

import UML.Reportes;
//import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author netor
 */
public class DAO_Reportes implements Operaciones {

    Database db = new Database();
    int r = 0;
  


    
    @Override
    public List<Reportes> consultarGRL() {
        List<Reportes> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select * from reportes";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {

                datos.add(new Reportes( rs.getInt("id_R"), rs.getString("Correo_U"), rs.getString("Nombre_R"), rs.getString("Laboratorio"), rs.getString("Especificaciones"),
                        rs.getString("Tipo"), rs.getString("Fecha"), rs.getString("Hora_E"), rs.getString("Hora_S"), rs.getBytes("Archivos"),rs.getString("Permitir")));
            }

            con.close();
        } catch (ClassNotFoundException | SQLException e) {

        }
        return datos;
    }
    
    // muestra los reportes compartidos con los encargados de laboratorios
      public List<Reportes> Encargados() {
        List<Reportes> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select * from reportes where Permitir ='Si'";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {

               datos.add(new Reportes( rs.getInt("id_R"), rs.getString("Correo_U"), rs.getString("Nombre_R"), rs.getString("Laboratorio"), rs.getString("Especificaciones"),
                        rs.getString("Tipo"), rs.getString("Fecha"), rs.getString("Hora_E"), rs.getString("Hora_S"), rs.getBytes("Archivos"),rs.getString("Permitir")));
            }

            con.close();
        } catch (ClassNotFoundException | SQLException e) {

        }
        return datos;
    }
    
      
      //Muestra los reportes que un usuario tiene
     @Override
    public List<Reportes> consultar(String Correo) {
        List<Reportes> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select * from reportes where Correo_U =?";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            pst.setString(1, Correo);
            rs = pst.executeQuery();
            while (rs.next()) {

               datos.add(new Reportes( rs.getInt("id_R"), rs.getString("Correo_U"), rs.getString("Nombre_R"), rs.getString("Laboratorio"), rs.getString("Especificaciones"),
                        rs.getString("Tipo"), rs.getString("Fecha"), rs.getString("Hora_E"), rs.getString("Hora_S"), rs.getBytes("Archivos"),rs.getString("Permitir")));
            }

            con.close();
        } catch (ClassNotFoundException | SQLException e) {

        }
        return datos;
    }
    
    //sirve para dar los datos que el usuario quiera actualizar esos datos iran en el form
       public List<Reportes> ConsultarID(String id) {
        List<Reportes> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select * from reportes where id_R =?";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {

               datos.add(new Reportes( rs.getInt("id_R"), rs.getString("Correo_U"), rs.getString("Nombre_R"), rs.getString("Laboratorio"), rs.getString("Especificaciones"),
                        rs.getString("Tipo"), rs.getString("Fecha"), rs.getString("Hora_E"), rs.getString("Hora_S"), rs.getBytes("Archivos"),rs.getString("Permitir")));
            }

            con.close();
        } catch (ClassNotFoundException | SQLException e) {

        }
        return datos;
    }
//    
    
  
    public List<Reportes> Buscar(String Correo, String Nom) {
        List<Reportes> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select * from reportes where Correo_U like ? and Nombre_R like ?";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            pst.setString(1, Correo);
            pst.setString(2, Nom);
            rs = pst.executeQuery();
            while (rs.next()) {

               datos.add(new Reportes( rs.getInt("id_R"), rs.getString("Correo_U"), rs.getString("Nombre_R"), rs.getString("Laboratorio"), rs.getString("Especificaciones"),
                        rs.getString("Tipo"), rs.getString("Fecha"), rs.getString("Hora_E"), rs.getString("Hora_S"), rs.getBytes("Archivos"),rs.getString("Permitir")));
            }

            con.close();
        } catch (ClassNotFoundException | SQLException e) {

        }
        return datos;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


    @Override
    public String Actualizar(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String Eliminar(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   

    @Override
    public List<?> consultarGRL2() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<?> consultar(int Criterio) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

  

    @Override
    public List<?> trigger() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String Insertar(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


}
