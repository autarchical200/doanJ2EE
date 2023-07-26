<%
    // Xóa session "username" và "role" (đăng xuất)
    session.removeAttribute("username");
    session.removeAttribute("role");

    // Chuyển hướng về trang đăng nhập sau khi đăng xuất
    response.sendRedirect("login/loginView.jsp");
%>
