import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDate;

@WebServlet("/EditServlet")
public class EditEntryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            	
    	int numId = Integer.parseInt(request.getParameter("numId"));
        String strUsername = request.getParameter("strUsername");
        String date = request.getParameter("dateEdate");
        LocalDate dateEdate = LocalDate.parse(date);
        String strExpenseType = request.getParameter("strExpenseType");
        String strItem = request.getParameter("strItem");
        int numAmount = Integer.parseInt(request.getParameter("numAmount"));

        System.out.print("Id "+numId+" username "+strUsername+" date "+dateEdate+" ExpenseType "+strExpenseType+" Item "+strItem+" amount "+numAmount);
        
        PrintWriter out = response.getWriter();
        
        String jdbcUrl = "jdbc:mysql://localhost:3307/project";
        String jdbcUsername = "root";
        String jdbcPassword = "";
        
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);

        	String edit = "UPDATE expenses SET Expense=?, Item=?, Amount=?, Date=? WHERE id=?";
        			try (PreparedStatement preparedStatement = connection.prepareStatement(edit)) {

        				preparedStatement.setString(1, strExpenseType);
        				preparedStatement.setString(2, strItem);
        				preparedStatement.setInt(3, numAmount);
        				preparedStatement.setDate(4, java.sql.Date.valueOf(dateEdate));
        				preparedStatement.setInt(5, numId);
        			    
                        int rowsAffected = preparedStatement.executeUpdate();

                        if (rowsAffected > 0) {
                        	
                        	request.setAttribute("strUsername", strUsername);
                            RequestDispatcher req = request.getRequestDispatcher("Home.jsp");
                            req.forward(request, response);
                        } else {
                            out.println("Entry not found or could not be deleted.");
                        }
                    }

                    // Close the connection
                    connection.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
   
        
    }
}
