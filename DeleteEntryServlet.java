import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jbdc.Database;
import java.io.IOException;

@WebServlet("/DeleteEntryServlet")
public class DeleteEntryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	    response.setContentType("text/html;charset=UTF-8");
          
            int numId = Integer.parseInt(request.getParameter("numId"));
            String strUsername = request.getParameter("strUsername");
            
            Database o = new Database(strUsername, numId);
            if (o.delete()) {
                request.setAttribute("strUsername", strUsername);
                RequestDispatcher req = request.getRequestDispatcher("Home.jsp");
                req.forward(request, response);
            }

            
            
    }
}
