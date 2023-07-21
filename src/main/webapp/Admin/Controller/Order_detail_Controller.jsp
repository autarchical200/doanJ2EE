<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page
	import="pxu.edu.vn.brand.brandModel, java.util.*, com.google.gson.Gson, pxu.edu.vn.order_detail.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
// Lấy danh sách hãng sản phẩm từ model
List<Order_Detail> brands = Order_Detail_Model.getAll();

// Convert danh sách hãng sản phẩm thành JSON
Gson gson = new Gson();
String json = gson.toJson(brands);

// Trả về JSON
response.setContentType("application/json");
response.setCharacterEncoding("UTF-8");
response.getWriter().write(json);
%>>