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

@WebServlet("/FetchUserFeedServlet")
public class FetchUserFeedServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:derby://localhost:1527/terraDB";
    private static final String JDBC_USER = "haziq";
    private static final String JDBC_PASSWORD = "haziq";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("member_id") == null) {
                out.println("<div class='col'>Session expired. Please log in again.</div>");
                return;
            }

            int memberId = (Integer) session.getAttribute("member_id");

            // Query to fetch feed details and username
            String sql = "SELECT f.feedCaption, f.feedPicture, m.username " +
                         "FROM userFeed f " +
                         "JOIN member m ON f.member_id = m.member_id " +
                         "WHERE f.member_id = ?";

            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setInt(1, memberId);
                try (ResultSet rs = stmt.executeQuery()) {

                    boolean hasData = false;
                    while (rs.next()) {
                        hasData = true;

                        String feedCaption = rs.getString("feedCaption");
                        String feedPicture = rs.getString("feedPicture");
                        String username = rs.getString("username");

                        // Render HTML dynamically
out.println("<div class='card' style='width: 100%; margin: 20px auto; border-radius: 15px; background: white; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);'>");

// Header Section with Username
out.println("<div class='card-header' style='display: flex; align-items: center; padding: 15px; border-bottom: 1px solid #e0e0e0;'>");
out.println("<div style='flex-grow: 1;'>");
out.println("<h5 class='card-title' style='margin: 0; font-family: \"Work Sans\", sans-serif; font-size: 1.2rem;'>" + username + "</h5>");
out.println("<small style='color: gray; font-family: \"Work Sans\", sans-serif;'>Shared a post</small>");
out.println("</div>");
out.println("</div>");

// Body Section with Caption and Image
out.println("<div class='card-body' style='padding: 15px;'>");
out.println("<p style='font-family: \"Work Sans\", sans-serif; font-size: 1rem; margin-bottom: 15px;'>" + feedCaption + "</p>");
if (feedPicture != null && !feedPicture.isEmpty()) {
    out.println("<div style='text-align: center;'>");
    out.println("<img class='img-fluid' src='feedUploads/" + feedPicture + "' alt='Feed Image' style='width: 100%; max-width: 600px; height: auto; border-radius: 10px; object-fit: cover;'>");
    out.println("</div>");
}
out.println("</div>");


out.println("</div>");

                    }

                    if (!hasData) {
                        out.println("<div class='col'>No feeds available at the moment.</div>");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<div class='col'>Error fetching feed data.</div>");
            }
        }
    }
}
