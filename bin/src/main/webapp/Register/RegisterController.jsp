<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="pxu.edu.vn.customer.Customer"%>
<%@ page import="pxu.edu.vn.customer.CustomerModel"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="java.sql.*"%>
<%@ page import="pxu.edu.vn.dao.DBConnection"%>

<%
if (request.getParameter("action") != null) {
    String action = request.getParameter("action");
    if (action.equals("add")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String full_name = request.getParameter("full_name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        // Kiểm tra trùng lặp username bằng AJAX
        boolean isUsernameExist = false;
        String checkUsernameURL = "check_username.jsp?username=" + URLEncoder.encode(username, "UTF-8");

        // Gửi yêu cầu kiểm tra đến file check_username.jsp bằng AJAX
        try {
            URL checkUsernameApi = new URL(checkUsernameURL);
            HttpURLConnection conn = (HttpURLConnection) checkUsernameApi.openConnection();
            conn.setRequestMethod("GET");
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            StringBuilder resBuilder = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
            	resBuilder.append(inputLine);
            }

            in.close();

            // Xử lý kết quả trả về từ check_username.jsp
            JSONObject jsonResponse = new JSONObject(resBuilder.toString());
            isUsernameExist = jsonResponse.getBoolean("exists");
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (isUsernameExist) {
            // Username đã tồn tại, chuyển hướng đến trang thông báo lỗi
            response.sendRedirect("../../error.jsp");
        } else {
            // Tạo đối tượng Khách Hàng và lưu vào cơ sở dữ liệu
            Customer newCustomer = new Customer();
            newCustomer.setUsername(username);
            newCustomer.setPassword(password);
            newCustomer.setFull_name(full_name);
            newCustomer.setPhone(phone);
            newCustomer.setEmail(email);
            // Set giá trị mặc định cho trường role là "customer"
            newCustomer.setRole("customer");

            // Thêm Khách Hàng
            try {
                CustomerModel.insertCustomer(newCustomer);
                // Chuyển hướng về trang login sau khi thêm thành công
                response.sendRedirect("../login/loginView.jsp");
            } catch (SQLException ex) {
                ex.printStackTrace();
                response.sendRedirect("../../error.jsp");
            }
        }
    }
}
%>
