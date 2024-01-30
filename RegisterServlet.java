import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jbdc.Database;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/DemoServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegisterServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strUsername = request.getParameter("strUsername");
        String numMobile = request.getParameter("numMobile");
        String strEmail = request.getParameter("strEmail");
        String strGender = request.getParameter("strGender");
        String strPassword = request.getParameter("strPassword");
        String strConfirmPassword = request.getParameter("strConfirmPassword");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();        
        Database userDatabase = new Database(strUsername, numMobile, strEmail, strGender, strPassword, strConfirmPassword);
        userDatabase.validate();
        response.sendRedirect("Login.html");
    }
}
