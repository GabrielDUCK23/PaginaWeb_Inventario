/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelado;

/**
 *
 * @author netor
 */
import UML.Solicitud;
import UML.Usuarios;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Alexis9811
 */
public class DAO_Solicitud implements Operaciones {

    Database db = new Database();

    // Sirve para el ingreso de datos para las solicitudes 
    public String Insertar(Object obj) {
        DAO_Solicitud dao = new DAO_Solicitud();
        Solicitud s = (Solicitud) obj;
        Connection con;
        PreparedStatement pst;
        String sql = "insert into solicitud(Id_S,Id_Lab,Correo_U,Departamento,Lugar,Asignatura,Tipo,Descripcion,Tiempo,Responsable,Estatus,Fecha,Hora,Fecha_Entrega,Hora_Entrega,Comentarios)"
                + " values(null,?,?,?,?,?,?,?,?,?,'Pendiente',CURDATE(),DATE_FORMAT(NOW( ), \"%H:%i:%S\"),null,null,'')";
        String respuesta = "";
        try {

            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement("SET NAMES utf8mb4"); // Configuración del conjunto de caracteres UTF-8
            pst.executeUpdate(); // Ejecutar la configuración
            pst = con.prepareStatement(sql);

            pst.setString(2, s.getCorreo());
            pst.setInt(1, s.getId_L());
            pst.setString(3, s.getDepart());
            pst.setString(4, s.getDepart2());
            pst.setString(5, s.getAsig());
            pst.setString(6, s.getTipo());
            pst.setString(7, s.getDescr());
            pst.setString(8, s.getTiempo());
            pst.setString(9, s.getRespon());
            int filas = pst.executeUpdate();
            respuesta = "Tu solicitud esta en proceso";

            con.close();

        } catch (ClassNotFoundException | SQLException e) {
        }

        return respuesta;

    }

//Actualizar los datos de solicitud 
    @Override
    public String Actualizar(Object obj) {
        Solicitud s = (Solicitud) obj;
        Connection con;
        PreparedStatement pst;
        String sql = "UPDATE solicitud SET Id_Lab=?, Departamento=?, Lugar=?, Asignatura=?,Descripcion=?,Tiempo=? where Correo_U=? ";
        String respuesta = "";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(),
                    db.getUsuario(),
                    db.getContraseña());
            pst = con.prepareStatement("SET NAMES utf8mb4"); // Configuración del conjunto de caracteres UTF-8
            pst.executeUpdate(); // Ejecutar la configuración

            pst = con.prepareStatement(sql);
            pst.setString(10, s.getCorreo());
            pst.setInt(1, s.getId_L());
            pst.setString(2, s.getDepart());
            pst.setString(3, s.getDepart2());
            pst.setString(4, s.getAsig());
            pst.setString(5, s.getDescr());
            pst.setString(6, s.getTiempo());
            int filas = pst.executeUpdate();

            respuesta = "se Actualizo " + filas + "un elemeto";
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return respuesta;
    }

    //Consulta una solicitud en especifico. Sirve para poner los datos en el formulario cuando se desea actualizar
    public List<Solicitud> Consultarid(int id) throws SQLException {
        List<Solicitud> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM solicitud WHERE Id_S = ? ";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {

                datos.add(new Solicitud(rs.getInt("Id_S"), rs.getInt("Id_Lab"), rs.getString("Correo_U"), rs.getString("Departamento"), rs.getString("Lugar"), rs.getString("Asignatura"),
                        rs.getString("Responsable"), rs.getString("Tipo"), rs.getString("Descripcion"), rs.getString("Tiempo"), rs.getString("Fecha"), rs.getString("Hora"),
                        rs.getString("Estatus"), rs.getString("Fecha_Entrega"), rs.getString("Hora_Entrega"), rs.getString("Comentarios")));
            }

            con.close();
        } catch (ClassNotFoundException | SQLException e) {

        }
        return datos;
    }

    //Consulta general 
    @Override
    public List<Solicitud> consultarGRL() {
        List<Solicitud> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select laboratorios.Nombre_Lab, solicitud.* from solicitud inner join laboratorios on solicitud.Id_Lab = laboratorios.Id_Lab ORDER BY Fecha DESC,Hora DESC";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
             while (rs.next()) {
            String fecha = rs.getString("Fecha");
            SimpleDateFormat formatoEntrada = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaDate = formatoEntrada.parse(fecha);
            SimpleDateFormat formatoSalida = new SimpleDateFormat("dd-MM-yyyy");
            String fechaFormateada = formatoSalida.format(fechaDate);
            
            String fechaEntrega = rs.getString("Fecha_Entrega");
            if (fechaEntrega != null) {
                Date fechaEntregaDate = formatoEntrada.parse(fechaEntrega);
                fechaEntrega = formatoSalida.format(fechaEntregaDate);
            }
           
            datos.add(new Solicitud(rs.getString("Nombre_Lab"), rs.getInt("Id_S"), rs.getInt("Id_Lab"), rs.getString("Correo_U"), rs.getString("Departamento"), rs.getString("Lugar"), rs.getString("Asignatura"),
                    rs.getString("Responsable"), rs.getString("Tipo"), rs.getString("Descripcion"), rs.getString("Tiempo"), fechaFormateada, rs.getString("Hora"),
                    rs.getString("Estatus"), fechaEntrega, rs.getString("Hora_Entrega"), rs.getString("Comentarios")));
        }


            con.close();
        } catch (ClassNotFoundException | SQLException e) {

        } catch (ParseException ex) {
            Logger.getLogger(DAO_Solicitud.class.getName()).log(Level.SEVERE, null, ex);
        }
        return datos;
    }
    
    //muestra mas informacion sobre el usuario que agendo
        public List<Solicitud> VerMas(int id) throws ParseException {
        List<Solicitud> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT laboratorios.Nombre_Lab, solicitud.*, usuario.Nombre, usuario.Carrera, usuario.Perfil, usuario.Semestre, usuario.Codigo FROM solicitud INNER JOIN laboratorios ON solicitud.Id_Lab = laboratorios.Id_Lab INNER JOIN usuario ON solicitud.Correo_U = usuario.Correo where Id_S = ? ORDER BY Fecha DESC,Hora DESC";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            rs = pst.executeQuery();
             while (rs.next()) {
            String fecha = rs.getString("Fecha");
            SimpleDateFormat formatoEntrada = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaDate = formatoEntrada.parse(fecha);
            SimpleDateFormat formatoSalida = new SimpleDateFormat("dd-MM-yyyy");
            String fechaFormateada = formatoSalida.format(fechaDate);
            
            String fechaEntrega = rs.getString("Fecha_Entrega");
            if (fechaEntrega != null) {
                Date fechaEntregaDate = formatoEntrada.parse(fechaEntrega);
                fechaEntrega = formatoSalida.format(fechaEntregaDate);
            }
           
           datos.add(new Solicitud(rs.getString("Nombre_Lab"), rs.getInt("Id_S"), rs.getInt("Id_Lab"), rs.getString("Correo_U"), rs.getString("Departamento"), rs.getString("Lugar"), rs.getString("Asignatura"),
                        rs.getString("Responsable"), rs.getString("Tipo"), rs.getString("Descripcion"), rs.getString("Tiempo"), fechaFormateada , rs.getString("Hora"),
                        rs.getString("Estatus"),rs.getString("Hora_Entrega") ,fechaEntrega , rs.getString("Comentarios"),rs.getString("Nombre"),rs.getString("Carrera"),rs.getString("Perfil"),rs.getInt("Semestre"),rs.getInt("Codigo")));
        }


            con.close();
        } catch (ClassNotFoundException | SQLException e) {

        }
        return datos;
    }
    
    
//Muestra las solicitudes que tienes un estatus de revisando o material incompleto
    public List<Solicitud> ConsultaGralEspecifica() {
        List<Solicitud> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM solicitud WHERE Estatus = 'Revisando' OR Estatus = 'Material incompleto' ORDER BY Fecha DESC,Hora DESC";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {

                datos.add(new Solicitud(rs.getInt("Id_S"), rs.getInt("Id_Lab"), rs.getString("Correo_U"), rs.getString("Departamento"), rs.getString("Lugar"), rs.getString("Asignatura"),
                        rs.getString("Responsable"), rs.getString("Tipo"), rs.getString("Descripcion"), rs.getString("Tiempo"), rs.getString("Fecha"), rs.getString("Hora"),
                        rs.getString("Estatus"), rs.getString("Fecha_Entrega"), rs.getString("Hora_Entrega"), rs.getString("Comentarios")));
            }

            con.close();
        } catch (ClassNotFoundException | SQLException e) {

        }
        return datos;
    }

    // muestra las solicitudes pendientes
    public List<Solicitud> ConsultaGralEspecifica1() throws ParseException {
        List<Solicitud> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select laboratorios.Nombre_Lab, solicitud.* from solicitud inner join laboratorios on solicitud.Id_Lab = laboratorios.Id_Lab WHERE Estatus = 'Pendiente' ORDER BY Fecha DESC,Hora DESC";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
              while (rs.next()) {
            String fecha = rs.getString("Fecha");
            SimpleDateFormat formatoEntrada = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaDate = formatoEntrada.parse(fecha);
            SimpleDateFormat formatoSalida = new SimpleDateFormat("dd-MM-yyyy");
            String fechaFormateada = formatoSalida.format(fechaDate);
            
            String fechaEntrega = rs.getString("Fecha_Entrega");
            if (fechaEntrega != null) {
                Date fechaEntregaDate = formatoEntrada.parse(fechaEntrega);
                fechaEntrega = formatoSalida.format(fechaEntregaDate);
            }
           
            datos.add(new Solicitud(rs.getString("Nombre_Lab"), rs.getInt("Id_S"), rs.getInt("Id_Lab"), rs.getString("Correo_U"), rs.getString("Departamento"), rs.getString("Lugar"), rs.getString("Asignatura"),
                    rs.getString("Responsable"), rs.getString("Tipo"), rs.getString("Descripcion"), rs.getString("Tiempo"), fechaFormateada, rs.getString("Hora"),
                    rs.getString("Estatus"), fechaEntrega, rs.getString("Hora_Entrega"), rs.getString("Comentarios")));
        }


            con.close();
        } catch (ClassNotFoundException | SQLException e) {

        }
        return datos;
    }

    public String Codigo(String user) throws SQLException {
        Usuarios a = new Usuarios();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql = "select * from usuario where Codigo=?";

        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            pst.setString(1, user);
            rs = pst.executeQuery();
            if (rs.absolute(1)) {
                user = rs.getString("Codigo");
                return user;
            }

        } catch (ClassNotFoundException | SQLException e) {
            System.err.print("error" + e);
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                System.err.print("error" + e);
            }
        }
        return "";
    }

    // Consultar todas las solicitudes de un usuario en general 
    public List<Solicitud> consultar(String Criterio) {
        List<Solicitud> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select laboratorios.Nombre_Lab, solicitud.* from solicitud inner join laboratorios on solicitud.Id_Lab = laboratorios.Id_Lab WHERE Correo_U LIKE '%" + Criterio + "%' ORDER BY Fecha DESC, Hora DESC";

        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
          while (rs.next()) {
            String fecha = rs.getString("Fecha");
            SimpleDateFormat formatoEntrada = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaDate = formatoEntrada.parse(fecha);
            SimpleDateFormat formatoSalida = new SimpleDateFormat("dd-MM-yyyy");
            String fechaFormateada = formatoSalida.format(fechaDate);
            
            String fechaEntrega = rs.getString("Fecha_Entrega");
            if (fechaEntrega != null) {
                Date fechaEntregaDate = formatoEntrada.parse(fechaEntrega);
                fechaEntrega = formatoSalida.format(fechaEntregaDate);
            }
           
            datos.add(new Solicitud(rs.getString("Nombre_Lab"), rs.getInt("Id_S"), rs.getInt("Id_Lab"), rs.getString("Correo_U"), rs.getString("Departamento"), rs.getString("Lugar"), rs.getString("Asignatura"),
                    rs.getString("Responsable"), rs.getString("Tipo"), rs.getString("Descripcion"), rs.getString("Tiempo"), fechaFormateada, rs.getString("Hora"),
                    rs.getString("Estatus"), fechaEntrega, rs.getString("Hora_Entrega"), rs.getString("Comentarios")));
        }


            con.close();
        } catch (ClassNotFoundException | SQLException e) {

        } catch (ParseException ex) {
            Logger.getLogger(DAO_Solicitud.class.getName()).log(Level.SEVERE, null, ex);
        }
        return datos;
    }
    
    
        // Consultar todas las solicitudes de un usuario en general 
    public List<Solicitud> consultarVista(int Criterio) {
        List<Solicitud> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select laboratorios.Nombre_Lab, solicitud.* from solicitud inner join laboratorios on solicitud.Id_Lab = laboratorios.Id_Lab WHERE Id_S LIKE '%" + Criterio + "%';";

        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
          while (rs.next()) {
            String fecha = rs.getString("Fecha");
            SimpleDateFormat formatoEntrada = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaDate = formatoEntrada.parse(fecha);
            SimpleDateFormat formatoSalida = new SimpleDateFormat("dd-MM-yyyy");
            String fechaFormateada = formatoSalida.format(fechaDate);
            
            String fechaEntrega = rs.getString("Fecha_Entrega");
            if (fechaEntrega != null) {
                Date fechaEntregaDate = formatoEntrada.parse(fechaEntrega);
                fechaEntrega = formatoSalida.format(fechaEntregaDate);
            }
           
            datos.add(new Solicitud(rs.getString("Nombre_Lab"), rs.getInt("Id_S"), rs.getInt("Id_Lab"), rs.getString("Correo_U"), rs.getString("Departamento"), rs.getString("Lugar"), rs.getString("Asignatura"),
                    rs.getString("Responsable"), rs.getString("Tipo"), rs.getString("Descripcion"), rs.getString("Tiempo"), fechaFormateada, rs.getString("Hora"),
                    rs.getString("Estatus"), fechaEntrega, rs.getString("Hora_Entrega"), rs.getString("Comentarios")));
        }


            con.close();
        } catch (ClassNotFoundException | SQLException e) {

        } catch (ParseException ex) {
            Logger.getLogger(DAO_Solicitud.class.getName()).log(Level.SEVERE, null, ex);
        }
        return datos;
    }

//Sirve para filtrar el estatus de la solicitud 
//    public List<Solicitud> Filtrar(String Correo,String Criterio) throws ParseException {
//        List<Solicitud> datos = new ArrayList();
//        Connection con;
//        PreparedStatement pst;
//        ResultSet rs;
//        String sql = "select laboratorios.Nombre_Lab, solicitud.* from solicitud inner join laboratorios on solicitud.Id_Lab = laboratorios.Id_Lab where Correo_U =? and  Estatus =? ORDER BY Fecha DESC,Hora DESC";
//
//        try {
//            Class.forName(db.getDriver());
//            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
//            pst = con.prepareStatement(sql);
//            pst.setString(1, Correo);
//            pst.setString(2, Criterio);
//            rs = pst.executeQuery();
//            
//              while (rs.next()) {
//            String fecha = rs.getString("Fecha");
//            SimpleDateFormat formatoEntrada = new SimpleDateFormat("yyyy-MM-dd");
//            Date fechaDate = formatoEntrada.parse(fecha);
//            SimpleDateFormat formatoSalida = new SimpleDateFormat("dd-MM-yyyy");
//            String fechaFormateada = formatoSalida.format(fechaDate);
//            
//            String fechaEntrega = rs.getString("Fecha_Entrega");
//            if (fechaEntrega != null) {
//                Date fechaEntregaDate = formatoEntrada.parse(fechaEntrega);
//                fechaEntrega = formatoSalida.format(fechaEntregaDate);
//            }
//           
//            datos.add(new Solicitud(rs.getString("Nombre_Lab"), rs.getInt("Id_S"), rs.getInt("Id_Lab"), rs.getString("Correo_U"), rs.getString("Departamento"), rs.getString("Lugar"), rs.getString("Asignatura"),
//                    rs.getString("Responsable"), rs.getString("Tipo"), rs.getString("Descripcion"), rs.getString("Tiempo"), fechaFormateada, rs.getString("Hora"),
//                    rs.getString("Estatus"), fechaEntrega, rs.getString("Hora_Entrega"), rs.getString("Comentarios")));
//        }
//
//            con.close();
//        } catch (ClassNotFoundException | SQLException e) {
//        }
//        return datos;
//    }
    
    
//    
//     public List<Solicitud> FiltrarTodos(String Criterio) throws ParseException {
//        List<Solicitud> datos = new ArrayList();
//        Connection con;
//        PreparedStatement pst;
//        ResultSet rs;
//        String sql = "select laboratorios.Nombre_Lab, solicitud.* from solicitud inner join laboratorios on solicitud.Id_Lab = laboratorios.Id_Lab where Estatus =? ORDER BY Fecha DESC,Hora DESC";
//
//        try {
//            Class.forName(db.getDriver());
//            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
//            pst = con.prepareStatement(sql);
//            pst.setString(1, Criterio);
//            rs = pst.executeQuery();
//              while (rs.next()) {
//            String fecha = rs.getString("Fecha");
//            SimpleDateFormat formatoEntrada = new SimpleDateFormat("yyyy-MM-dd");
//            Date fechaDate = formatoEntrada.parse(fecha);
//            SimpleDateFormat formatoSalida = new SimpleDateFormat("dd-MM-yyyy");
//            String fechaFormateada = formatoSalida.format(fechaDate);
//            
//            String fechaEntrega = rs.getString("Fecha_Entrega");
//            if (fechaEntrega != null) {
//                Date fechaEntregaDate = formatoEntrada.parse(fechaEntrega);
//                fechaEntrega = formatoSalida.format(fechaEntregaDate);
//            }
//           
//            datos.add(new Solicitud(rs.getString("Nombre_Lab"), rs.getInt("Id_S"), rs.getInt("Id_Lab"), rs.getString("Correo_U"), rs.getString("Departamento"), rs.getString("Lugar"), rs.getString("Asignatura"),
//                    rs.getString("Responsable"), rs.getString("Tipo"), rs.getString("Descripcion"), rs.getString("Tiempo"), fechaFormateada, rs.getString("Hora"),
//                    rs.getString("Estatus"), fechaEntrega, rs.getString("Hora_Entrega"), rs.getString("Comentarios")));
//        }
//
//            con.close();
//        } catch (ClassNotFoundException | SQLException e) {
//        }
//        return datos;
//    }

    //metodo que actualiza la tabla de solicitud en el apartado estatus a revisando. 
     //Sirve cuando el usuario entrega el material prestado para el cambio de estatus.
    public String Entregar(int Cri) {
        List<Solicitud> datos = new ArrayList();
        Solicitud s = new Solicitud();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String respuesta = "";
        String sql = "UPDATE solicitud SET Estatus='Revisando' where Id_S like '%" + Cri + "%'";

        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(),
                    db.getUsuario(),
                    db.getContraseña());
            pst = con.prepareStatement("SET NAMES utf8mb4"); // Configuración del conjunto de caracteres UTF-8
            pst.executeUpdate(); // Ejecutar la configuración
            pst = con.prepareStatement(sql);
            int filas = pst.executeUpdate();
            respuesta = "Se ha actualizado el estatus de la solicitud a:"+Cri;
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return respuesta;
    }

    //Cancela las solicitudes de material 
    public String Cancelar(int Cri) {
        List<Solicitud> datos = new ArrayList();
        Solicitud s = new Solicitud();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String respuesta = "";
        String sql = "UPDATE solicitud SET Estatus='Cancelada' where Id_S like '%" + Cri + "%'";

        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(),
                    db.getUsuario(),
                    db.getContraseña());
            pst = con.prepareStatement("SET NAMES utf8mb4"); // Configuración del conjunto de caracteres UTF-8
            pst.executeUpdate(); // Ejecutar la configuración
            pst = con.prepareStatement(sql);

            int filas = pst.executeUpdate();
            respuesta = "Se ha cancelado tu solicitud";
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return respuesta;
    }

//metodo que actualiza la tabla de solicitud pero utilizando una funcion almacenada. Por el lado del SuperUsuario
    public String EntregarMaterial(Object obj) {
        Solicitud s = (Solicitud) obj;
        Connection con;
        PreparedStatement pst;
        String sql = "call EntregaMaterial(?,?,?)";
        String respuesta = "";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(),
                    db.getUsuario(),
                    db.getContraseña());

            pst = con.prepareStatement("SET NAMES utf8mb4"); // Configuración del conjunto de caracteres UTF-8
            pst.executeUpdate(); // Ejecutar la configuración
            pst = con.prepareStatement(sql);
            pst.setInt(3, s.getId_S());
            pst.setString(1, s.getEstatus());
            pst.setString(2, s.getCom());
            int filas = pst.executeUpdate();

            respuesta = "Se ha actualizado el estatus del usuario a: "+s.getEstatus();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return respuesta;
    }


    @Override
    public List<?> consultarGRL2() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String Eliminar(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<?> trigger() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private File File(String string) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<?> consultar(int Criterio) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}


//--------- Codigo inutil pero que puede servir despues-------------------------------


//    public String Archivos(int Sol) throws IOException {
//        List<Solicitud> datos = new ArrayList();
//        Connection con;
//        PreparedStatement pst;
//        ResultSet rs;
////        String sql = "select * from solicitud where Id_S like '%"+Sol+  "%'"; 
//        String sql = "select solicitud.*, Nombre, Carrera, Correo  from usuario inner join solicitud on usuario.Codigo = solicitud.Codigo_U where Id_S like '%" + Sol + "%' ";
//
//        try {
//
//            Class.forName(db.getDriver());
//            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
//            pst = con.prepareStatement(sql);
//            rs = pst.executeQuery();
//
//            while (rs.next()) {
//
//                datos.add(new Solicitud(rs.getInt("Id_S"), rs.getInt("Id_Lab"), rs.getString("Correo_U"), rs.getString("Departamento"), rs.getString("Lugar"), rs.getString("Asignatura"),
//                        rs.getString("Responsable"), rs.getString("Tipo"), rs.getString("Descripcion"), rs.getString("Tiempo"), rs.getString("Fecha"), rs.getString("Hora"),
//                        rs.getString("Estatus"), rs.getString("Fecha_Entrega"), rs.getString("Hora_Entrega"), rs.getString("Comentarios"),
//                        rs.getString("Nombre"), rs.getString("Carrera")));
//            }
//            con.close();
//
//            for (Solicitud s : datos) {
//
//                FileWriter archivo = new FileWriter("C:\\Users\\netor\\OneDrive\\Escritorio\\archivos\\" + s.getCorreo() + "  " + s.getId_S() + ".txt");
//
//                archivo.write("Id Solicitud:" + s.getId_S() + "\nId de Laboratorio:" + s.getId_L() + "\nLugar donde estara el material:" + s.getDepart() + s.getDepart2()
//                        + "\n Asignatura:" + s.getAsig() + "\nTipo de material:" + s.getTipo() + "\nDescripcion:" + s.getDescr()
//                        + "\nTiempo que dentra la solicitud: " + s.getTiempo() + "\nProfesor Responsable: " + s.getRespon() + "Estatus de la solicitud" + s.getEstatus()
//                        + "\nFecha en que se hizo la solicitud: " + s.getFecha() + "\nHora en que se hizo la solicitud: " + s.getHora() + "\nFecha de entrega: " + s.getFecha_E() + "\nHora de entrega: " + s.getHora_E()
//                        + "\nComentarios sobre el material: " + s.getCom()
//                        + "\nDatos del Estudiante:\n" + "\nCodigo del estudiante: " + s.getCorreo() + "\nNombre del Estudiante:" + s.getNombre() + "\nCorreo del estudiante:" + s.getCarrera() + "\nCarrera: " + s.getCorreo());
//                archivo.close();
//            }
//
//        } catch (ClassNotFoundException | SQLException e) {
//        }
//        return "";
//
//    }
//
//    public String ArchivosExcel() throws IOException, SQLException {
//        try {
//            Connection con;
//            PreparedStatement pst;
//            ResultSet rs;
//            try ( // Configuración de la conexión a la base de datos
//                    XSSFWorkbook workbook = new XSSFWorkbook()) {
//                XSSFSheet sheet = workbook.createSheet("Resultados");
//                //Titulo de excel
//                String[] cabecera = new String[]{"Nombre del Usuario", "Id solicitud", "Codigo de usuario", "id Laboratorio", "Departamento", "Lugar",
//                    "Asignatura", "Tipo", "Descripcion", "Tiempo que tendran el material", "Maestro responsable", "Estatus", "Fecha de realizacion de la solicitud",
//                    "Hora de la realizacion de la solicitud", "Fecha de entrega de la solicitud", "Hora de entrega de la solicitud",
//                    "Comentario del encargado del laboratorio", "Nombre del laboratorio"};
//                CellStyle headerStyle = workbook.createCellStyle();
//                headerStyle.setFillForegroundColor(IndexedColors.LIGHT_BLUE.getIndex());
//                headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
//                headerStyle.setBorderBottom(BorderStyle.THIN);
//                headerStyle.setBorderLeft(BorderStyle.THIN);
//                headerStyle.setBorderRight(BorderStyle.THIN);
//                headerStyle.setBorderBottom(BorderStyle.THIN);
//                Font font = workbook.createFont();
//                font.setFontName("Arial");
//                font.setBold(true);
//                font.setColor(IndexedColors.WHITE.getIndex());
//                font.setFontHeightInPoints((short) 12);
//                headerStyle.setFont(font);
//                Row filaEncabezados = sheet.createRow(1);
//                for (int i = 0; i < cabecera.length; i++) {
//                    Cell celdaEnzabezado = filaEncabezados.createCell(i);
//                    celdaEnzabezado.setCellStyle(headerStyle);
//                    celdaEnzabezado.setCellValue(cabecera[i]);
//                }
//                // Consulta SQL para obtener los datos
////        String query = "SELECT * FROM usuario";
////        Statement stmt = con.createStatement();
////        rs = stmt.executeQuery(query);
//                String sql = "select usuario.Nombre, solicitud.*, laboratorios.Nombre_lab from usuario inner join solicitud on usuario.Codigo = solicitud.Codigo_U inner join laboratorios on laboratorios.Id_Lab = solicitud.Id_Lab;";
//                Class.forName(db.getDriver());
//                con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
//                pst = con.prepareStatement(sql);
//                rs = pst.executeQuery();
//// Creación del archivo Excel
//                int rowNum = 2;
//                while (rs.next()) {
//                    Row row = sheet.createRow(rowNum++);
//                    int colNum = 0;
//                    while (colNum < 18) {
//                        Cell cell = row.createCell(colNum++);
//                        cell.setCellValue(rs.getString(colNum));
//                    }
//                }
//// Guardar el archivo Excel en disco
//                FileOutputStream outputStream = new FileOutputStream("C:\\Users\\netor\\OneDrive\\Escritorio\\Solicitudes.xlsx");
//                workbook.write(outputStream);
//            }
//
//// Cerrar la conexión a la base de datos y liberar los recursos
//            rs.close();
//            pst.close();
//            con.close();
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(DAO_Usuario.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
//    }