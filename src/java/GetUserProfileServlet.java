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
import javax.servlet.http.HttpSession;

@WebServlet("/GetUserProfileServlet")
public class GetUserProfileServlet extends HttpServlet {
    private static final String URL = "jdbc:derby://localhost:1527/terraDB";
    private static final String USER = "haziq";
    private static final String PASSWORD = "haziq";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Integer memberId = (Integer) session.getAttribute("member_id");

        if (memberId == null) {
            response.sendRedirect("U-LogIn.jsp?error=sessionExpired");
            return;
        }

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String sql = "SELECT username, email, firstName, lastName, phoneNumber FROM member WHERE member_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, memberId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("username", rs.getString("username"));
                request.setAttribute("email", rs.getString("email"));
                request.setAttribute("firstName", rs.getString("firstName"));
                request.setAttribute("lastName", rs.getString("lastName"));
                request.setAttribute("phoneNumber", rs.getString("phoneNumber"));
                request.getRequestDispatcher("editProfile.jsp").forward(request, response);
            } else {
                response.sendRedirect("U-LogIn.jsp?error=notFound");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("U-LogIn.jsp?error=serverError");
        }
    }
}


