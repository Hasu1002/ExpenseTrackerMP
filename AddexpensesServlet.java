import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jbdc.Database;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/Addexpenses")
public class AddexpensesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strUsername = request.getParameter("strUsername");
        String strExpenseType = request.getParameter("strExpenseType");
        String strItem = request.getParameter("strItem");
        int numAmount = Integer.parseInt(request.getParameter("numAmount"));
        String date = request.getParameter("dateEdate");
        LocalDate dateEdate = LocalDate.parse(date);

        Database o = new Database(strUsername, strExpenseType, strItem, numAmount, dateEdate);
        if (o.addExpense()) {
            request.setAttribute("strUsername", strUsername);
            RequestDispatcher req = request.getRequestDispatcher("Home.jsp");
            req.forward(request, response);
        }

    }
}
