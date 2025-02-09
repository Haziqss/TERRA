import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/InsertFeedServlet")
@MultipartConfig
public class InsertFeedServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:derby://localhost:1527/terraDB";
    private static final String DB_USER = "haziq";
    private static final String DB_PASSWORD = "haziq";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get user input
        String feedCaption = request.getParameter("feedCaption");

        // Get logged-in user's member ID
        HttpSession session = request.getSession(false);
        Integer memberId = (Integer) session.getAttribute("member_id");

        if (memberId == null) {
            response.sendRedirect("U-LogIn.jsp?error=sessionExpired");
            return;
        }

        // Initialize variables
        String filePath = null;
        Part filePart = request.getPart("feedPicture");

        if (filePart != null && filePart.getSize() > 0) {
            // Get the file name
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            // Define the upload directory path
            String uploadPath = "C:\\Users\\Asus\\Documents\\NetBeansProjects\\FarmSystem\\web\\feedUploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir(); // Create directory if it doesn't exist
            }

            // Save the file to the upload directory
            File file = new File(uploadPath + File.separator + fileName);
            try (InputStream fileContent = filePart.getInputStream(); FileOutputStream outputStream = new FileOutputStream(file)) {
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = fileContent.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
            }

            // Set the relative file path for storing in the database
            filePath = "../feedUploads/" + fileName;
        }

        // Insert data into the database
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "INSERT INTO userFeed (feedCaption, feedPicture, member_id) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, feedCaption);
            ps.setString(2, filePath);
            ps.setInt(3, memberId);

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("U-UserFeed.jsp?success=true");
            } else {
                response.sendRedirect("U-UserFeed.jsp?error=insertionFailed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("U-UserFeed.jsp?error=serverError");
        }
    }
}
