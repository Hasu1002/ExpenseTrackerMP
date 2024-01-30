package jbdc;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;

public class Database {

    static String dbUrl = "jdbc:mysql://localhost:3307/project";
    static String dbUname = "root";
    static String dbPassword = "";
    static String dbDriver = "com.mysql.cj.jdbc.Driver";

    String strUsername, numPhoneno, strEmail, strGender, strPassword, strConfirmPassword, strExpenseType, strItem;
    LocalDate dateEdate;
    int numId,numAmount;

    public Database(String strUsername, String numPhoneno, String strEmail, String strGender, String strPassword, String strConfirmPassword) {
        this.strUsername = strUsername;
        this.numPhoneno = numPhoneno;
        this.strEmail = strEmail;
        this.strGender = strGender;
        this.strPassword = strPassword;
        this.strConfirmPassword = strConfirmPassword;
    }

    public Database(String strUsername, String strPassword) {
        this.strUsername = strUsername;
        this.strPassword = strPassword;
    }

    public Database(String strUsername, String strExpenseType, String strItem, int numAmount, LocalDate dateEdate) {
        this.strUsername = strUsername;
        this.strExpenseType = strExpenseType;
        this.strItem = strItem;
        this.numAmount = numAmount;
        this.dateEdate = dateEdate;
    }

    public Database(int numId) {
        this.numId = numId;
    }

    public Database(String strUsername, int numId) {
    	this.strUsername = strUsername;
    	this.numId = numId;
	}

	public void validate() {
        Connection con = null;
        try {
            Class.forName(dbDriver);
            con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);

            String sql = "INSERT INTO userdetails (Username, Phoneno, Email, Gender, Password)"
                    + "VALUES('" + strUsername + "','" + numPhoneno + "','" + strEmail + "','" + strGender + "','" + strPassword + "')";

            Statement s = con.createStatement();
            s.execute(sql);

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean login() {
        Connection con = null;
        try {
            Class.forName(dbDriver);
            con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
            String sql = "SELECT * FROM userdetails WHERE Username='" + strUsername + "' AND Password='" + strPassword + "'";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean addExpense() {
        Connection con = null;
        try {
            Class.forName(dbDriver);
            con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);

            String sql = "INSERT INTO expenses (Username, Expense, Item, Amount, Date)"
                    + "VALUES('" + strUsername + "','" + strExpenseType + "','" + strItem + "','" + numAmount + "','" + dateEdate + "')";

            Statement s = con.createStatement();
            s.execute(sql);

            con.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean delete() {
        try {
            Class.forName(dbDriver);
            Connection connection = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
            String deleteQuery = "DELETE FROM expenses WHERE id =  '" + numId + "'";
            try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
                int rowsAffected = preparedStatement.executeUpdate();

                if (rowsAffected > 0) {
                    return true;
                } else {
                    return false;
                }
            }
        } catch (Exception e) {
        	 return false;
        }
        
    }
}
