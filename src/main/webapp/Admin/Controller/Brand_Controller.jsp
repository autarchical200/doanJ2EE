<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="pxu.edu.vn.brand.brand"%>
<%@ page import="pxu.edu.vn.brand.brandModel"%>
<%@ page import="com.google.gson.Gson"%>

<%
    try {
        // Lấy danh sách các hãng sản phẩm từ model
        List<brand> brands = brandModel.getAll();

        // Convert danh sách các hãng sản phẩm thành JSON
        Gson gson = new Gson();
        String json = gson.toJson(brands);

        // Trả về JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    } catch (Exception e) {
        e.printStackTrace();
        // Xử lý lỗi ở đây nếu cần thiết
    }
%>
