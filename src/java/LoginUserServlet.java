import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginUserServlet")
public class LoginUserServlet extends HttpServlet {
    private static final String URL = "jdbc:derby://localhost:1527/terraDB";
    private static final String USER = "haziq";
    private static final String PASSWORD = "haziq";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Load JDBC driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);

            // Check credentials in the database
            String sql = "SELECT * FROM member WHERE email = ? AND password = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                // User authenticated, store all user details in the session
                HttpSession session = request.getSession();
                session.setAttribute("member_id", rs.getInt("member_id")); // Store member_id
                session.setAttribute("username", rs.getString("username")); // Store username
                session.setAttribute("email", rs.getString("email")); // Store email
                session.setAttribute("firstName", rs.getString("firstName")); // Store first name
                session.setAttribute("lastName", rs.getString("lastName")); // Store last name
                session.setAttribute("phoneNumber", rs.getString("phoneNumber")); // Store phone number

                // Redirect to user home page
                response.sendRedirect("U-HomeUser.jsp");
            } else {
                // Invalid login
                response.sendRedirect("U-LogIn.jsp?error=invalid");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("U-LogIn.jsp?error=server");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
