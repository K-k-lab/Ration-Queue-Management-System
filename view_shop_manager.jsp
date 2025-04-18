<%-- 
    Document   : view_shop_manager
    Created on : Apr 4, 2025, 3:42:06 PM
    Author     : System4
--%>

<%@ page import="java.sql.*" %>
<%@ include file="../db.jsp" %>
<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("../index.jsp");
        return;
    }
%>
<html>
<head>
    <title>View Shop Managers</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <style>
        body {
            background: linear-gradient(to right, #ffe5b4, #ffd699);
            font-family: 'Segoe UI', sans-serif;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #d35400;
        }
        table {
            width: 70%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #ffa94d;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #fff3e0;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
            text-decoration: none;
            color: #d35400;
        }
    </style>
</head>
<body>
    <h2>Shop Managers List</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Shop Number</th>
            <th>Username</th>
        </tr>
        <%
            try {
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM shop_manager");

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("shop_number") %></td>
            <td><%= rs.getString("username") %></td>
        </tr>
        <%
                }
                rs.close();
                st.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='3' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>
    <a class="back-link" href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>
