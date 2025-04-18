<%-- 
    Document   : dashboard.jsp
    Created on : Apr 2, 2025, 11:27:19 AM
    Author     : System4
--%>

<%@ include file="../db.jsp" %>
<%@ page language="java" %>
<%
String admin = (String) session.getAttribute("admin");
if (admin == null) response.sendRedirect("../index.jsp");
%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: url('../images/bg1.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .header {
            background: rgba(0, 0, 0, 0.7);
            padding: 15px 20px;
            text-align: center;
        }
        .header h2 {
            color: white;
            margin: 0;
        }
        .nav-links {
            text-align: center;
            padding: 10px 0;
        }

        .logout-btn {
            float: right;
            margin-top: -40px;
            margin-right: 20px;
            padding: 8px 15px;
            background: red;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s;
        }
        .logout-btn:hover {
            background: darkred;
        }
    </style>
</head>
<body>



    <div class="header">
        <a href="add_shop.jsp">Add Ration Shop</a>
        <a href="view_shop_manager.jsp">View Manager</a>
        <a href="add_user.jsp">Add User</a>
        <a href="view_users.jsp">View users</a>

       
           <a href="../logout.jsp">Logout</a>
        
    </div>
    <div class="nav-links">
        <h2>Welcome, <%= admin %></h2>
    </div>
</body>
</html>
