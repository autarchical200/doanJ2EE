<%
    // Kiểm tra session, nếu đã tồn tại user thì kiểm tra role và điều hướng trang
    if (session.getAttribute("username") != null) {
        String role = (String) session.getAttribute("role");
        if (role != null) {
            if (role.equals("admin")) {
                // Điều hướng đến trang admin
                response.sendRedirect("../Admin/Admin_index.jsp");
            } 
            // Nếu role khác admin hoặc customer thì xử lý trường hợp khác (nếu cần)
        }
    } else {
        // Nếu không tồn tại user, đưa về trang login
        response.sendRedirect("../login/loginView.jsp");
    }
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>USER PAGE</h1>
<a href="../logout.jsp">dang xuat</a>
</body>
</html>