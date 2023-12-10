package Modelado;

/**
 * Clase que representa la configuración de conexión a la base de datos MariaDB.
 */
public class Database {

    private String driver;       // Controlador JDBC
    private String url;          // URL de la base de datos
    private String usuario;      // Nombre de usuario de la base de datos
    private String contraseña;   // Contraseña de la base de datos

    /**
     * Constructor de la clase que inicializa los valores de configuración.
     */
    public Database(){
            this.driver = "com.mysql.jdbc.Driver";
            this.url = "jdbc:mysql://localhost:3306/inventario_cut";
            this.usuario = "root";
            this.contraseña ="1234";
        }

    /**
     * Obtiene el controlador JDBC.
     * 
     * @return El controlador JDBC.
     */
    public String getDriver() {
        return driver;
    }

    /**
     * Obtiene la URL de la base de datos.
     * 
     * @return La URL de la base de datos.
     */
    public String getUrl() {
        return url;
    }

    /**
     * Obtiene el nombre de usuario de la base de datos.
     * 
     * @return El nombre de usuario de la base de datos.
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * Obtiene la contraseña de la base de datos.
     * 
     * @return La contraseña de la base de datos.
     */
    public String getContraseña() {
        return contraseña;
    }
}
