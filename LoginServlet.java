import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jbdc.Database;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String strUsername = request.getParameter("strUsername");
        String strPassword = request.getParameter("strPassword");

        Database db = new Database(strUsername, strPassword);

        if (db.login()) {
            response.getWriter().append("Logged in");
            request.setAttribute("strUsername", strUsername);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
            dispatcher.forward(request, response);
        } else {
            response.getWriter().append("Incorrect username and password");
        }
    }
}
