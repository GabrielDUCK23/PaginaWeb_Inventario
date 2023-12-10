/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelado;

import UML.Materiales;
import UML.Solicitud;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author netor
 */
public class DAO_Materiales implements Operaciones {

    Database db = new Database();

    @Override
    /**
     * Inserta un nuevo material en la base de datos.
     *
     * @param obj Objeto de tipo Materiales que contiene los datos del nuevo
     * material a insertar.
     * @return Un mensaje que indica el resultado de la operación de inserción.
     */
    public String Insertar(Object obj) {
        Materiales m = (Materiales) obj;
        Connection con = null;
        PreparedStatement pst = null;
        String sql = "INSERT INTO material(Id_M, Nombre_Material, Marca, Cantidad, Lote, Clasificacion, Formula, Cantidad_Total, Tipo) VALUES(null,?,?,?,?,?,?,?,?)";
        String respuesta = "";

        try {
            // Cargar la clase del controlador de la base de datos
            Class.forName(db.getDriver());

            // Establecer la conexión con la base de datos
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());

            // Preparar una declaración para configurar el conjunto de caracteres UTF-8 en la conexión
            pst = con.prepareStatement("SET NAMES utf8mb4");
            pst.executeUpdate(); // Ejecutar la configuración

            // Preparar una declaración para la inserción del nuevo material
            pst = con.prepareStatement(sql);
            pst.setString(1, m.getNombre());
            pst.setString(2, m.getMarca());
            pst.setString(3, m.getCantidad());
            pst.setString(4, m.getLote());
            pst.setString(5, m.getClasificacion());
            pst.setString(6, m.getFormula());
            pst.setInt(7, m.getCantidad_Total());
            pst.setString(8, m.getTipo());

            // Ejecutar la inserción y obtener el número de filas afectadas
            int filas = pst.executeUpdate();
            respuesta = "Se registró un nuevo material";
        } catch (ClassNotFoundException | SQLException e) {
            // Manejo de excepciones en caso de error
        } finally {
            try {
                // Cerrar la conexión
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                // Manejo de excepciones en caso de error al cerrar
            }
        }

        // Devolver el mensaje de respuesta
        return respuesta;
    }

    @Override
    public String Actualizar(Object obj) {
        Materiales m = (Materiales) obj;
        Connection con = null;
        PreparedStatement pst = null;
        String sql = "UPDATE material SET Nombre_Material=?, Marca=?, Cantidad=?, Lote=?, Clasificacion=?, Formula=?, Cantidad_Total=?, Tipo=? WHERE Id_M=?";
        String respuesta = "";

        try {
            // Cargar la clase del controlador de la base de datos
            Class.forName(db.getDriver());

            // Establecer la conexión con la base de datos
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());

            // Preparar una declaración para configurar el conjunto de caracteres UTF-8 en la conexión
            pst = con.prepareStatement("SET NAMES utf8mb4");
            pst.executeUpdate(); // Ejecutar la configuración

            // Preparar una declaración para la actualización del material
            pst = con.prepareStatement(sql);
            pst.setString(1, m.getNombre());
            pst.setString(2, m.getMarca());
            pst.setString(3, m.getCantidad());
            pst.setString(4, m.getLote());
            pst.setString(5, m.getClasificacion());
            pst.setString(6, m.getFormula());
            pst.setInt(7, m.getCantidad_Total());
            pst.setString(8, m.getTipo());
            pst.setInt(9, m.getId());

            // Ejecutar la actualización y obtener el número de filas afectadas
            int filas = pst.executeUpdate();
            respuesta = "Se actualizo el material: "+m.getNombre();
        } catch (ClassNotFoundException | SQLException e) {
            // Manejo de excepciones en caso de error
        } finally {
            try {
                // Cerrar la conexión
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                // Manejo de excepciones en caso de error al cerrar
            }
        }

        // Devolver el mensaje de respuesta
        return respuesta;
    }

    //Consulta general de todos los datos
    @Override
    public List<Materiales> consultarGRL() {
        List<Materiales> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select * from material";

        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {

                datos.add(new Materiales(rs.getInt("Id_M"), rs.getInt("Cantidad_Total"), rs.getString("Nombre_Material"), rs.getString("Marca"), rs.getString("Cantidad"), rs.getString("Lote"), rs.getString("Clasificacion"), rs.getString("Formula"), rs.getString("Tipo")));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return datos;
    }

    public List<Materiales> Seleccion() {
        List<Materiales> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select Nombre_Material,Tipo,Cantidad_Total from material";

        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {

       datos.add(new Materiales(rs.getString("Nombre_Material"),rs.getString("Tipo"),rs.getInt("Cantidad_Total")));

            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return datos;
    }
//    public List<?> BuscarMaterial(String Criterio) {
//        List<Materiales> datos = new ArrayList();
//        Connection con;
//        PreparedStatement pst = null;
//        ResultSet rs;
//        String sql = "select * from material where Nombre_Material like ?";
//        try {
//            Class.forName(db.getDriver());
//            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
//            pst = con.prepareStatement(sql);
//            pst.setString(1, "%" + Criterio + "%");
//            rs = pst.executeQuery();
//            while (rs.next()) {
//                datos.add(new Materiales(rs.getInt("Id_M"), rs.getInt("Cantidad_Total"),rs.getString("Nombre_Material"), rs.getString("Marca"), rs.getString("Cantidad"), rs.getString("Lote"), rs.getString("Clasificacion"),rs.getString("Formula"),rs.getString("Tipo")));
//            }
//            con.close();
//        } catch (ClassNotFoundException | SQLException e) {
//        }
//        return datos;
//    }
//    
    ///Sirve para mostrar un material en especifico
    public List<Materiales> ActUsuarios(int Criterio) {
        List<Materiales> datos = new ArrayList();
        Connection con;
        PreparedStatement pst = null;
        ResultSet rs;
        String sql = "select * from material where Id_M = ?";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            pst.setInt(1, Criterio);
            rs = pst.executeQuery();
            while (rs.next()) {
                datos.add(new Materiales(rs.getInt("Id_M"), rs.getInt("Cantidad_Total"), rs.getString("Nombre_Material"), rs.getString("Marca"), rs.getString("Cantidad"), rs.getString("Lote"), rs.getString("Clasificacion"), rs.getString("Formula"), rs.getString("Tipo")));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return datos;
    }

    //seleciona un material en especico. sirve para rellenar el formulario cuando se desea actualizar
    public List<Materiales> Datos(int Criterio) {
        List<Materiales> datos = new ArrayList();
        Connection con;
        PreparedStatement pst = null;
        ResultSet rs;
        String sql = "select * from material where Id_M = ?";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            pst.setString(1, "%" + Criterio + "%");
            rs = pst.executeQuery();
            while (rs.next()) {
                datos.add(new Materiales(rs.getInt("Id_M"), rs.getInt("Cantidad_Total"), rs.getString("Nombre_Material"), rs.getString("Marca"), rs.getString("Cantidad"), rs.getString("Lote"), rs.getString("Clasificacion"), rs.getString("Formula"), rs.getString("Tipo")));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return datos;
    }

    @Override
    public List<?> trigger() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<?> consultar(int Criterio) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String Eliminar(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<?> consultar(String Criterio) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<?> consultarGRL2() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
