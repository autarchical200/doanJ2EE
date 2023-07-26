package pxu.edu.vn.SendMail;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Map;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import pxu.edu.vn.cart.CartItem;
import pxu.edu.vn.product.Product;

@WebServlet("/SendInvoiceServlet")
public class SendInvoiceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");

        // Lưu thông tin khách hàng vào session (nếu cần)
        HttpSession session = request.getSession();
        session.setAttribute("email", email);

        // Gửi hóa đơn qua email
        sendInvoiceEmail(email, session);

        // Chuyển hướng người dùng đến trang cảm ơn hoặc thông báo gửi email thành công
        response.sendRedirect(request.getContextPath() + "/thankyou.jsp");
    }

    private void sendInvoiceEmail(String email, HttpSession session) {
        // Thực hiện việc gửi hóa đơn qua email tại đây
        // Có thể sử dụng các thư viện hỗ trợ như JavaMail API

        // Replace these settings with your SMTP server settings
        String host = "smtp.gmail.com";
        String port = "587";
        String username = "nguyenvandung01052002@gmail.com"; // Địa chỉ email của bạn
        String password = "ifbmyzwazpeudker";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);

        Session mailSession = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Thiết lập thông tin người gửi và người nhận
            Message message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Hóa đơn mua hàng"); // Chỉnh sửa tiêu đề email tùy ý

            // Chuẩn bị nội dung email
            StringBuilder content = new StringBuilder();
            content.append("Đây là hóa đơn mua hàng của bạn:\n");
            // Thêm thông tin chi tiết về hóa đơn từ session vào nội dung email (nếu cần)
            // Ví dụ:
            Map<Integer, CartItem> cartMap = (Map<Integer, CartItem>) session.getAttribute("cart");
            if (cartMap != null) {
                for (CartItem cartItem : cartMap.values()) {
                    Product product = cartItem.getPro();
                    int quantity = cartItem.getQuantity();
                    long totalPrice = product.getDiscounted_price() > 0 ? product.getDiscounted_price() * quantity
                            : product.getPrice() * quantity;
                    content.append("Tên sản phẩm: " + product.getProduct_name() + "\n");
                    content.append("Đơn giá: " + (product.getDiscounted_price() > 0 ? product.getDiscounted_price() : product.getPrice()) + " đ\n");
                    content.append("Số lượng: " + quantity + "\n");
                    content.append("Tổng tiền: " + totalPrice + " đ\n");
                    content.append("------------------------------\n");
                }
            }
            content.append("Tổng số tiền: " + session.getAttribute("totalAmount") + " đ\n");
            // ...

            // Thiết lập nội dung email
            message.setText(content.toString());

            // Gửi email
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
            // Xử lý lỗi khi gửi email
        }
    }
}
