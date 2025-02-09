import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/InsertPlantServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50   // 50MB
)
public class InsertPlantServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:derby://localhost:1527/terraDB";
    private static final String JDBC_USER = "haziq";
    private static final String JDBC_PASSWORD = "haziq";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String plantName = request.getParameter("plantName");
        String plantType = request.getParameter("plantType");
        String plantDescription = request.getParameter("plantDescription");
        String plantTutorial = request.getParameter("plantTutorial");
        String plantPrice = request.getParameter("plantPrice");
        String adminID = request.getParameter("adminID");

        Part filePart = request.getPart("plantPicture");
        String filePath = null;

        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            String uploadPath = "C:\\Users\\Asus\\Documents\\NetBeansProjects\\FarmSystem\\web\\uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            File file = new File(uploadPath + File.separator + fileName);
            try (InputStream fileContent = filePart.getInputStream(); FileOutputStream outputStream = new FileOutputStream(file)) {
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = fileContent.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
            }

            filePath = "../uploads/" + fileName;
        }

        try {
            
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

          String sql = "INSERT INTO plant (plantName, plantPicture, plantType, plantDescription, plantTutorial, plantPrice, adminID) "
           + "VALUES (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, plantName);
            statement.setString(2, filePath);
            statement.setString(3, plantType);
            statement.setString(4, plantDescription);
            statement.setString(5, plantTutorial);
            statement.setString(6, plantPrice);
            statement.setString(7, adminID);

            int rowsInserted = statement.executeUpdate();

            if (rowsInserted > 0) {
               response.sendRedirect("A-AdminDash.jsp");


            } else {
                response.getWriter().println("<p>Failed to insert plant!</p>");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<p>Error: " + e.getMessage() + "</p>");
        }
    }
}
