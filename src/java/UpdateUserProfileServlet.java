import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateUserProfileServlet")
public class UpdateUserProfileServlet extends HttpServlet {
    private static final String URL = "jdbc:derby://localhost:1527/terraDB";
    private static final String USER = "haziq";
    private static final String PASSWORD = "haziq";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form parameters
        int memberId = Integer.parseInt(request.getParameter("member_id"));
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phoneNumber = request.getParameter("phoneNumber");

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // Connect to database
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);

            // Update query
            String sql = "UPDATE member SET username = ?, email = ?, firstname = ?, lastname = ?, phonenumber = ? WHERE member_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, firstName);
            ps.setString(4, lastName);
            ps.setString(5, phoneNumber);
            ps.setInt(6, memberId);

            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated > 0) {
                // Update successful, redirect back to profile page
                response.sendRedirect("U-HomeUser.jsp?success=profileUpdated");
            } else {
                // Update failed
                response.sendRedirect("editProfile.jsp?error=updateFailed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("editProfile.jsp?error=serverError");
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
