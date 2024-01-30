<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function closeWindow() {
		window.parent.location.reload();
	}
</script>
<style>
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
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    /* Updated style for form buttons */
    .form-buttons {
        display: flex;
        justify-content: space-between;
        margin-top: 10px;
    }

    .formb,
    .editb {
        width: 48%; /* Adjusted width to leave a small gap between buttons */
        padding: 15px 20px;
        cursor: pointer;
        border-radius: 5px;
        color: white;
    }

    .formb {
        background-color: #3cb043;
    }

    .editb {
        background-color: #ec9006;
    }
</style>

</head>
<body>
     <h2><center>Edit Form</center></h2>
        
        <form action="EditEntryServlet" method="post" onsubmit="closeWindow()">
            <div class="form-group">
                <label for="strExpenseType">Expense Type</label>
                <select id="strExpenseType" name="strExpenseType" required>
                    <option value="groceries" <% if(request.getParameter("strExpenseType").equals("groceries")){%> selected <%}%>  >Groceries</option>
                    <option value="utilities" <% if(request.getParameter("strExpenseType").equals("utilities")){%> selected <%}%> >Utilities</option>
                    <option value="entertainment" <% if(request.getParameter("strExpenseType").equals("entertainment")){%> selected <%}%>>Entertainment</option>
                </select>
            </div>
            <div class="form-group">
                <label for="strItem">Item</label>
                <input type="text" id="strItem" name="strItem" placeholder="Enter an Item" value="<%= request.getParameter("strItem") %>" required>
            </div>
            <div class="form-group">
                <label for="numAmount">Amount</label>
                <input type="number" id="numAmount" name="numAmount" placeholder="Enter amount" value="<%= request.getParameter("numAmount") %>" required>
            </div>
            <div class="form-group">
                <label for="dateEdate">Date</label>
                <input type="date" id="dateEdate" name="dateEdate" value="<%= request.getParameter("dateEdate") %>" required>
            </div>
            <input type="hidden" name="numId" id="numId" value="<%= request.getParameter("numId") %>">
            <input type="hidden" id="strUsername" name="strUsername" value="<%= request.getParameter("strUsername") %>">
        	<div class="form-buttons">
            	<button class="formb" type="submit" value="Save">Save</button>
            	<button class="editb" type="button" value="Cancel" onclick="closeWindow();">Cancel</button>
            </div>
            </form>

</body>
</html>
