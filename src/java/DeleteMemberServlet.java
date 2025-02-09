import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteMemberServlet")
public class DeleteMemberServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:derby://localhost:1527/terraDB";
    private static final String DB_USERNAME = "haziq";
    private static final String DB_PASSWORD = "haziq";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String memberId = request.getParameter("memberId");

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD)) {
            String sql = "DELETE FROM Member WHERE Member_ID = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, memberId);
                int rowsAffected = preparedStatement.executeUpdate();
                
                if (rowsAffected > 0) {
                    response.getWriter().write("Success");
                } else {
                    response.getWriter().write("Failed");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error");
        }
    }
}
