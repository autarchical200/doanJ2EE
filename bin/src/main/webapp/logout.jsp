
<%
    // Huỷ session
    session.invalidate();

    // Chuyển hướng về trang đăng nhập sau khi đăng xuất
    response.sendRedirect("login/loginView.jsp");
%>
