import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

@WebServlet("/BuyPlant")
public class BuyPlant extends HttpServlet {

    private static final String JDBC_URL = "jdbc:derby://localhost:1527/terraDB";
    private static final String JDBC_USER = "haziq";
    private static final String JDBC_PASSWORD = "haziq";
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    response.setContentType("text/html;charset=UTF-8");
    response.setCharacterEncoding("UTF-8");

    try (PrintWriter out = response.getWriter()) {
        String sql = "SELECT plantID, plantName, plantType, plantDescription, plantTutorial, plantPicture,plantPrice FROM plant";

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement statement = conn.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {

            boolean hasData = false;
            while (rs.next()) {
                hasData = true;

                int plantID = rs.getInt("plantID");
                String plantName = rs.getString("plantName") == null ? "N/A" : rs.getString("plantName");
                String plantType = rs.getString("plantType") == null ? "N/A" : rs.getString("plantType");
                String plantPrice = rs.getString("plantPrice") == null ? "N/A" : rs.getString("plantPrice");
                String plantDescription = rs.getString("plantDescription") == null ? "N/A" : rs.getString("plantDescription");
                String plantTutorial = rs.getString("plantTutorial") == null ? "N/A" : rs.getString("plantTutorial");
                String plantPicture = rs.getString("plantPicture") == null ? "N/A" : rs.getString("plantPicture");

                out.println("<tr data-id='" + plantID + "'>");
                out.println("<td>" + plantID + "</td>");
                out.println("<td>" + plantName + "</td>");
                out.println("<td>" + plantType + "</td>");
                out.println("<td>" + plantPrice + "</td>");
                out.println("<td>");
                out.println("<a href='Checkout.jsp?plantID=" + plantID +
                        "&plantName=" + URLEncoder.encode(plantName, "UTF-8") +
                        "&plantDescription=" + URLEncoder.encode(plantDescription, "UTF-8") +
                        "&plantType=" + URLEncoder.encode(plantType, "UTF-8") +
                        "&plantTutorial=" + URLEncoder.encode(plantTutorial, "UTF-8") +
                        "&plantPicture=" + URLEncoder.encode(plantPicture, "UTF-8") +
                        "' class=\"btn btn-primary btn-sm\">Buy</a>");
                out.println("</td>");
                out.println("</tr>");
            }

            if (!hasData) {
                out.println("<tr><td colspan='4'>No plant found.</td></tr>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
        }
    }
}

}
