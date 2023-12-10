/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelado;

import UML.Laboratorio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.mail.internet.ParseException;

public class DAO_Laboratorio implements Operaciones {

    Database db = new Database();

    //Registra nuevos laboratorios
    @Override
    public String Insertar(Object obj) {
        Laboratorio a = (Laboratorio) obj;
        Connection con;
        PreparedStatement pst;
        String sql = "insert into laboratorios() values(null,?,?)";
        String respuesta = "";
        try {
            // Cargar la clase del controlador de la base de datos
            Class.forName(db.getDriver());
             // Establecer la conexión con la base de datos utilizando la información de conexión proporcionada
con = DriverManager.getConnection(db.getUrl() + "?useUnicode=true&characterEncoding=UTF-8", db.getUsuario(), db.getContraseña());
            // Preparar una declaración para la inserción utilizando la consulta SQL definida
            pst = con.prepareStatement("SET NAMES utf8mb4"); // Configuración del conjunto de caracteres UTF-8
            pst.executeUpdate(); // Ejecutar la configuración
            pst = con.prepareStatement(sql);
            pst.setString(1, a.getNom());
            pst.setString(2, a.getEnca());
            // Ejecutar la inserción y obtener la cantidad de filas afectadas
            int filas = pst.executeUpdate();
            respuesta = "se registro un nuevo laboratorios";
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return respuesta;
    }

    //Actualiza los datos de laboratorio
    @Override
    public String Actualizar(Object obj) {
        Laboratorio a = (Laboratorio) obj;
        Connection con;
        PreparedStatement pst;
        String sql = "UPDATE laboratorios set Nombre_lab= ? , Correo_E= ? where Id_Lab= ?";
        String respuesta = "";
        try {
             // Cargar la clase del controlador de la base de datos
            Class.forName(db.getDriver());
             // Establecer la conexión con la base de datos utilizando la información de conexión proporcionada
con = DriverManager.getConnection(db.getUrl() + "?useUnicode=true&characterEncoding=UTF-8", db.getUsuario(), db.getContraseña());
            // Preparar una declaración para la inserción utilizando la consulta SQL definida
            pst = con.prepareStatement("SET NAMES utf8mb4"); // Configuración del conjunto de caracteres UTF-8
            pst.executeUpdate(); // Ejecutar la configuración
            pst = con.prepareStatement(sql);
            pst.setString(1, a.getNom());
            pst.setString(2, a.getEnca());
            pst.setInt(3, a.getIdL());
              // Ejecutar la inserción y obtener la cantidad de filas afectadas
            int filas = pst.executeUpdate();
            respuesta = "Se actualizo el laboratorio: "+a.getNom();
            con.close();

        } catch (ClassNotFoundException | SQLException e) {
        }
        return respuesta;

    }
//Hace una consulta general de todos los laboratorios con todos sus datos
    @Override
    public List<Laboratorio> consultarGRL() {
        List<Laboratorio> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select Id_Lab,Nombre_lab, Correo_E, usuario.Nombre from laboratorios inner join usuario on laboratorios.Correo_E = usuario.Correo;";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                datos.add(new Laboratorio(rs.getInt("Id_Lab"), rs.getString("Nombre_lab"), rs.getString("Correo_E"), rs.getString("Nombre")));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return datos;

    }
    
   //Hace una consulta en especifico por medio de id 
       public List<Laboratorio> consultarid(int id) {
        List<Laboratorio> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select * from laboratorios where Id_Lab=?";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                datos.add(new Laboratorio(rs.getInt("Id_Lab"), rs.getString("Nombre_lab"), rs.getString("Correo_E")));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return datos;

    }
    
    //Hace una consulta general de todos los laboratorios solo mosntrando el id y el nombre de laboratorio. esto siver para mostrarlo como seleccion en algunos form 
       public List<Laboratorio> DatosLAb() {
        List<Laboratorio> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select Id_Lab, Nombre_lab from laboratorios";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                datos.add(new Laboratorio(rs.getInt("Id_Lab"),rs.getString("Nombre_lab")));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return datos;

    }

       //Sirve para agendar laboratorios 
    public String Agendar(Object obj) {
        Laboratorio a = (Laboratorio) obj;
        Connection con;
        PreparedStatement pst;
        String sql = "insert into agendar_lab values(null,?,?,?,?,'Agendado')";
        String respuesta = "";

        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
    pst = con.prepareStatement("SET NAMES utf8mb4"); // Configuración del conjunto de caracteres UTF-8
            pst.executeUpdate(); // Ejecutar la configuración
            pst = con.prepareStatement(sql);
            pst.setInt(1, a.getLab());
            pst.setString(2, a.getCorreo());
            pst.setString(3, a.getDia());
            pst.setString(4, a.getHora_I()); 
         

            int filas = pst.executeUpdate();
            respuesta = "Se agendo correctamente el laboratorio";
            con.close();

        } catch (ClassNotFoundException | SQLException e) {
        }
        return respuesta;
    }
    
    //Sirve para cancelar algun laboratorio ya agendado 
    public String Cancelar(int ID) {    
        Connection con;
        PreparedStatement pst;
        String sql = "UPDATE agendar_lab set Estatus='Cancelada' where id_R= ?";
        String respuesta = "";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement("SET NAMES utf8mb4"); // Configuración del conjunto de caracteres UTF-8
            pst.executeUpdate(); // Ejecutar la configuración
            pst = con.prepareStatement(sql);
            pst.setInt(1, ID);
            int filas = pst.executeUpdate();
            respuesta = "Se ha cancelado tu cita en el laboratorio";
            con.close();

        } catch (ClassNotFoundException | SQLException e) {
        }
        return respuesta;

    } 
    
    
    
    
    
//Verifica que el laboratorio esta agendado 
 public boolean verificar(String dia, String hora,int Lab) throws ClassNotFoundException {
    boolean disponible = true;
    Laboratorio a = new Laboratorio();
    Connection con;
    PreparedStatement pst;
    ResultSet rs = null;
    String sql = "SELECT * FROM agendar_lab WHERE Dia=? AND Hora=? and Lab=? AND Estatus != 'Cancelada' ORDER BY Dia DESC";
    try {
        Class.forName(db.getDriver());
        con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
        pst = con.prepareStatement(sql);

        pst.setString(1, dia);
        pst.setString(2, hora);
        pst.setInt(3, Lab);
        // Ejecutar la consulta y obtener el ResultSet
        rs = pst.executeQuery();
        // Si se encontró una fila que coincide con la fecha y hora ingresadas y el estatus no está cancelado, la fecha y hora están disponibles
        if (rs.next()) {
            disponible = false;
        }
    } catch (SQLException e) {
        // Manejo de excepciones
        e.printStackTrace();
    }
    return disponible;
}
//muestra la agenda de los laboratorios agendados 
    public List<Laboratorio> LabAgendados() throws java.text.ParseException {
        List<Laboratorio> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT laboratorios.Nombre_lab, agendar_lab.Dia, agendar_lab.Hora FROM laboratorios INNER JOIN agendar_lab ON laboratorios.Id_Lab = agendar_lab.Lab \n" +
"WHERE agendar_lab.Dia BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY) AND agendar_lab.Estatus = 'Agendado'ORDER BY agendar_lab.Dia ASC, agendar_lab.Hora ASC;";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                //estas 4 lineas siguientes sirven para modificar la fecha en un formato DD-MM-YYYY ya que la base de datos la muestre YYYY-MM-DD
                String fecha = rs.getString("Dia");
                SimpleDateFormat formatoEntrada = new SimpleDateFormat("yyyy-MM-dd");
                Date fechaDate = formatoEntrada.parse(fecha);
                SimpleDateFormat formatoSalida = new SimpleDateFormat("dd-MM-yyyy");
                String fechaFormateada = formatoSalida.format(fechaDate);
                datos.add(new Laboratorio(rs.getString("Nombre_lab"), fechaFormateada, rs.getString("Hora")));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return datos;
    }
    
    
    
    //lo mismo de arriba 
    public List<Laboratorio> TodasAgendas() throws java.text.ParseException {
        List<Laboratorio> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT laboratorios.Nombre_lab, agendar_lab.* FROM laboratorios  INNER JOIN agendar_lab ON laboratorios.Id_Lab = agendar_lab.Lab where Estatus='Agendado'  ORDER BY Dia DESC";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
           while (rs.next()) {
                String fecha = rs.getString("Dia");
                SimpleDateFormat formatoEntrada = new SimpleDateFormat("yyyy-MM-dd");
                Date fechaDate = formatoEntrada.parse(fecha);
                SimpleDateFormat formatoSalida = new SimpleDateFormat("dd-MM-yyyy");
                String fechaFormateada = formatoSalida.format(fechaDate);
                datos.add(new Laboratorio(rs.getString("Correo"),rs.getString("Nombre_lab"), fechaFormateada, rs.getString("Hora"),rs.getString("Estatus")));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return datos;
    }
  
// public List<Laboratorio> Filtroagenda( String Dia, String Hora, int id) throws java.text.ParseException {
//    List<Laboratorio> datos = new ArrayList();
//    Connection con = null;
//    PreparedStatement pst = null;
//    ResultSet rs = null;
//    String sql = "SELECT laboratorios.Nombre_lab,  agendar_lab.* FROM laboratorios INNER JOIN agendar_lab ON laboratorios.Id_Lab = agendar_lab.Lab WHERE Dia = ? AND Hora = ? AND Estatus = 'Agendado' AND Lab = ?  ORDER BY Dia DESC";
//    try {
//        Class.forName(db.getDriver());
//        con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
//        pst = con.prepareStatement(sql);
//        pst.setString(1, Dia);
//        pst.setString(2, Hora);
//        pst.setInt(3, id);
//        rs = pst.executeQuery();
//        while (rs.next()) {
//            String fecha = rs.getString("Dia");
//            SimpleDateFormat formatoEntrada = new SimpleDateFormat("yyyy-MM-dd");
//            Date fechaDate = formatoEntrada.parse(fecha);
//            SimpleDateFormat formatoSalida = new SimpleDateFormat("dd-MM-yyyy");
//            String fechaFormateada = formatoSalida.format(fechaDate);
//               datos.add(new Laboratorio(rs.getInt("Id_R"),rs.getInt("Lab"),rs.getString("Correo"), fechaFormateada, rs.getString("Hora"),rs.getString("Nombre_lab"),rs.getString("Estatus")));
//        }
//    } catch (ClassNotFoundException | SQLException e) {
//        e.printStackTrace();
//    } finally {
//        try {
//            if (rs != null) rs.close();
//            if (pst != null) pst.close();
//            if (con != null) con.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
//    return datos;
//}
    
   //muestra la agenda individual de cada usuario.
      public List<Laboratorio> AgendaIndividual(String Correo) {
        List<Laboratorio> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT laboratorios.Nombre_lab, agendar_lab.* FROM laboratorios INNER JOIN agendar_lab ON laboratorios.Id_Lab = agendar_lab.Lab WHERE agendar_lab.Correo=? AND agendar_lab.Dia BETWEEN CURDATE() + INTERVAL 1 DAY AND CURDATE() + INTERVAL 7 DAY AND agendar_lab.Estatus = 'Agendado' ORDER BY Dia DESC";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
             pst.setString(1, Correo);
            rs = pst.executeQuery();
            while (rs.next()) {
                datos.add(new Laboratorio(rs.getInt("id_R"),rs.getString("Correo"),rs.getString("Dia"),rs.getString("Hora"),rs.getString("Nombre_lab")));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return datos;

    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    @Override

    public List<?> trigger() {
        return null;

    }

    @Override
    public String Eliminar(Object obj
    ) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public List<?> consultar(int campo, String Criterio) {
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

    @Override
    public List<?> consultar(int Criterio) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
