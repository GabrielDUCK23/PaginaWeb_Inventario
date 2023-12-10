import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import Modelado.Database;

@WebServlet("/CheckDatabase")
public class CheckDatabaseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Obteniendo la información de la base de datos desde la clase Database
        Database db = new Database();
        String driver = db.getDriver();
        String url = db.getUrl();
        String usuario = db.getUsuario();
        String contraseña = db.getContraseña();

        Connection connection = null;
        String message;
        try {
            // Intentando establecer conexión a la base de datos
            Class.forName(driver);
            connection = DriverManager.getConnection(url, usuario, contraseña);
            message = "Conexión exitosa a la base de datos.";
        } catch (ClassNotFoundException | SQLException e) {
            message = "Error al conectar a la base de datos: " + e.getMessage();
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                // Manejar el cierre de la conexión si hay un error
            }
        }

        out.println("<html><body>");
        out.println("<h1>Estado de la conexión a la base de datos:</h1>");
        out.println("<p>" + message + "</p>");
        out.println("</body></html>");
    }
}
