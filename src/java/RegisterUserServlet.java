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

@WebServlet("/RegisterUserServlet")
public class RegisterUserServlet extends HttpServlet {
    private static final String URL = "jdbc:derby://localhost:1527/terraDB";
    private static final String USER = "haziq";
    private static final String PASSWORD = "haziq";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve user input
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phoneNumber = request.getParameter("phoneNumber");

        // Validate password match
        if (!password.equals(confirmPassword)) {
            out.println("<script type='text/javascript'>"
                    + "alert('Passwords do not match!');"
                    + "window.location.href='U-Register.jsp';"
                    + "</script>");
            return;
        }

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Load the Derby driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            // Establish connection to the database
            conn = DriverManager.getConnection(URL, USER, PASSWORD);

            // Check if the username or email already exists
            String checkQuery = "SELECT COUNT(*) FROM member WHERE username = ? OR email = ?";
            ps = conn.prepareStatement(checkQuery);
            ps.setString(1, username);
            ps.setString(2, email);
            rs = ps.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                if (count > 0) {
                    out.println("<script type='text/javascript'>"
                            + "alert('Username or email already taken. Please try again with a different one.');"
                            + "window.location.href='U-Register.jsp';"
                            + "</script>");
                    return;
                }
            }

            // Prepare the SQL statement for inserting the new member
            String sql = "INSERT INTO member (username, email, password, firstName, lastName, phoneNumber) VALUES (?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);

            // Set parameters
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password); // Store password as plain text for simplicity (use hashing in production)
            ps.setString(4, firstName);
            ps.setString(5, lastName);
            ps.setString(6, phoneNumber);

            // Execute the insert query
            int result = ps.executeUpdate();

            if (result > 0) {
                // Registration successful, show success pop-up and redirect
                out.println("<script type='text/javascript'>"
                        + "alert('Registration successful! Redirecting to login page...');"
                        + "window.location.href='U-LogIn.jsp';"
                        + "</script>");
            } else {
                // Registration failed, show failure pop-up
                out.println("<script type='text/javascript'>"
                        + "alert('Registration failed. Please try again.');"
                        + "window.location.href='U-Register.jsp';"
                        + "</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script type='text/javascript'>"
                    + "alert('Error: " + e.getMessage() + "');"
                    + "window.location.href='U-Register.jsp';"
                    + "</script>");
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
