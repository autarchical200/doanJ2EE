package pxu.edu.vn.SendMail;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import pxu.edu.vn.customer.Customer;
import pxu.edu.vn.dao.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
@WebServlet("/send_mail_check")
public class send_mail_check extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String confirmationCode = request.getParameter("confirmation_code");

        // Kiểm tra xem mã xác nhận có được nhập hay không
        if (confirmationCode != null && !confirmationCode.trim().isEmpty()) {

            // Kiểm tra mã xác nhận nhập vào
            if (confirmationCode.equals(session.getAttribute("confirmation_code"))) {

                // Mã xác nhận đúng, lưu thông tin khách hàng vào cơ sở dữ liệu
                saveCustomerInfo(request, response);
                session.removeAttribute("confirmation_code"); // Xóa mã xác nhận khỏi session
                return;
            } else {
                // Mã xác nhận sai, chuyển hướng người dùng về trang nhập lại
                response.sendRedirect(request.getContextPath() + "/register/check_mail_validate.jsp");
                return;
            }
        }
    }

    // Hàm để lưu thông tin khách hàng vào cơ sở dữ liệu
    private void saveCustomerInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username");
        String password = (String) request.getSession().getAttribute("password");
        String email = (String) request.getSession().getAttribute("email");
        String phone = (String) request.getSession().getAttribute("phone");
        String fullName = (String) request.getSession().getAttribute("full_name");

        Customer customer = new Customer();
        customer.setUsername(username);
        customer.setPassword(password);
        customer.setEmail(email);
        customer.setPhone(phone);
        customer.setFull_name(fullName);

        try {
            // Gọi hàm insertCustomer để lưu thông tin khách hàng vào cơ sở dữ liệu
            insertCustomer(customer);

            // Chuyển hướng về trang đăng nhập
            response.sendRedirect(request.getContextPath() + "/user/userView.jsp");
        } catch (Exception e) {
            // Xử lý lỗi khi lưu thông tin khách hàng thất bại
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    // Hàm để lưu thông tin khách hàng vào cơ sở dữ liệu
    private void insertCustomer(Customer customer) throws Exception {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO users (username, password, email, phone, full_name, gender, role) " +
                         "VALUES (?, md5(?), ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, customer.getUsername());
            stmt.setString(2, customer.getPassword());
            stmt.setString(3, customer.getEmail());
            stmt.setString(4, customer.getPhone());
            stmt.setString(5, customer.getFull_name());
            stmt.setString(6, customer.getGender());
            stmt.setString(7, "customer"); // Set giá trị mặc định cho trường role là "customer"
            stmt.executeUpdate();
        } catch (SQLException e) {
            // Ghi log hoặc ném ra ngoại lệ chứa thông báo lỗi
            throw new Exception("Lỗi khi thêm dữ liệu vào cơ sở dữ liệu", e);
        } finally {
            // Đảm bảo đóng kết nối và giải phóng tài nguyên sau khi sử dụng xong
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                // Ghi log hoặc ném ra ngoại lệ chứa thông báo lỗi
                throw new Exception("Lỗi khi đóng kết nối", ex);
            }
        }
    }
}