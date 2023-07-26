<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="pxu.edu.vn.cart.CartItem"%>
<%@ page import="pxu.edu.vn.product.*"%>
<%@ page import="java.util.*"%>
<%@ page import="pxu.edu.vn.dao.DBConnection"%>
<%@ page import="pxu.edu.vn.login.PasswordUtil" %> <!-- Thay your.package.name bằng gói chứa lớp PasswordUtil -->

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
            String storedPasswordHash = rs.getString("password");

            // Mã hóa mật khẩu người dùng
            String inputPasswordHash = PasswordUtil.hashPassword(password);

            // Kiểm tra mật khẩu
            if (inputPasswordHash != null && inputPasswordHash.equals(storedPasswordHash)) {
                // Lưu thông tin người dùng vào session
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("role", rs.getString("role"));
                session.setAttribute("user_id", rs.getInt("user_id")); // Thêm dòng này để lưu user_id vào session

                // Kiểm tra xem có session giỏ hàng "cartSession" hay không
                Map<Integer, CartItem> cartSession = (Map<Integer, CartItem>) session.getAttribute("cartSession");
                if (cartSession != null) {
                    // Nếu có giỏ hàng trong session "cartSession", gán nó vào session "cart"
                    session.setAttribute("cart", cartSession);
                    // Xóa session "cartSession" sau khi đã gán giỏ hàng vào session "cart"
                    session.removeAttribute("cartSession");
                }

                // Kiểm tra vai trò của người dùng và điều hướng tới các trang phù hợp
                if (rs.getString("role").equals("admin")) {
                    response.sendRedirect("../Admin/View/Admin_index_View.jsp");
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
