/*
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelado;

import UML.Carta;
import UML.Solicitud;
import UML.Usuarios;

import java.awt.Label;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.security.SecureRandom;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.Set;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
import javax.swing.JFileChooser;
//import org.hibernate.validator.constraints.Email;

/**
 *
 * /**
 *
 * @author netor
 */
public class DAO_Usuario implements Operaciones {

    Database db = new Database();
    int r = 0;

// Agrega usuarios desde el menu de superUsuario, Este codigo sirve para agregar MAestros y Encargados de laboratorios
    @Override
    public String Insertar(Object obj) {
        // Convertir el objeto genérico en un objeto Usuarios
        Usuarios a = (Usuarios) obj;
        Connection con;
        PreparedStatement pst;
        // Consulta SQL para insertar un nuevo usuario en la base de datos
        String sql = "insert into usuario(Correo,Codigo,Nombre,Carrera,Perfil,Semestre,Password,Nivel) values(?,?,?,?,?,?,?,?)";
        String respuesta = "";
        try {
            // Cargar la clase del controlador de la base de datos
            Class.forName(db.getDriver());
            // Establecer la conexión con la base de datos
            con = DriverManager.getConnection(db.getUrl(),
                    db.getUsuario(),
                    db.getContraseña());
            pst = con.prepareStatement("SET NAMES utf8mb4"); // Configuración del conjunto de caracteres UTF-8
            pst.executeUpdate(); // Ejecutar la configuración
            pst = con.prepareStatement(sql);
            pst.setString(1, a.getCorreo());
            pst.setInt(2, a.getCod());
            pst.setString(3, a.getNom());
            pst.setString(4, a.getCar());
            pst.setString(5, a.getPer());
            pst.setInt(6, a.getSem());
            pst.setString(7, a.getPassword());
            pst.setInt(8, a.getNivel());
            int filas = pst.executeUpdate();
            respuesta = "Usuario Creado";
            con.close();

        } catch (ClassNotFoundException e) {
        Logger.getLogger(DAO_Usuario.class.getName()).log(Level.SEVERE, "Error: Controlador de base de datos no encontrado", e);
        respuesta = "Error: Controlador de base de datos no encontrado";
    } catch (SQLException e) {
        Logger.getLogger(DAO_Usuario.class.getName()).log(Level.SEVERE, "Error en la consulta SQL: " + e.getMessage(), e);
        respuesta = "Error en la consulta SQL: " + e.getMessage();
    }
        return respuesta;
    }

    // agrega usarios desde el registro de usuarios. Para alumnos
    public String InsertarU(Object obj) {
    Usuarios a = (Usuarios) obj;
    String respuesta = "No se pudo registrar un nuevo usuario";
    
    try (Connection con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
         PreparedStatement pst = con.prepareStatement("SET NAMES utf8mb4");
         PreparedStatement insertStatement = con.prepareStatement("INSERT INTO usuario(Correo, Codigo, Nombre, Carrera, Perfil, Semestre, Password, Nivel) VALUES(?,?,?,?,?,?,?,?)")) {
         
        pst.executeUpdate(); // Configurar el conjunto de caracteres
        
        insertStatement.setString(1, a.getCorreo());
        insertStatement.setInt(2, a.getCod());
        insertStatement.setString(3, a.getNom());
        insertStatement.setString(4, a.getCar());
        insertStatement.setString(5, a.getPer());
        insertStatement.setInt(6, a.getSem());
        insertStatement.setString(7, a.getPassword());
        insertStatement.setInt(8, a.getNivel());
        
        int rowsAffected = insertStatement.executeUpdate();
        if (rowsAffected > 0) {
            respuesta = "Se registró un nuevo usuario";
        }
        
    } catch (SQLException e) {
        // Manejo de excepciones en caso de error durante la inserción
        e.printStackTrace();
    }

    return respuesta;
}

    //Atualiza los datos de los perfiles: Alumnos y Profesores
    @Override
    public String Actualizar(Object obj) {
        // Verificar si el objeto es nulo
        if (obj == null) {
            return "El objeto es nulo";
        }

        // Convertir el objeto genérico en un objeto Usuarios
        Usuarios a = (Usuarios) obj;
        Connection con = null;
        PreparedStatement pst = null;

        // Consulta SQL para actualizar los datos de un usuario en la base de datos
        String sql = "update usuario set Nombre=?, Carrera=?, Semestre=?, Password=? where Correo=?";
        String respuesta = "";

        try {
            // Cargar la clase del controlador de la base de datos
            Class.forName(db.getDriver());

            // Establecer la conexión con la base de datos
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());

            // Preparar una declaración para configurar el conjunto de caracteres UTF-8 en la conexión
            pst = con.prepareStatement("SET NAMES utf8mb4");
            pst.executeUpdate(); // Ejecutar la configuración

            // Preparar una declaración para la actualización del usuario
            pst = con.prepareStatement(sql);
            pst.setString(1, a.getNom());
            pst.setString(2, a.getCar());
            pst.setInt(3, a.getSem());
            pst.setString(4, a.getPassword());
            pst.setString(5, a.getCorreo());

            // Ejecutar la actualización y obtener el número de filas afectadas
            int filas = pst.executeUpdate();
            respuesta = "Se actualizó el perfil";
        } catch (ClassNotFoundException e) {
            respuesta = "No se pudo actualizar el elemento";
        } catch (SQLException e) {
            respuesta = "Error al actualizar el elemento: " + e.getMessage();
        } finally {
            try {
                // Cerrar la declaración y la conexión
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                respuesta = "Error al cerrar la conexión: " + e.getMessage();
            }
        }

        // Devolver el mensaje de respuesta
        return respuesta;
    }

    //Atualiza los datos del Perfil Encargado de laboratorio
    public String ActualizarAdmnistrador(Object obj) {

    Usuarios a = (Usuarios) obj;
    Connection con = null;
    PreparedStatement pst = null;
    String sql = "update usuario set Codigo=?, Nombre=?, Carrera=?, Perfil=?, Semestre=?, Password=?, Nivel=? where Correo=?";
    String respuesta = "";

    try {
        Class.forName(db.getDriver());
        con = DriverManager.getConnection(db.getUrl() + "?useUnicode=true&characterEncoding=UTF-8", db.getUsuario(), db.getContraseña());

        pst = con.prepareStatement(sql);
        pst.setInt(1, a.getCod());
        pst.setString(2, a.getNom());
        pst.setString(3, a.getCar());
        pst.setString(4, a.getPer());
        pst.setInt(5, a.getSem());
        pst.setString(6, a.getPassword());
        pst.setInt(7, a.getNivel());
        pst.setString(8, a.getCorreo());

        // Ejecutar la actualización y obtener el número de filas afectadas
        int filasAfectadas = pst.executeUpdate();

        if (filasAfectadas > 0) {
            respuesta = "Se actualizó el perfil";
        } else {
            respuesta = "No se actualizó ningún registro";
        }
    } catch (ClassNotFoundException e) {
        respuesta = "Error: Clase no encontrada: " + e.getMessage();
    } catch (SQLException e) {
        respuesta = "Error al actualizar el elemento: " + e.getMessage();
    } finally {
        try {
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            respuesta = "Error al cerrar la conexión: " + e.getMessage();
        }
    }

    return respuesta;
}


    //// Verifica si existe un usuario con el codigo de siiau en caso de que exista no podra registrase
    public boolean verificarCodigo(int Criterio) {
        boolean NoEncontrado = true;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM usuario WHERE Codigo = ?";

        try {
            // Cargar la clase del controlador de la base de datos
            Class.forName(db.getDriver());

            // Establecer la conexión con la base de datos
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());

            // Preparar una declaración para ejecutar la consulta
            pst = con.prepareStatement(sql);
            pst.setInt(1, Criterio);
            rs = pst.executeQuery();

            // Verificar si se encontró algún resultado en el conjunto de resultados
            while (rs.next()) {
                NoEncontrado = false;
            }
        } catch (ClassNotFoundException | SQLException e) {
            NoEncontrado = false;
        } finally {
            try {
                // Cerrar el conjunto de resultados, la declaración y la conexión
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                // Manejo de excepciones en caso de error al cerrar
            }
        }
        return NoEncontrado;
    }

    //Consultas generales de la tabla usuario 
    @Override
    public List<Usuarios> consultarGRL() {
        List<Usuarios> datos = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM usuario";

        try {
            // Cargar la clase del controlador de la base de datos
            Class.forName(db.getDriver());

            // Establecer la conexión con la base de datos
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());

            // Preparar una declaración para ejecutar la consulta
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();

            // Iterar a través del conjunto de resultados y construir objetos Usuarios
            while (rs.next()) {
                Usuarios usuario = new Usuarios(rs.getString("Correo"), rs.getInt("Codigo"), rs.getString("Nombre"), rs.getString("Carrera"), rs.getString("Perfil"),
                        rs.getInt("Semestre"), rs.getString("Password"), rs.getInt("Nivel"));
                datos.add(usuario);
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Manejo de excepciones en caso de error
        } finally {
            try {
                // Cerrar el conjunto de resultados, la declaración y la conexión
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                // Manejo de excepciones en caso de error al cerrar
            }
        }

        // Devolver la lista de usuarios consultados
        return datos;
    }

    //Consulta para usuarios en espeficicos solo un resultado especifico
    @Override
 public List<Usuarios> consultar(String Criterio) {
    List<Usuarios> datos = new ArrayList<>();
    String sql = "SELECT * FROM usuario WHERE Correo = ?";

    try (Connection con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
         PreparedStatement pst = con.prepareStatement(sql)) {
        pst.setString(1, Criterio);
        try (ResultSet rs = pst.executeQuery()) {
            while (rs.next()) {
                Usuarios usuario = new Usuarios(
                    rs.getString("Correo"),
                    rs.getInt("Codigo"),
                    rs.getString("Nombre"),
                    rs.getString("Carrera"),
                    rs.getString("Perfil"),
                    rs.getInt("Semestre"),
                    rs.getString("Password"),
                    rs.getInt("Nivel")
                );
                datos.add(usuario);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Manejo adecuado de la excepción, registra el error.
    }
    
    return datos;
}


    public List<Usuarios> consultarAdm(String Criterio) {
        List<Usuarios> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM usuario WHERE Correo like ?";

        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            pst.setString(1, Criterio);
            rs = pst.executeQuery();
            while (rs.next()) {
                datos.add(new Usuarios(rs.getString("Correo"), rs.getInt("Codigo"), rs.getString("Nombre"), rs.getString("Carrera"), rs.getString("Perfil"),
                        rs.getInt("Semestre"), rs.getString("Password"), rs.getInt("Nivel")));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return datos;
    }

    /// busca posibles usuarios, este codigo se utiliza para buscar posibles usuarios en en jsp Administrar usuarios
    public List<Usuarios> buscar(int Criterio) {
        List<Usuarios> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM usuario WHERE Codigo like ?";

        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            pst.setString(1, "%" + Criterio + "%");
            rs = pst.executeQuery();
            while (rs.next()) {
                datos.add(new Usuarios(rs.getString("Correo"), rs.getInt("Codigo"), rs.getString("Nombre"), rs.getString("Carrera"), rs.getString("Perfil"),
                        rs.getInt("Semestre"), rs.getString("Password"), rs.getInt("Nivel")));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return datos;
    }

//    
//    -------------------------------------------  Carta no Adeudo----------------------------------------------------------------------------------------------------
//// Crear una solicitud para la carta de no adeudo.
    public String insertarCarta(Object obj) {
        Carta a = (Carta) obj;
        Connection con;
        PreparedStatement pst;
        String sql = "insert into carta_adeudo(id_Carta,Correo_C,Ciclo_Escolar,Motivo,Estatus,Fecha,Hora) values(null,?,?,?,'Pendiente',CURDATE(),DATE_FORMAT(NOW( ), \"%H:%i:%S\"))";
        String respuesta = "";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(),
                    db.getUsuario(),
                    db.getContraseña());

            pst = con.prepareStatement("SET NAMES utf8mb4"); // Configuración del conjunto de caracteres UTF-8
            pst.executeUpdate(); // Ejecutar la configuración
            pst = con.prepareStatement(sql);
            pst.setString(1, a.getCorreo());
            pst.setString(2, a.getCiclo());
            pst.setString(3, a.getMotivo());
            int filas = pst.executeUpdate();
            respuesta = "Tu solicitud de carta de no adeudo esta en proceso";
            con.close();

        } catch (ClassNotFoundException | SQLException e) {
        }
        return respuesta;
    }

//  Consulta todas las solicitudes de carta de no adeudo de un usuario en especifico.  
    public List<Usuarios> solicitudes_Carta(String Criterio) throws java.text.ParseException {
        List<Usuarios> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select * from carta_adeudo where Correo_C like '%" + Criterio + "%' ORDER BY Fecha DESC, Hora DESC";

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
                datos.add(new Usuarios(rs.getInt("id_Carta"), rs.getString("Correo_C"), rs.getString("Ciclo_Escolar"), rs.getString("Motivo"), rs.getString("Estatus"), fechaFormateada, rs.getString("Hora"), fechaEntrega));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return datos;
    }

    public List<Usuarios> TodasCarta() throws java.text.ParseException {
        List<Usuarios> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select * from usuario inner join carta_adeudo on usuario.correo = carta_adeudo.Correo_C";

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
                datos.add(new Usuarios(rs.getString("Correo"), rs.getInt("Codigo"), rs.getString("Nombre"), rs.getString("Carrera"), rs.getString("Perfil"), rs.getInt("Semestre"), rs.getInt("id_Carta"), rs.getString("Ciclo_Escolar"), rs.getString("Motivo"), rs.getString("Estatus"), rs.getString("Hora"), fechaFormateada, fechaEntrega));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return datos;
    }

    //Muestra los datos completo del alumnos que solicito la carta de no adeudo
    public List<Usuarios> VerMas(int Criterio) {
        List<Usuarios> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select * from usuario inner join carta_adeudo on usuario.correo = carta_adeudo.Correo_C where id_Carta =?";

        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            pst.setInt(1, Criterio);
            rs = pst.executeQuery();
            while (rs.next()) {

                datos.add(new Usuarios(rs.getString("Correo"), rs.getInt("Codigo"), rs.getString("Nombre"), rs.getString("Carrera"), rs.getString("Perfil"), rs.getInt("Semestre"), rs.getInt("id_Carta"), rs.getString("Ciclo_Escolar"), rs.getString("Motivo"), rs.getString("Estatus"), rs.getString("Hora"), rs.getString("Fecha"), rs.getString("Fecha_Entrega")));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return datos;
    }

    ///Sirve para la entrega de la solicitud 
    public int CartaAdeudo(int user, String est) {
        Usuarios a = new Usuarios();
        Connection con;
        PreparedStatement pst;
        String sql = "update carta_adeudo set Estatus = ? where id_Carta=?";
        String respuesta = "";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(),
                    db.getUsuario(),
                    db.getContraseña());

            pst = con.prepareStatement("SET NAMES utf8mb4"); // Configuración del conjunto de caracteres UTF-8
            pst.executeUpdate(); // Ejecutar la configuración
            pst = con.prepareStatement(sql);
            pst.setInt(2, user);
            pst.setString(1, est);
            int filas = pst.executeUpdate();

            respuesta = "se Actualizo el estatus de carta de no adeudo ";
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return 0;
    }

    /// actualiza los datos de la solicitud de carta de no adeudo para que el usuario tenga la informacion de estatus y la fecha que estara su solicitud
    public int FechaCarta(int user, String est, String Fecha) {
        Usuarios a = new Usuarios();
        Connection con;
        PreparedStatement pst;
        String sql = "update carta_adeudo set Estatus = ?, Fecha_Entrega=? where id_Carta=?";
        String respuesta = "";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(),
                    db.getUsuario(),
                    db.getContraseña());

            pst = con.prepareStatement("SET NAMES utf8mb4"); // Configuración del conjunto de caracteres UTF-8
            pst.executeUpdate(); // Ejecutar la configuración
            pst = con.prepareStatement(sql);
            pst.setInt(3, user);
            pst.setString(1, est);
            pst.setString(2, Fecha);
            int filas = pst.executeUpdate();
            respuesta = "se Actualizo el estatus de carta de no adeudo a: " + est;

            respuesta = "Se actualizo los datos del usuario";
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return 0;
    }

    /// Busca Todas las solicitudes
    public List<Usuarios> CartaNoAdeudo() throws java.text.ParseException {
        List<Usuarios> datos = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql = "SELECT usuario.Codigo, usuario.Nombre, usuario.Carrera, usuario.Perfil, usuario.Semestre, carta_adeudo.* FROM carta_adeudo INNER JOIN usuario ON carta_adeudo.Correo_C = usuario.Correo WHERE Estatus = 'Pendiente' ORDER BY Fecha DESC, Hora DESC;";

        try {
            // Cargar la clase del controlador de la base de datos
            Class.forName(db.getDriver());

            // Establecer la conexión con la base de datos
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());

            // Preparar una declaración para ejecutar la consulta
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();

            // Iterar a través del conjunto de resultados y construir objetos Usuarios
            while (rs.next()) {
                String fecha = rs.getString("Fecha");
                SimpleDateFormat formatoEntrada = new SimpleDateFormat("yyyy-MM-dd");
                Date fechaDate = formatoEntrada.parse(fecha);
                SimpleDateFormat formatoSalida = new SimpleDateFormat("dd-MM-yyyy");
                String fechaFormateada = formatoSalida.format(fechaDate);

                String fechaEntrega = rs.getString("Fecha_Entrega");
                datos.add(new Usuarios(rs.getString("Correo_C"), rs.getInt("Codigo"), rs.getString("Nombre"), rs.getString("Carrera"), rs.getString("Perfil"), rs.getInt("Semestre"), rs.getInt("id_Carta"), rs.getString("Ciclo_Escolar"), rs.getString("Motivo"), rs.getString("Estatus"), fechaFormateada, rs.getString("Hora"), fechaEntrega));
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Manejo de excepciones en caso de error
        } finally {
            try {
                // Cerrar el conjunto de resultados, la declaración y la conexión
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                // Manejo de excepciones en caso de error al cerrar
            }
        }

        // Devolver la lista de usuarios con cartas de no adeudo pendientes
        return datos;
    }

    // Sirve para actualizar el estatus de carta de no adeudo
    public List<Usuarios> EntregarCarta() throws java.text.ParseException {
        List<Usuarios> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT usuario.Codigo, usuario.Nombre, usuario.Carrera, usuario.Perfil, usuario.Semestre, carta_adeudo.* FROM carta_adeudo INNER JOIN usuario ON carta_adeudo.Correo_C = usuario.Correo WHERE Estatus IN ('En Proceso', 'Pasar Por ella','Fecha Postergada')  ORDER BY Fecha DESC,Hora DESC;";

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
                datos.add(new Usuarios(rs.getString("Correo_C"), rs.getInt("Codigo"), rs.getString("Nombre"), rs.getString("Carrera"), rs.getString("Perfil"), rs.getInt("Semestre"), rs.getInt("id_Carta"), rs.getString("Ciclo_Escolar"), rs.getString("Motivo"), rs.getString("Estatus"), fechaFormateada, rs.getString("Hora"), fechaEntrega));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return datos;
    }

    public String Cancelar(int Cri) {
        List<Usuarios> datos = new ArrayList<>();
        Usuarios s = new Usuarios();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String respuesta = "";
        String sql = "UPDATE carta_adeudo SET Estatus = 'Cancelada' WHERE id_Carta = ?";

        try {
            // Cargar la clase del controlador de la base de datos
            Class.forName(db.getDriver());

            // Establecer la conexión con la base de datos
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());

            // Preparar una declaración para configurar el conjunto de caracteres UTF-8 en la conexión
            pst = con.prepareStatement("SET NAMES utf8mb4");
            pst.executeUpdate(); // Ejecutar la configuración

            // Preparar una declaración para ejecutar la actualización de la carta de no adeudo
            pst = con.prepareStatement(sql);
            pst.setInt(1, Cri);

            // Ejecutar la actualización y obtener el número de filas afectadas
            int filas = pst.executeUpdate();
            respuesta = "Se ha cancelado tu solicitud";
            con.close();
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

//    --------------------------------------------------Envio de Correo para Recuperacion de de password de Algun usuario ------------------------------------------------------------
    //Sirve para generar una contraseña temporal 
    public String generarYGuardarContrasenaTemporal(String Correo) {
        Connection con = null;
        PreparedStatement pst = null;
        String respuesta = "";

        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());

            // Generar contraseña aleatoria
            String nuevaPass = UUID.randomUUID().toString().substring(0, 8);

            // Obtener la fecha y hora actual
            Calendar cal = Calendar.getInstance();
            Timestamp timestamp = new Timestamp(cal.getTime().getTime());

            // Calcular la fecha y hora de expiración (30 minutos después de la generación)
            cal.add(Calendar.MINUTE, 10);
            Timestamp expiryTimestamp = new Timestamp(cal.getTime().getTime());

            // Actualizar contraseña temporal y su expiración en la base de datos
            String sql = "UPDATE usuario SET TemporalPassword=?, Expiry=? WHERE Correo=?;";
            pst = con.prepareStatement("SET NAMES utf8mb4"); // Configuración del conjunto de caracteres UTF-8
            pst.executeUpdate(); // Ejecutar la configuración
            pst = con.prepareStatement(sql);

            pst.setString(1, nuevaPass);
            pst.setTimestamp(2, expiryTimestamp);
            pst.setString(3, Correo);
            int filas = pst.executeUpdate();

            if (filas > 0) {
                respuesta = "Contraseña temporal generada y almacenada.";
            } else {
                respuesta = "No se pudo generar y almacenar la contraseña temporal.";
            }

        } catch (ClassNotFoundException e) {
            respuesta = "No se pudo generar y almacenar la contraseña temporal.";
        } catch (SQLException e) {
            respuesta = "Error al generar y almacenar la contraseña temporal: " + e.getMessage();
        } finally {
            // ...
        }
        return respuesta;
    }

    /// Genera una contraseña random y actualiza al usuario con dicha contraseña 
    public String Password_Aleatorio(String Correo) {
        Connection con = null;
        PreparedStatement pst = null;
        String respuesta = "";

        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());

            // Generar contraseña aleatoria
            String nuevaPass = UUID.randomUUID().toString().substring(0, 8);

            // Actualizar contraseña en la base de datos
            String sql = "update usuario set Password=? where Correo=?;";
            pst = con.prepareStatement("SET NAMES utf8mb4"); // Configuración del conjunto de caracteres UTF-8
            pst.executeUpdate(); // Ejecutar la configuración
            pst = con.prepareStatement(sql);

            pst.setString(1, nuevaPass);
            pst.setString(2, Correo);
            int filas = pst.executeUpdate();

            if (filas > 0) {
                respuesta = "Contraseña actualizada: " + nuevaPass;
            } else {
                respuesta = "No se pudo actualizar la contraseña";
            }

        } catch (ClassNotFoundException e) {
            respuesta = "No se pudo actualizar la contraseña";
        } catch (SQLException e) {
            respuesta = "Error al actualizar la contraseña: " + e.getMessage();
        } finally {
            try {
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                respuesta = "Error al cerrar la conexión: " + e.getMessage();
            }
        }
        return respuesta;
    }

    /// se solicita Correo y codigo para poder seguir con el proceso con el envio de correo, primero debe validar que los datos que el usuario proporciono sean correctos y coincidan 
    public boolean validarUsuario(String correo, int codigo) throws SQLException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql = "select * from usuario where Correo=? and Codigo=?";

        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            pst.setString(1, correo);
            pst.setInt(2, codigo);
            rs = pst.executeQuery();
            if (rs.next()) {
                return true;

            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;

    }

    /// se obtiene el password para posterior ser enviado a Correo con el 
    public String obtenerPassword(String criterio) {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String password = "";

        String sql = "SELECT TemporalPassword FROM usuario WHERE Correo =?";

        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            pst.setString(1, criterio);
            rs = pst.executeQuery();

            if (rs.next()) {
                password = rs.getString("TemporalPassword");
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Manejo de excepciones
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                // Manejo de excepciones
            }
        }
        return password;
    }

    // Este codigo se encarga de iniciar session con el correo que enviara los correo con el password
    public String sendMain(String to, String Pass) {

        String Correo = "LabRecuperacion123@hotmail.com"; // Dirección de correo electrónico del remitente
        // Obtiene las propiedades del sistema, que se utilizan principalmente para establecer parámetros relacionados con el correo electrónico.
        Properties properties = System.getProperties();
        // Configure el servidor de transferencia de correo. Dado que esta es una operación de envío de correo, necesitamos configurar el protocolo smtp. De acuerdo con los requisitos del correo de sincronización oficial de Outlook, configure la dirección del protocolo, el número de puerto y el método de cifrado a su vez
        properties.setProperty("mail.smtp.host", "smtp.office365.com");
        properties.setProperty("mail.smtp.port", "587");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        properties.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
        // Verificación del usuario y volver a la sesión, activar la verificación del usuario, configurar la contraseña de la cuenta para enviar correo electrónico.
        properties.setProperty("mail.smtp.auth", "true");
        Session session = Session.getInstance(properties, new Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("LabRecuperacion123@hotmail.com", "uzamfigkipczfbsx"); // Contraseña de la cuenta
            }
        });

        // Cree un objeto de mensaje MimeMessage, el encabezado del mensaje se configura con la dirección del buzón de envío y recepción, y el cuerpo del mensaje contiene el título y el contenido del mensaje. Tipo de destinatario: TO significa envío directo, CC significa CC y BCC significa CC secreto.
        try {
            MimeMessage message = new MimeMessage(session);
            message.addHeader("X-Mailer", "Microsoft Outlook Express 6.00.2900.2869");
            message.setFrom(new InternetAddress(Correo));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Recuperacion de Contraseña");
            message.setText("Esta es tu nueva Contraseña: \n" + Pass + ".\nTendras solo 30 minutos para poder acceder a tu cuenta y cambiar la contraseña.");
            Transport.send(message);
            return "Se envio";
        } catch (MessagingException e) {
            return "No se pudo enviar el correo electrónico: ";
        }

    }

    public String SendEstatus(String gmail, String Est, Date Fecha) {

        String Correo = "LabRecuperacion123@hotmail.com"; // Dirección de correo electrónico del remitente
        // Obtiene las propiedades del sistema, que se utilizan principalmente para establecer parámetros relacionados con el correo electrónico.
        Properties properties = System.getProperties();
        // Configure el servidor de transferencia de correo. Dado que esta es una operación de envío de correo, necesitamos configurar el protocolo smtp. De acuerdo con los requisitos del correo de sincronización oficial de Outlook, configure la dirección del protocolo, el número de puerto y el método de cifrado a su vez
        properties.setProperty("mail.smtp.host", "smtp.office365.com");
        properties.setProperty("mail.smtp.port", "587");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        properties.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
        // Verificación del usuario y volver a la sesión, activar la verificación del usuario, configurar la contraseña de la cuenta para enviar correo electrónico.
        properties.setProperty("mail.smtp.auth", "true");
        Session session = Session.getInstance(properties, new Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("LabRecuperacion123@hotmail.com", "uzamfigkipczfbsx"); // Contraseña de la cuenta
            }
        });

        // Cree un objeto de mensaje MimeMessage, el encabezado del mensaje se configura con la dirección del buzón de envío y recepción, y el cuerpo del mensaje contiene el título y el contenido del mensaje. Tipo de destinatario: TO significa envío directo, CC significa CC y BCC significa CC secreto.
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yy");
            String formattedDate = dateFormat.format(Fecha);
            MimeMessage message = new MimeMessage(session);
            message.addHeader("X-Mailer", "Microsoft Outlook Express 6.00.2900.2869");
            message.setFrom(new InternetAddress(Correo));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(gmail));
            message.setSubject("Solicitud de Carta de no Adeudo");
            message.setText("Solicitud de Carta de no Adeudo.\nEstatus: " + Est + "\nFecha de Entrega:" + formattedDate);
            Transport.send(message);
            return "Se envio";
        } catch (MessagingException e) {
            return "No se pudo enviar el correo electrónico: ";
        }
    }

    public String SendCarta(String gmail, String Est) {
        String Correo = "LabRecuperacion123@hotmail.com"; // Dirección de correo electrónico del remitente
        // Obtiene las propiedades del sistema, que se utilizan principalmente para establecer parámetros relacionados con el correo electrónico.
        Properties properties = System.getProperties();
        // Configure el servidor de transferencia de correo. Dado que esta es una operación de envío de correo, necesitamos configurar el protocolo smtp. De acuerdo con los requisitos del correo de sincronización oficial de Outlook, configure la dirección del protocolo, el número de puerto y el método de cifrado a su vez
        properties.setProperty("mail.smtp.host", "smtp.office365.com");
        properties.setProperty("mail.smtp.port", "587");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        properties.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
        // Verificación del usuario y volver a la sesión, activar la verificación del usuario, configurar la contraseña de la cuenta para enviar correo electrónico.
        properties.setProperty("mail.smtp.auth", "true");
        Session session = Session.getInstance(properties, new Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("LabRecuperacion123@hotmail.com", "uzamfigkipczfbsx"); // Contraseña de la cuenta
            }
        });

        // Cree un objeto de mensaje MimeMessage, el encabezado del mensaje se configura con la dirección del buzón de envío y recepción, y el cuerpo del mensaje contiene el título y el contenido del mensaje. Tipo de destinatario: TO significa envío directo, CC significa CC y BCC significa CC secreto.
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yy");

            MimeMessage message = new MimeMessage(session);
            message.addHeader("X-Mailer", "Microsoft Outlook Express 6.00.2900.2869");
            message.setFrom(new InternetAddress(Correo));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(gmail));
            message.setSubject("Solicitud de Carta de no Adeudo");
            message.setText("Solicitud de Carta de no Adeudo.\nEstatus: " + Est + "\nFecha de Entrega:");
            Transport.send(message);
            return "Se envio";
        } catch (MessagingException e) {
            return "No se pudo enviar el correo electrónico: ";
        }
    }

//    ---------------------------------------------------Inicio de seccion--------------------------------------------------------------------------------
    //Comprueba si el usuario existe y si coincide las contraseñas 
    public int Login(String user, String pass) throws SQLException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql = "SELECT Nivel, TemporalPassword, Expiry FROM usuario WHERE Correo=? AND (Password=? OR TemporalPassword=?)";

        int nivel = 0;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            pst.setString(1, user);
            pst.setString(2, pass);
            pst.setString(3, pass); // Comparar también con la contraseña temporal proporcionada

            rs = pst.executeQuery();

            if (rs.next()) {
                nivel = rs.getInt("Nivel");
                String temporalPasswordDB = rs.getString("TemporalPassword");
                Timestamp expiryTimestamp = rs.getTimestamp("Expiry");

                // Verificar si se utilizó la contraseña temporal
                if (pass.equals(temporalPasswordDB)) {
                    // Verificar si la contraseña temporal ha expirado
                    Calendar cal = Calendar.getInstance();
                    Timestamp currentTimestamp = new Timestamp(cal.getTime().getTime());
                    if (expiryTimestamp.before(currentTimestamp)) {
                        return 0; // La contraseña temporal ha expirado, se debe solicitar una nueva
                    }
                }

                return nivel; // Verificación exitosa, el usuario ha iniciado sesión correctamente
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar recursos como en el código original (pst, rs, con)
        }
        return 0; // Verificación fallida, los datos proporcionados no son válidos
    }
//

    /// sirve para conseguir el nombre del usuario
public String validar(String user) throws SQLException {
    String Nombre = "";
    String sql = "SELECT Nombre FROM usuario WHERE Correo=?";
    
    try (Connection con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
         PreparedStatement pst = con.prepareStatement(sql)) {
        pst.setString(1, user);
        try (ResultSet rs = pst.executeQuery()) {
            if (rs.next()) {
                Nombre = rs.getString("Nombre");
            }
        }
    } catch (SQLException e) {
        // Manejo de la excepción, registra el error o lánzalo si es necesario.
        e.printStackTrace();
    }
    
    return Nombre;
}


    ///Sirve para Traer Buscar al usuario y traer unicamente el Correo y enviarlo al login para los HttpSession
  public String obtenerCorreo(String usuario) throws SQLException {
    String correo = "";

    String sql = "SELECT Correo FROM usuario WHERE Correo = ?";

    try (Connection con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
         PreparedStatement pst = con.prepareStatement(sql)) {
        pst.setString(1, usuario);
        try (ResultSet rs = pst.executeQuery()) {
            if (rs.next()) {
                correo = rs.getString("Correo");
            }
        }
    } catch (SQLException e) {
        // Manejo de excepciones, registra el error o lánzalo si es necesario.

    }

    return correo;
}



//    ---------------------------------------------------------------------_Botones desactivados ---------------------------------------------------------------------------------------------------
    //// busca si el usuario tiene alguna solicitud para la carta de no adeudo no concluida, en caso no tenerla mandara un true y en caso opuesto retora un false 
    public boolean Validar_botton(String cod) {
        List<Usuarios> datos = new ArrayList<>();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String estatusCarta = "";
        String sql = "select Estatus from carta_adeudo where Correo_C like '%" + cod + "%'";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                estatusCarta = rs.getString("Estatus");

                datos.add(new Usuarios(estatusCarta));
            }

            if (datos.isEmpty() || estatusCarta.equals("Entregado") || estatusCarta.equals("Cancelada")) {
                return true;
            }

            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //// Hace lo mismo que el metodo anterior pero ahora con las solicitudes de material
    public boolean Validar_botton2(String cod) {
        List<Solicitud> datos = new ArrayList<>();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String estatus = "";
        String sql = "SELECT Estatus FROM solicitud WHERE Correo_U LIKE '%" + cod + "%'";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                estatus = rs.getString("Estatus");
                datos.add(new Solicitud(estatus));
            }

            con.close();

            // Verificar si todas las solicitudes tienen estatus "Entregado" o "Cancelado", o si no se encontraron solicitudes
            boolean todasEntregadoOCancelado = true;
            for (Solicitud solicitud : datos) {
                String estatusSolicitud = solicitud.getEstatus();
                if (!estatusSolicitud.equals("Entregado") && !estatusSolicitud.equals("Cancelada")) {
                    todasEntregadoOCancelado = false;
                    break;
                }
            }
            return todasEntregadoOCancelado || datos.isEmpty();

        } catch (ClassNotFoundException | SQLException e) {

            return false;
        }
    }

//    ---------------------------------------------------Archivos ----------------------------------------------------------------------------------------------------------------------
    public String ArchivosU(int Cod) throws IOException {
        List<Usuarios> datos = new ArrayList();
        Connection con;
        PreparedStatement pst;
        ResultSet rs;

        String sql = "select * from usuario where Codigo like '%" + Cod + "%'";

        try {

            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();

            while (rs.next()) {

                datos.add(new Usuarios(rs.getString("Correo"), rs.getInt("Codigo"), rs.getString("Nombre"), rs.getString("Carrera"), rs.getString("Perfil"),
                        rs.getInt("Semestre"), rs.getString("Password"), rs.getInt("Nivel")));
            }
            con.close();

            for (Usuarios u : datos) {
                ////           Ruta donde se guardara 
                FileWriter archivo = new FileWriter("C:\\Users\\netor\\OneDrive\\Escritorio\\archivos\\" + u.getCod() + "  " + u.getNom() + ".txt");
///             Escribimos el complemento y agregamos los datos de la consulta
                archivo.write("Codigo estudiante:" + u.getCod() + "\nNombre del Estudiante:" + u.getNom() + "\nCorreo:" + u.getCorreo() + "\nCarrera:" + u.getCar() + "\nSemestre" + u.getSem() + "\nPerfil:" + u.getPer());
                archivo.close();
            }

        } catch (ClassNotFoundException | SQLException e) {
        }
        return "";

    }
//    
//public String ArchivosExcel(String filePath) throws IOException, SQLException {
//    try {
//        Connection con;
//        PreparedStatement pst;
//        ResultSet rs;
//
//        // Crear un diálogo de selección de archivo
//        JFileChooser fileChooser = new JFileChooser();
//        int result = fileChooser.showSaveDialog(null);
//        if (result == JFileChooser.APPROVE_OPTION) {
//            File selectedFile = fileChooser.getSelectedFile();
//
//            try (XSSFWorkbook workbook = new XSSFWorkbook()) {
//                XSSFSheet sheet = workbook.createSheet("Resultados");
//                //Titulo de excel
//                String[] cabecera = new String[]{"Código", "Nombre", "Carrera", "Perfil", "Semestre", "Correo", "Password", "Nivel"};
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
//
//                String sql = "select * from usuario";
//                Class.forName(db.getDriver());
//                con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
//                pst = con.prepareStatement(sql);
//                rs = pst.executeQuery();
//
//                int rowNum = 2;
//                while (rs.next()) {
//                    Row row = sheet.createRow(rowNum++);
//                    int colNum = 0;
//                    while (colNum < 8) {
//                        Cell cell = row.createCell(colNum++);
//                        cell.setCellValue(rs.getString(colNum));
//                    }
//                }
//
//                // Guardar el archivo Excel en disco en la ruta seleccionada
//                FileOutputStream outputStream = new FileOutputStream(filePath);
//                workbook.write(outputStream);
//
//                // Cerrar la conexión a la base de datos y liberar los recursos
//                rs.close();
//                pst.close();
//                con.close();
//
//                return "Archivo Excel generado y guardado en: " + filePath;
//            }
//        } else {
//            return "Operación cancelada por el usuario";
//        }
//
//    } catch (ClassNotFoundException ex) {
//        Logger.getLogger(DAO_Usuario.class.getName()).log(Level.SEVERE, null, ex);
//        return "Error: " + ex.getMessage();
//    }
//}
//    
//    public void actualizarArchivoExcel() throws IOException, SQLException {
//    try {
//        Connection con;
//        PreparedStatement pst;
//        ResultSet rs;
//        String rutaArchivo = "C:\\Users\\netor\\OneDrive\\Documentos\\InventarioCUT\\Libro1.xlsx";
//        // Cargar el archivo Exc1el existente en memoria
//        FileInputStream inputStream = new FileInputStream(rutaArchivo);
//        XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
//        XSSFSheet sheet = workbook.getSheetAt(0); // Obtener la primera hoja del archivo
//          String[] cabecera = new String[]{"Correo","Código", "Nombre", "Carrera", "Perfil", "Semestre", "Password", "Nivel"};
//        CellStyle headerStyle = workbook.createCellStyle();
//        headerStyle.setFillForegroundColor(IndexedColors.LIGHT_BLUE.getIndex());
//        headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
//        headerStyle.setBorderBottom(BorderStyle.THIN);
//        headerStyle.setBorderLeft(BorderStyle.THIN);
//        headerStyle.setBorderRight(BorderStyle.THIN);
//        headerStyle.setBorderBottom(BorderStyle.THIN);
//        Font font = workbook.createFont();
//        font.setFontName("Arial");
//        font.setBold(true);
//        font.setColor(IndexedColors.WHITE.getIndex());
//        font.setFontHeightInPoints((short) 12);
//        headerStyle.setFont(font);
//
//        Row filaEncabezados = sheet.createRow(1);
//        for (int i = 0; i < cabecera.length; i++) {
//            Cell celdaEnzabezado = filaEncabezados.createCell(i);
//            celdaEnzabezado.setCellStyle(headerStyle);
//            celdaEnzabezado.setCellValue(cabecera[i]);
//        }
//        // Lógica para actualizar los datos en el archivo Excel
//        String sql = "SELECT * FROM usuario";
//        Class.forName(db.getDriver());
//        con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
//        pst = con.prepareStatement(sql);
//        rs = pst.executeQuery();
//        int rowNum = 2;
//        while (rs.next()) {
//            Row row = sheet.createRow(rowNum++);
//            int colNum = 0;
//            while (colNum < 8) {
//                Cell cell = row.createCell(colNum++);
//                cell.setCellValue(rs.getString(colNum));
//            }
//        }
//        
//        // Guardar los cambios en el archivo Excel
//        FileOutputStream outputStream = new FileOutputStream(rutaArchivo);
//        workbook.write(outputStream);
//        workbook.close();
//        inputStream.close();
//        outputStream.close();
//        
//        // Cerrar la conexión a la base de datos y liberar los recursos
//        rs.close();
//        pst.close();
//        con.close();
//    } catch (ClassNotFoundException ex) {
//        Logger.getLogger(DAO_Usuario.class.getName()).log(Level.SEVERE, null, ex);
//    }
//}
//    
//    
// public String ArchivosExcel() throws IOException, SQLException {
//    try {
//        Connection con;
//        PreparedStatement pst;
//        ResultSet rs;
//
//        // Abrir el archivo Excel existente
//        FileInputStream inputStream = new FileInputStream("C:\\Users\\netor\\OneDrive\\Documentos\\InventarioCUT\\Usuario1.xlsx");
//        XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
//
//        XSSFSheet sheet = workbook.getSheet("Resultados"); // Obtener la hoja de trabajo existente
//        for (int i = sheet.getLastRowNum(); i >= 1; i--) {
//            Row row = sheet.getRow(i);
//            sheet.removeRow(row); // Borrar filas existentes
//        }
//
//        // Titulo de excel
//        String[] cabecera = new String[]{"Código", "Nombre", "Carrera", "Perfil", "Semestre", "Correo", "Password", "Nivel"};
//        CellStyle headerStyle = workbook.createCellStyle();
//        headerStyle.setFillForegroundColor(IndexedColors.LIGHT_BLUE.getIndex());
//        headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
//        headerStyle.setBorderBottom(BorderStyle.THIN);
//        headerStyle.setBorderLeft(BorderStyle.THIN);
//        headerStyle.setBorderRight(BorderStyle.THIN);
//        headerStyle.setBorderBottom(BorderStyle.THIN);
//        Font font = workbook.createFont();
//        font.setFontName("Arial");
//        font.setBold(true);
//        font.setColor(IndexedColors.WHITE.getIndex());
//        font.setFontHeightInPoints((short) 12);
//        headerStyle.setFont(font);
//
//        Row filaEncabezados = sheet.createRow(1);
//        for (int i = 0; i < cabecera.length; i++) {
//            Cell celdaEnzabezado = filaEncabezados.createCell(i);
//            celdaEnzabezado.setCellStyle(headerStyle);
//            celdaEnzabezado.setCellValue(cabecera[i]);
//        }
//
//        // Consulta SQL para obtener los datos
//        String sql = "select * from usuario";
//        Class.forName(db.getDriver());
//        con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
//        pst = con.prepareStatement(sql);
//        rs = pst.executeQuery();
//
//        // Creación del archivo Excel
//int rowNum = 2;
//while (rs.next()) {
//    Row row = sheet.createRow(rowNum++);
//    int colNum = 0;
//    while (colNum < 8) {
//        Cell cell = row.createCell(colNum);
//        cell.setCellValue(rs.getString(colNum + 1)); // Corrección aquí
//        colNum++;
//    }
//}
//
//        // Guardar el archivo Excel en disco
//        FileOutputStream outputStream = new FileOutputStream("C:\\Users\\netor\\OneDrive\\Escritorio\\Libro1.xlsx");
//        workbook.write(outputStream);
//        workbook.close(); // Cerrar el archivo Excel
//
//        // Cerrar la conexión a la base de datos y liberar los recursos
//        rs.close();
//        pst.close();
//        con.close();
//        inputStream.close();
//        outputStream.close();
//
//    } catch (ClassNotFoundException ex) {
//        Logger.getLogger(DAO_Usuario.class
//                .getName()).log(Level.SEVERE, null, ex);
//    }
//    return null;
//}
//
////    Genera archivos en excel 
////    public String ArchivosExcel() throws IOException, SQLException {
////        try {
////            Connection con;
////            PreparedStatement pst;
////            ResultSet rs;
////            try ( // Configuración de la conexión a la base de datos
////                 XSSFWorkbook workbook = new XSSFWorkbook()) {
////                XSSFSheet sheet = workbook.createSheet("Resultados");
////                //Titulo de excel
////                String[] cabecera = new String[]{"Código", "Nombre", "Carrera", "Perfil", "Semestre", "Correo", "Password", "Nivel"};
////                CellStyle headerStyle = workbook.createCellStyle();
////                headerStyle.setFillForegroundColor(IndexedColors.LIGHT_BLUE.getIndex());
////                headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
////                headerStyle.setBorderBottom(BorderStyle.THIN);
////                headerStyle.setBorderLeft(BorderStyle.THIN);
////                headerStyle.setBorderRight(BorderStyle.THIN);
////                headerStyle.setBorderBottom(BorderStyle.THIN);
////                Font font = workbook.createFont();
////                font.setFontName("Arial");
////                font.setBold(true);
////                font.setColor(IndexedColors.WHITE.getIndex());
////                font.setFontHeightInPoints((short) 12);
////                headerStyle.setFont(font);
////                Row filaEncabezados = sheet.createRow(1);
////                for (int i = 0; i < cabecera.length; i++) {
////                    Cell celdaEnzabezado = filaEncabezados.createCell(i);
////                    celdaEnzabezado.setCellStyle(headerStyle);
////                    celdaEnzabezado.setCellValue(cabecera[i]);
////                }
////                // Consulta SQL para obtener los datos
//////        String query = "SELECT * FROM usuario";
//////        Statement stmt = con.createStatement();
//////        rs = stmt.executeQuery(query);
////                String sql = "select * from usuario";
////                Class.forName(db.getDriver());
////                con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
////                pst = con.prepareStatement(sql);
////                rs = pst.executeQuery();
////// Creación del archivo Excel
////                int rowNum = 2;
////                while (rs.next()) {
////                    Row row = sheet.createRow(rowNum++);
////                    int colNum = 0;
////                    while (colNum < 8) {
////                        Cell cell = row.createCell(colNum++);
////                        cell.setCellValue(rs.getString(colNum));
////                    }
////                }
////// Guardar el archivo Excel en disco
////                FileOutputStream outputStream = new FileOutputStream("C:\\Users\\netor\\OneDrive\\Escritorio\\CartaNoAdeudo.xlsx");
////                workbook.write(outputStream);
////            }
////
////// Cerrar la conexión a la base de datos y liberar los recursos
////            rs.close();
////            pst.close();
////            con.close();
////
////        } catch (ClassNotFoundException ex) {
////            Logger.getLogger(DAO_Usuario.class
////                    .getName()).log(Level.SEVERE, null, ex);
////        }
////        return null;
////    }
//
////    ---------------------------------------------------------------------------------------------------------------------------------------------------------------
//    public String CartaExcel() throws IOException, SQLException {
//        try {
//            Connection con;
//            PreparedStatement pst;
//            ResultSet rs;
//            try ( // Configuración de la conexión a la base de datos
//                    XSSFWorkbook workbook = new XSSFWorkbook()) {
//                XSSFSheet sheet = workbook.createSheet("Resultados");
//                //Titulo de excel
//                String[] cabecera = new String[]{"Código", "Nombre", "Carrera", "Perfil", "Semestre", "Correo", "Password", "Nivel"};
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
//                String sql = "select * from usuario where Motivo_Carta='Titulacion' or Motivo_Carta='Baja Voluntaria';";
//                Class.forName(db.getDriver());
//                con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
//                pst = con.prepareStatement(sql);
//                rs = pst.executeQuery();
//// Creación del archivo Excel
//                int rowNum = 2;
//                while (rs.next()) {
//                    Row row = sheet.createRow(rowNum++);
//                    int colNum = 0;
//                    while (colNum < 10) {
//                        Cell cell = row.createCell(colNum++);
//                        cell.setCellValue(rs.getString(colNum));
//                    }
//                }
//// Guardar el archivo Excel en disco
//                FileOutputStream outputStream = new FileOutputStream("C:\\Users\\netor\\OneDrive\\Escritorio\\CartaNoAdeudo.xlsx");
//                workbook.write(outputStream);
//            }
//
//// Cerrar la conexión a la base de datos y liberar los recursos
//            rs.close();
//            pst.close();
//            con.close();
//
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(DAO_Usuario.class
//                    .getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
//    }

    //    //  Consulta todas las solicitudes de carta de no adeudo de un usuario en especifico.  
//    public List<Usuarios> BuscadorCarta(String Criterio, String id) {
//        List<Usuarios> datos = new ArrayList();
//        Connection con;
//        PreparedStatement pst;
//        ResultSet rs;
//        String sql = "SELECT * FROM carta_adeudo WHERE Correo_C LIKE '%" + Criterio + "%' AND Estatus LIKE '%" + id + "%' ORDER BY Fecha DESC,Hora DESC";
//
//        try {
//            Class.forName(db.getDriver());
//            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
//            pst = con.prepareStatement(sql);
//            rs = pst.executeQuery();
//            while (rs.next()) {
//                
//               datos.add(new Usuarios(rs.getInt("id_Carta"), rs.getString("Correo_C"), rs.getString("Ciclo_Escolar"), rs.getString("Motivo"), rs.getString("Estatus"),rs.getString("Fecha"),rs.getString("Hora"),rs.getString("Fecha_Entrega")));
//            }
//            con.close();
//        } catch (ClassNotFoundException | SQLException e) {
//        }
//        return datos;
//    }
//    
    @Override
    public String Eliminar(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<?> trigger() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void Usuarios(int user) {
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
