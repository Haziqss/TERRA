import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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

@WebServlet("/EditPlantServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50   // 50MB
)
public class EditPlantServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:derby://localhost:1527/terraDB";
    private static final String DB_USER = "haziq";
    private static final String DB_PASSWORD = "haziq";

    // Directory for storing uploaded images
    private static final String UPLOAD_DIR = "C:\\Users\\Asus\\Documents\\NetBeansProjects\\FarmSystem\\web\\uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String plantID = request.getParameter("plantID");
        String plantName = request.getParameter("plantName");
        String plantDescription = request.getParameter("plantDescription");
        String plantType = request.getParameter("plantType");
        String plantTutorial = request.getParameter("plantTutorial");
        String filePath = null;

        // Handle file upload
        Part filePart = request.getPart("plantPicture");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            // Ensure the upload directory exists
            File uploadDir = new File(UPLOAD_DIR);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // Save the uploaded file
            File file = new File(UPLOAD_DIR + File.separator + fileName);
            try (InputStream fileContent = filePart.getInputStream();
                 FileOutputStream outputStream = new FileOutputStream(file)) {
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = fileContent.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
            }

            // Set the file path relative to the web directory
            filePath = "../uploads/" + fileName;
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            // Update plant data in the database
            String sql = "UPDATE plant SET plantName = ?, plantDescription = ?, plantType = ?, plantTutorial = ?, plantPicture = COALESCE(?, plantPicture) WHERE plantID = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, plantName);
                stmt.setString(2, plantDescription);
                stmt.setString(3, plantType);
                stmt.setString(4, plantTutorial);
                stmt.setString(5, filePath); // Use the new image path if uploaded
                stmt.setString(6, plantID);

                int rowsUpdated = stmt.executeUpdate();

                if (rowsUpdated > 0) {
                    response.sendRedirect("A-ManagePlant.jsp?success=true");
                } else {
                    response.sendRedirect("A-ManagePlant.jsp?error=true");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("A-ManagePlant.jsp?error=true");
        }
    }
}
