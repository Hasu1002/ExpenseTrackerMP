<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style type="text/css">
        * {
            padding: 0;
            margin: 0;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        body {
            background: url(https://dl.dropbox.com/s/mpmu0gjtxv2x3fs/Webp.net-resizeimage%20%281%29.jpg?raw=1) no-repeat center center fixed;
            background-size: cover;
        }

        .card {
            height: 400px;
            width: 320px;
            background-color: rgba(255, 255, 255, 0.06);
            -webkit-backdrop-filter: blur(20px);
            backdrop-filter: blur(20px);
            position: absolute;
            margin: auto;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            border-radius: 8px;
            -webkit-box-shadow: 20px 20px 22px rgba(0, 0, 0, 0.2);
            box-shadow: 20px 20px 22px rgba(0, 0, 0, 0.2);
            font-family: 'Poppins', sans-serif;
        }

        .card-img {
            height: 120px;
            width: 120px;
            background-color: rgba(255, 255, 255, 0.06);
            -webkit-backdrop-filter: blur(20px);
            backdrop-filter: blur(20px);
            border-radius: 50%;
            position: absolute;
            margin: 30px auto 20px auto;
            left: 0;
            right: 0;
        }

        .card-img img {
            height: 86%;
            border-radius: 50%;
            margin-left: 7%;
            margin-top: 7%;
        }

        h6 {
            margin: 0;
        }

        .desc {
            width: 100%;
            text-align: center;
            position: absolute;
            top: 160px;
        }

        .primary-text {
            color: #d5d5d5;
            font-size: 16px;
            font-weight: 600;
            letter-spacing: 0.7px;
            margin: 5px 0;
        }

        .secondary-text {
            color: #c0c0c0;
            font-weight: 400;
            font-size: 14px;
            letter-spacing: 1px;
            margin: 5px 0;
        }

        button {
            background-color: rgba(255, 255, 255, 0.06);
            -webkit-backdrop-filter: blur(20px);
            backdrop-filter: blur(20px);
            border: none;
        }

        .details {
            display: -ms-grid;
            display: grid;
            width: 100%;
            height: 70px;
            padding: 5px 0;
            -ms-grid-columns: auto auto;
            grid-template-columns: auto auto;
            background-color: rgba(255, 255, 255, 0.06);
            -webkit-backdrop-filter: blur(20px);
            backdrop-filter: blur(20px);
            position: absolute;
            bottom: 0;
            border-radius: 0 0 8px 8px;
        }

        .details>div {
            text-align: center;
        }

        .details>div:first-child {
            border-right: 2px solid rgba(255, 255, 255, 0.08);
        }

        button {
            width: 80%;
            padding: 15px 0;
            position: absolute;
            left: 10%;
            top: 240px;
            border-radius: 5px;
            outline: none;
        }

        a {
            color: #ffffff;
            font-family: "Poppins", sans-serif;
            font-weight: 400;
            letter-spacing: 0.5px;
            position: absolute;
            right: 20px;
            top: 20px;
            border: 3px solid #ffffff;
            border-radius: 5px;
            text-decoration: none;
        }

        a>.fa {
            color: #FF0000;
        }

        @media screen and (min-width: 451px) {
            a {
                font-size: 18px;
                padding: 8px 12px 8px 12px;
            }
        }

        @media screen and (max-width: 450px) {
            a {
                font-size: 12px;
                padding: 5px 8px 5px 8px;
            }
        }
    </style>
    <script>
    function closeWindow() {
    	 window.history.back();
	}
    </script>
    <title>Profile</title>
</head>

<body>

    <div class="card">
        <div class="card-img">
            <img src="https://cdn-icons-png.flaticon.com/128/4140/4140051.png">
        </div>

        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/project", "root", "");
                String sql = "SELECT * FROM userdetails where Username= ?";
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setString(1, request.getParameter("strUsername"));
                ResultSet rs = stmt.executeQuery();

                if (!rs.next()) {
        %>
        <div class="desc">
            <h6 class="primary-text"> No data about you</h6>
        </div>
        <%
                } else {
        %>

        <div class="desc">
            <h6 class="primary-text"><%= rs.getString(1) %></h6>
        </div>
        <div class="details">
            <div class="rating">
            <h6 class="secondary-text">Email</h6>
            <h6 class="primary-text"><%= rs.getString(2) %></h6>
        	</div>
        
        <div class="activity">
            <h6 class="secondary-text">Phone</h6>
            <h6 class="primary-text"><%= rs.getString(4) %></h6>
        </div>
        </div>

        <%
                }
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <button class="primary-text" onclick="closeWindow();">Back</button>

    </div>

</body>
</html>
