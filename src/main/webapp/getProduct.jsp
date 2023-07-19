<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="pxu.edu.vn.product.Product" %>
<%@ page import="pxu.edu.vn.dao.DBConnection" %>
<%
// Lấy kết nối tới CSDL
if (DBConnection.getDbConnection() == null) {
    // Chưa có kết nối tới CSDL nên phải khởi tạo
    String dbServer = application.getInitParameter("dbServer");
    String dbAddress = application.getInitParameter("dbAddress");
    String dbPort = application.getInitParameter("dbPort");
    String database = application.getInitParameter("database");
    String username = application.getInitParameter("username");
    String password = application.getInitParameter("password");
    String dbDriver = application.getInitParameter("dbDriver");
    DBConnection conn = new DBConnection(dbServer, dbAddress, dbPort, database, username, password, dbDriver);
}

Statement stmt = null;
ResultSet rs = null;
try {
    stmt = DBConnection.dbConnection.createStatement();
    rs = stmt.executeQuery("SELECT * FROM products");
    StringBuilder jsonData = new StringBuilder("[");
    while (rs.next()) {
        jsonData.append("{");
        jsonData.append("\"productID\": \"" + rs.getString("product_id") + "\",");
        jsonData.append("\"productName\": \"" + rs.getString("product_name") + "\",");
        jsonData.append("\"categoryID\": \"" + rs.getString("category_id") + "\",");
        jsonData.append("\"brandID\": \"" + rs.getString("brand_id") + "\",");
        jsonData.append("\"price\": \"" + rs.getString("price") + "\",");
        jsonData.append("\"discountedPrice\": \"" + rs.getString("discounted_price") + "\",");
        jsonData.append("\"productImg\": \"" + rs.getString("product_img") + "\",");
        jsonData.append("\"productInfo\": \"" + rs.getString("product_info") + "\"");
        jsonData.append("},");
    }
    jsonData.deleteCharAt(jsonData.lastIndexOf(","));
    jsonData.append("]");

    out.print(jsonData.toString());
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
    try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
}
%>
