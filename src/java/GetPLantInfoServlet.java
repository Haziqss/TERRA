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

@WebServlet("/GetPLantInfoServlet")
public class GetPLantInfoServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:derby://localhost:1527/terraDB";
    private static final String JDBC_USER = "haziq";
    private static final String JDBC_PASSWORD = "haziq";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String sql = "SELECT PLANTNAME, PLANTPICTURE, PLANTTYPE, PLANTDESCRIPTION, PLANTTUTORIAL FROM PLANT";

            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {

                boolean hasData = false;
                while (rs.next()) {
                    hasData = true;

                    String plantName = rs.getString("PLANTNAME");
                    String plantPicture = rs.getString("PLANTPICTURE");
                    String plantType = rs.getString("PLANTTYPE");
                    String plantDescription = rs.getString("PLANTDESCRIPTION");
                    String plantTutorial = rs.getString("PLANTTUTORIAL");
                    

                    // Render HTML dynamically
                    out.println("<div class='col d-flex flex-column align-items-center' style='border-radius: 30px; background: linear-gradient(black, #dfefd7 0%), #dfefd7;'>");
                    out.println("<h1 class='display-5'>" + plantName + "</h1>");
                    out.println("<img class='img-fluid' src='uploads/" + plantPicture + "' alt='" + plantName + "' style='border-radius: 30px; margin-top: 10px; width: 300px; height: 300px;'>");
                    out.println("<p class='fs-5' style='font-family: \"Work Sans\", sans-serif; margin-top: 20px;'>");
                    out.println("<strong>Type:</strong> " + plantType + "<br>");
                    out.println("<strong>Description:</strong> " + plantDescription + "<br>");
                    out.println("<strong>Tutorial:</strong> " + plantTutorial + "</p>");
                    out.println("</div>");
                }

                if (!hasData) {
                    out.println("<div class='col'>No plants available at the moment.</div>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<div class='col'>Error fetching plant data.</div>");
            }
        }
    }
}
