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

@WebServlet("/GetMemberServlet")
public class GetMemberServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:derby://localhost:1527/terraDB";
    private static final String JDBC_USER = "haziq";
    private static final String JDBC_PASSWORD = "haziq";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        try (PrintWriter out = response.getWriter()) {
            // SQL query to fetch member details
            String sql = "SELECT member_ID, username, phoneNumber FROM member";

            // Connect to the database
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
                 PreparedStatement statement = conn.prepareStatement(sql);
                 ResultSet rs = statement.executeQuery()) {

                // Check if the result set is empty
                boolean hasData = false;
                while (rs.next()) {
                    hasData = true;

                    int member_ID = rs.getInt("member_ID");
                    String username = rs.getString("username") == null ? "N/A" : rs.getString("username");
                    String phoneNumber = rs.getString("phoneNumber") == null ? "N/A" : rs.getString("phoneNumber");

                    out.println("<tr data-id='" + member_ID + "'>");
                out.println("<td>" + member_ID + "</td>"); // Member ID column
                out.println("<td>" + username + "</td>"); // Name column
                out.println("<td>" + phoneNumber + "</td>"); // Contact column
                out.println("<td><button class=\"btn btn-danger btn-sm\" onclick=\"deleteMember(" + member_ID + ")\">Delete</button></td>");
                out.println("</tr>");
                }

                if (!hasData) {
                    out.println("<tr><td colspan='4'>No members found.</td></tr>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<tr><td colspan='4'>Error: Unable to fetch data from the database</td></tr>");
            }
        }
    }
}
