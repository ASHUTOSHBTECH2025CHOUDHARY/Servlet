import java.io.IOException;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/LoginServlet")
public class LoginServelt extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String VALID_USERNAME = "Admin";
    private static final String VALID_PASSWORD = "Admin@123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("user");
        String password = request.getParameter("pwd");

        if (!isValidUsername(username)) {
            request.setAttribute("errorMessage", "Invalid Username! It must start with a capital letter.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (!isValidPassword(password)) {
            request.setAttribute("errorMessage", "Invalid Password! It must be at least 8 characters, contain one uppercase letter, one number, and exactly one special character.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (VALID_USERNAME.equals(username) && VALID_PASSWORD.equals(password)) {
            request.setAttribute("successMessage", "Login successful! Welcome, " + username + ".");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Invalid Username or Password. Try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }

    private boolean isValidUsername(String username) {
        return Pattern.matches("[A-Z][a-zA-Z0-9]*", username);
    }

    private boolean isValidPassword(String password) {
        String PASSWORD_REGEX = "^(?=.*[A-Z])(?=.*\\d)(?=(?:[^!@#$%^&*()_+\\-=\\[\\]{};':\"\\|,.<>/?]*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\|,.<>/?]){1}[^!@#$%^&*()_+\\-=\\[\\]{};':\"\\|,.<>/?]*$).{8,}$";
        return Pattern.matches(PASSWORD_REGEX, password);
    }
}
