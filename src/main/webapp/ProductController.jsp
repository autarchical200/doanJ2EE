<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="pxu.edu.vn.product.Product, pxu.edu.vn.product.ProductModel, java.util.*, com.google.gson.Gson"%>

<%
    int categoryID = Integer.parseInt(request.getParameter("categoryID")); // Lấy categoryID từ tham số truyền vào
  /*  String categoryName = request.getParameter("categoryName"); */
    // Lấy danh sách sản phẩm từ model theo categoryID
    List<Product> products = ProductModel.getProductsByCategoryId(categoryID);

    // Convert danh sách sản phẩm thành JSON
    Gson gson = new Gson();
    String json = gson.toJson(products);

    // Trả về JSON
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write(json);
%>
