<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="pxu.edu.vn.product.Product" %>
<%@ page import="pxu.edu.vn.product.ProductModel" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách sản phẩm</title>
</head>
<body>
    <%-- Tạo một đối tượng ProductModel --%>
    <% ProductModel productModel = new ProductModel(); %>
    
    <%-- Lấy danh sách sản phẩm từ ProductModel --%>
    <% List<Product> products = productModel.getAllProducts(); %>
    
    <%-- Hiển thị danh sách sản phẩm --%>
    <div class="product-list">
        <%-- Sử dụng vòng lặp để duyệt qua danh sách sản phẩm và hiển thị chúng --%>
        <% for (Product product : products) { %>
            <div class="product-item">
                <h3><%= product.getProductName() %></h3>
                <p>Giá: <%= product.getPrice() %></p>
                <%-- Sử dụng cấu trúc if-else để kiểm tra giá giảm giá --%>
                <% if (product.getDiscountedPrice() > 0) { %>
                    <p>Giá giảm giá: <%= product.getDiscountedPrice() %></p>
                <% } %>
                <img src="<%= product.getProductImg() %>" alt="Product Image">
                <p><%= product.getProductInfo() %></p>
            </div>
        <% } %>
    </div>
</body>
</html>
