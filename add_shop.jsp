<%-- 
    Document   : add_shop
    Created on : Apr 2, 2025, 11:30:51 AM
    Author     : System4
--%>
<%@ include file="../db.jsp" %>
<h2>Add Ration Shop</h2>
 <link rel="stylesheet" type="text/css" href="../css/style.css">
 <div class="container">
     <center>
<form method="post">Shop Num &nbsp;
    <input type="text" name="shop_number" placeholder="Shop Number" required><br>
    Username &nbsp;
    <input type="text" name="username" placeholder="Shop Manager Username" required><br>
    Password &nbsp;
    <input type="password" name="password" placeholder="Password" required><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" name="add_shop" value="Add Shop">
</form>
     </center>
 </div>
<%
if (request.getParameter("add_shop") != null) {
    String shop_number = request.getParameter("shop_number");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Encrypt password (optional for better security)
    String hashedPassword = password; // Replace with hashing logic if needed

    try {
        // Declare and initialize PreparedStatement
        PreparedStatement psInsert = con.prepareStatement("INSERT INTO shop_manager (shop_number, username, password) VALUES (?, ?, ?)");
        psInsert.setString(1, shop_number);
        psInsert.setString(2, username);
        psInsert.setString(3, hashedPassword);
        psInsert.executeUpdate();
        
        psInsert.close(); // Close statement

        out.println("<p style='color:green;'>Shop Added Successfully!</p>");
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
}
%>
      