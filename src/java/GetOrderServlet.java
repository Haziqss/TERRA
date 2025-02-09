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

@WebServlet("/GetOrderServlet")
public class GetOrderServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:derby://localhost:1527/terraDB";
    private static final String JDBC_USER = "haziq";
    private static final String JDBC_PASSWORD = "haziq";
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    response.setContentType("text/html;charset=UTF-8");
    response.setCharacterEncoding("UTF-8");

    try (PrintWriter out = response.getWriter()) {
        String sql = "SELECT orderID, memberName, memberAddress, receipt, status FROM checkout";

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement statement = conn.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {

            boolean hasData = false;
            while (rs.next()) {
                hasData = true;

                int orderID = rs.getInt("orderID");
                String memberName = rs.getString("memberName") == null ? "N/A" : rs.getString("memberName");
                String memberAddress = rs.getString("memberAddress") == null ? "N/A" : rs.getString("memberAddress");
                String receipt = rs.getString("receipt") == null ? "N/A" : rs.getString("receipt");
               
              String receiptPath = "uploads/" + receipt; // Relative path for web access
String status = rs.getString("status") == null ? "Ongoing" : rs.getString("status");

out.println("<tr data-id='" + orderID + "'>");
out.println("<td>" + orderID + "</td>");
out.println("<td>" + memberName + "</td>");
out.println("<td>" + memberAddress + "</td>");

// Display receipt image
if (!"N/A".equals(receipt)) {
    out.println("<td><a href='" + receiptPath + "' target='_blank'><img src='" + receiptPath + "' alt='Receipt' style='width: 50px; height: 50px; object-fit: cover;'></a></td>");
} else {
    out.println("<td>No Receipt</td>");
}

// Status button (toggle between Ongoing and Complete)
out.println("<td><button id='statusBtn-" + orderID + "' onclick=\"toggleStatus('" + orderID + "', '" + status + "')\">" + status + "</button></td>");

// Delete button
out.println("<td><button class='btn btn-sm btn-danger' onclick='deleteOrder(" + orderID + ")'>Delete</button></td>");

out.println("</tr>");


                                }

            if (!hasData) {
                out.println("<tr><td colspan='4'>No Order found.</td></tr>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
        }
    }
}

}


