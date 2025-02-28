import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/LoginServlet")
public class LoginServelt extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Predefined username and password
    private static final String VALID_USERNAME = "Admin";
    private static final String VALID_PASSWORD = "Admin@123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("user");
        String password = request.getParameter("pwd");

        if (VALID_USERNAME.equals(username) && VALID_PASSWORD.equals(password)) {
            // Redirect back to login.jsp with a success message
            request.setAttribute("successMessage", "Login successful! Welcome, " + username + ".");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Invalid Username or Password. Try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }
}
