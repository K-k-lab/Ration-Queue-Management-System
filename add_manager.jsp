<%-- 
    Document   : add_manager
    Created on : Apr 2, 2025, 11:31:21 AM
    Author     : System4
--%>

<%@ include file="../db.jsp" %>
 <link rel="stylesheet" type="text/css" href="../css/style.css">
<h2>Add Shop Manager</h2>
<form method="post">
    <input type="text" name="username" placeholder="Manager Username" required><br>
    <input type="password" name="password" placeholder="Password" required><br>
    <select name="shop_number">
        <%
        PreparedStatement ps = con.prepareStatement("SELECT shop_number FROM shop_manager");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) { %>
            <option value="<%= rs.getString("shop_number") %>"><%= rs.getString("shop_number") %></option>
        <% } %>
    </select><br>
    <input type="submit" name="add_manager" value="Add Manager">
</form>

<%
if (request.getParameter("add_manager") != null) {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String shop_number = request.getParameter("shop_number");

    ps = con.prepareStatement("INSERT INTO shop_manager (shop_number, username, password) VALUES (?, ?, ?)");
    ps.setString(1, shop_number);
    ps.setString(2, username);
    ps.setString(3, password);
    ps.executeUpdate();

    out.println("<p style='color:green;'>Shop Manager Added Successfully!</p>");
}
%>
