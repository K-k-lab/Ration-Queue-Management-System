<%-- 
    Document   : add_user
    Created on : Apr 2, 2025, 11:31:56 AM
    Author     : System4
--%>

<%@ include file="../db.jsp" %>
 <link rel="stylesheet" type="text/css" href="../css/style.css">
 <style>
    form {
        max-width: 400px;
        margin: 30px auto;
        background: #fff8f0;
        padding: 20px;
        border-radius: 15px;
        box-shadow: 0 8px 16px rgba(255, 165, 0, 0.2);
        font-family: 'Segoe UI', sans-serif;
    }

    input[type="text"],
    input[type="number"],
    textarea,
    select {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border: 2px solid #ffd699;
        border-radius: 10px;
        box-sizing: border-box;
        font-size: 16px;
        transition: 0.3s;
        background-color: #fffdf8;
    }

    input[type="text"]:focus,
    input[type="number"]:focus,
    textarea:focus,
    select:focus {
        border-color: #ffa500;
        outline: none;
        box-shadow: 0 0 5px rgba(255, 165, 0, 0.5);
    }

    input[type="submit"] {
        width: 100%;
        background: linear-gradient(to right, #ffb347, #ffcc33);
        color: #fff;
        padding: 12px;
        border: none;
        border-radius: 25px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: background 0.3s;
    }

    input[type="submit"]:hover {
        background: linear-gradient(to right, #ffa500, #ffb347);
    }
</style>

 <div class="container">
     <center>
<h2>Add User</h2>
<form method="post">
    <input type="text" name="ration_card_number" placeholder="Ration Card Number" required><br>
    <input type="text" name="name" placeholder="Full Name" required><br>
    <input type="number" name="age" placeholder="Age" required><br>
    <textarea name="address" placeholder="Address" required></textarea><br>
    <select name="shop_number">
        <%
        PreparedStatement ps = con.prepareStatement("SELECT shop_number FROM shop_manager");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) { %>
            <option value="<%= rs.getString("shop_number") %>"><%= rs.getString("shop_number") %></option>
        <% } %>
        rs.close();
        ps.close();
        %>
    </select><br>
    <input type="submit" name="add_user" value="Add User">
</form>
     </center>
 </div>
<%
if (request.getParameter("add_user") != null) {
    String ration_card_number = request.getParameter("ration_card_number");
    String name = request.getParameter("name");
    int age = Integer.parseInt(request.getParameter("age"));
    String address = request.getParameter("address");
    String shop_number = request.getParameter("shop_number");

    // Declare and initialize PreparedStatement
    PreparedStatement psInsert = con.prepareStatement("INSERT INTO users (ration_card_number, name, age, address, shop_number) VALUES (?, ?, ?, ?, ?)");
    psInsert.setString(1, ration_card_number);
    psInsert.setString(2, name);
    psInsert.setInt(3, age);
    psInsert.setString(4, address);
    psInsert.setString(5, shop_number);
    psInsert.executeUpdate();
    
    psInsert.close(); // Close statement

    out.println("<p style='color:green;'>User Added Successfully!</p>");
}
%>
