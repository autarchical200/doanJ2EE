<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="pxu.edu.vn.dao.DBConnection"%>
<%@ page import="org.json.JSONObject"%>

<%
    String username = request.getParameter("username");
    String exists = "false";
    String error = "";

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        conn = DBConnection.getConnection();
        String sql = "SELECT COUNT(*) FROM users WHERE username = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        rs = stmt.executeQuery();

        if (rs.next()) {
            int count = rs.getInt(1);
            if (count > 0) {
                // Tên người dùng đã tồn tại trong cơ sở dữ liệu
                exists = "true";
                error = "Tài khoản đã tồn tại.";
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        error = "Đã xảy ra lỗi trong quá trình kiểm tra tài khoản.";
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Gửi kết quả trả về dưới dạng JSON
    JSONObject jsonResponse = new JSONObject();
    jsonResponse.put("exists", exists);
    if ("true".equals(exists)) {
        jsonResponse.put("error", error);
    }

    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write(jsonResponse.toString());
%>
