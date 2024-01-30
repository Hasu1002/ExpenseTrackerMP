<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
       	#profileButton {
            position: absolute;
            top: 10px;
            left: 10px;
            padding: 10px;
            background:rgba(256,256,256,0.2);
            backdrop-filter: blur(1rem);
            color: black;
            border: none;
            cursor: pointer;
            border-radius: 50%;
            text-decoration: none; /* To remove underline for links */
            font-size: 18px;
        }

        #profileButton:hover {
            background-color: #495057;
        }
       	 body {
       	 	background-image : url('https://images.unsplash.com/photo-1464618663641-bbdd760ae84a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8d2Vic2l0ZSUyMGJhY2tncm91bmR8ZW58MHx8MHx8fDA%3D');
            background-color:#B0C4DE;
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            
        }
       	
       	
        .modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        /* Style for the modal content */
        .modal-content {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }      
        .expense-form {
            text-align: center;
            margin: 20px;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(1rem);
            padding: 2rem;
            border-radius: 1.5rem;
            box-shadow: 0 0.4rem 0.8rem rgba(0, 0, 0, 0.1);
            width: 30rem;
            margin-left:28%;

        }

        h1 {
             font-size: 1.5rem;
            margin-bottom: 2rem;
            color: #333;
        }

        button {
            padding: 1rem 2rem;
            background-color: #6c757d;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 0.5rem;
        }
        
        button:hover {
            background-color: #495057;
        }
        

        /* Popup form style */
        #popupForm{
             display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 40%;
            max-height:90%;
            max-width: 40rem;
            background-color: #f2f2f2;
            padding: 2rem;
            border: 1px solid #ccc;
            border-radius: 0.5rem;
            box-shadow: 0 0.4rem 0.8rem 0 rgba(0,0,0,0.2);

        }


        .close-btn {
            float: right;
            cursor: pointer;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        select,
        input[type="date"] {
            width: 70%;
            padding: 0.5rem;
            margin-top: 0.5rem;
            margin-bottom: 0.5rem;
            border: 1px solid #ccc;
            border-radius: 1rem;
            box-sizing: border-box;

        }

        .formb, .editb, .deleteb {
            width: 50%;
            padding: 1rem 1.5rem;
            cursor: pointer;
            border-radius: 0.5rem;
            margin-top: 1rem;
            color: white;

        }

    .button-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh; /* Optional: Adjust the height based on your layout */
}

.editb, .deleteb {
    display: inline-block;
    margin: 0 10px; /* Adjust the margin as needed for spacing between buttons */
    padding: 10px; /* Adjust the padding based on your design preference */
    text-align: center;
    cursor: pointer;
}

.editb {
    background-color: #ec9006;
}

.deleteb {
    background-color: #ff0000;
}


        button {
            display: inline-block;
            margin-right: 5px;
        }

        /* Table style */
        table {
            width: 80%;
            border-collapse: collapse;
            margin: auto;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 0.8rem;
            text-align: left;

        }
        td{
        	color: white;
        	font-size: 18px
        }
	
        th {
            background-color: #f2f2f2;
        }

        .align-right {
            text-align: right;
        }

        .align-center {
            text-align: center;
        }
        
    </style>
    <script>
        function openForm() {
            document.getElementById("popupForm").style.display = "block";
        }

        function closeForm() {
            document.getElementById("popupForm").style.display = "none";
        }
        function openModal(strUsername, dateEdate, strExpenseType, strItem, numAmount, numId) {
            var pageUrl = 'editForm.jsp?strUsername=' + strUsername + '&numId=' + numId + '&dateEdate=' + dateEdate + '&strExpenseType=' + strExpenseType + '&strItem=' + strItem + '&numAmount=' + numAmount;
          	 
            document.getElementById('modalOverlay').style.display = 'flex';
            var modalContent = document.getElementById('modalContent');
            modalContent.innerHTML = '<object type="text/html" data="' + pageUrl + '" width="500px" height="500px"></object>';
			
            /*var newWindow = window.open(pageUrl);*/
        }

       </script>
    <title>Expense Tracker</title>
</head>
<body>
	<a id="profileButton" href="Profile.jsp?strUsername=<%= request.getAttribute("strUsername") %>">Profile</a>
	<div class="expense-form">

        <h1>Welcome to Expense Tracker, <%= request.getAttribute("strUsername") %>!</h1>

        <button onclick="openForm()">Open Form</button>
    </div>
    <div id="popupForm">
            <span class="close-btn" onclick="closeForm()">&times;</span>
            <center><h2>Add expenses:</h2></center>
            <form action="AddexpensesServlet" method="post">
            <center>
                <div class="form-group">
                    <label for="expenseType">Expense Type</label><br>
                    <select id="strExpenseType" name="strExpenseType" required>
                    <option value="None" disabled selected hidden></option>
                        <option value="groceries">Groceries</option>
                        <option value="utilities">Utilities</option>
                        <option value="entertainment">Entertainment</option>
                        <!-- Add more options as needed -->
                    </select>
                </div>

                <div class="form-group">
                    <label for="strItem">Item</label><br>
                    <input type="text" id="strItem" name="strItem" placeholder="Enter an Item" required>
                </div>
                <input type="hidden" id="strUsername" name="strUsername" value="<%= request.getAttribute("strUsername") %>">
                <div class="form-group">
                    <label for="numAmount">Amount</label><br>
                    <input type="number" id="numAmount" name="numAmount" placeholder="Enter amount" required>
                </div>

                <div class="form-group">
                    <label for="dateEdate">Date</label><br>
                    <input type="date" id="dateEdate" name="dateEdate" required>
                </div>

                <button class="formb" type="submit">Add Expense</button>
                </center>
            </form>
        </div><br><br>
    <div id="tableContainer" class="g">
        <% try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/project", "root", "");
            String sql = "SELECT * FROM expenses where Username= '" + request.getAttribute("strUsername") + "'";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            int sum = 0;
        %>
        <table>
            <tr>
                <th>Date</th>
                <th>Category</th>
                <th>Name</th>
                <th>Amount</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <% if (!rs.next()) { %>
            <tr>
                <td class="align-center" colspan="6">No records found</td>
            </tr>
            <% } else {
                do { %>
            <tr>
                <td><%= rs.getString(6) %></td>
                <td><%= rs.getString(4) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(5) %></td>
                <td>
    				<button class="editb" type="button" onclick="openModal('<%= request.getAttribute("strUsername") %>', '<%= rs.getString(6) %>', '<%= rs.getString(4) %>', '<%= rs.getString(3) %>', '<%= rs.getString(5) %>', '<%= rs.getString(1) %>')">Edit</button>
           		</td>
           		</div>
                <td>
                    <form action="DeleteEntryServlet" method="post">
                        <input type="hidden" id="strUsername" name="strUsername" value="<%= request.getAttribute("strUsername") %>">
                        <input type="hidden" name="numId" value="<%= rs.getString(1) %>" />
                        <button class="deleteb" type="submit">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                String str = rs.getString(5);
                sum += Integer.parseInt(str);
            } while (rs.next());
            %>
            <tr>
                <td class="align-right" colspan="3">Total Expenses </td>
                <td><%= sum %></td>
            </tr>
            <% }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        } %>
		</table>
		
		<div id="modalOverlay" class="modal-overlay" onclick="closeModal()">
        	<div class="modal-content" onclick="event.stopPropagation()" id="modalContent">
        </div>
    </div>
    </div>
</body>
</html>
