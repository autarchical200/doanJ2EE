<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="pxu.edu.vn.dao.DBConnection"%>

<%
    // Lấy thông tin người dùng từ biểu mẫu đăng nhập
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try {
        Connection conn = DBConnection.getConnection();
        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE username = ?");
        stmt.setString(1, username);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            String storedPassword = rs.getString("password");

            // Kiểm tra mật khẩu
            if (password.equals(storedPassword)) {
                // Lưu thông tin người dùng vào session
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("role", rs.getString("role"));
                session.setAttribute("user_id", rs.getInt("user_id")); // Thêm dòng này để lưu user_id vào session

                // Kiểm tra vai trò của người dùng và điều hướng tới các trang phù hợp
                if (rs.getString("role").equals("admin")) {
                    response.sendRedirect("../Admin/Admin_index.jsp");
                } else if (rs.getString("role").equals("customer")) {
                    response.sendRedirect("../user/userView.jsp");
                }
            } else {
                session.setAttribute("error", "Mật khẩu không đúng!");
                response.sendRedirect("loginView.jsp");
            }
        } else {
            session.setAttribute("error", "Tài khoản không tồn tại!");
            response.sendRedirect("loginView.jsp");
        }

        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
