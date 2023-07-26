package pxu.edu.vn.SendMail;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.apache.catalina.connector.Response;
import java.util.Date;
import java.io.IOException;
import java.util.Map;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import pxu.edu.vn.cart.CartItem;
import pxu.edu.vn.order.Order;
import pxu.edu.vn.order.OrderModel;
import pxu.edu.vn.product.Product;
import java.text.DecimalFormat;
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
        response.sendRedirect(request.getContextPath() + "/cart.jsp");
    }
    private String formatMoneyVND(long money) {
        DecimalFormat formatter = new DecimalFormat("###,### VNĐ");
        return formatter.format(money);
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
            content.append("<!DOCTYPE html>");
            content.append("<html>");
            content.append("<head>");
            content.append("<meta charset=\"UTF-8\">");
            content.append("<title>Hóa đơn mua hàng</title>");
            content.append("<style>");
            content.append("body { font-family: Arial, sans-serif; }");
            content.append(".container { margin: 0 auto; }");
            content.append("h2 { width:80%;margin-top: 20px; color: green; text-align: center; font-size:30px;}");
            content.append("table { width: 80%; border-collapse: collapse; margin-top: 20px; }");
            content.append("th, td { padding: 8px; border: 1px solid #ccc; text-align: center; }");
            content.append("thead { background-color: #f2f2f2; }");
            content.append(".total-amount { margin-top: 20px; font-size: 18px; font-weight: bold; color: red; }");
            content.append("</style>");
            content.append("</head>");
            content.append("<body>");
            content.append("<div class=\"container\">");
            content.append("<h2>Hóa đơn mua hàng</h2>");
            content.append("<table>");
            content.append("<thead>");
            content.append("<tr>");
            content.append("<th>STT</th>");
            content.append("<th>Tên sản phẩm</th>");
            content.append("<th>Đơn giá</th>");
            content.append("<th>Số lượng</th>");
            content.append("<th>Tổng tiền</th>");
            content.append("</tr>");
            content.append("</thead>");
            content.append("<tbody>");

            
            // Thêm thông tin chi tiết về hóa đơn từ session vào nội dung email (nếu cần)
            // Ví dụ:
            Map<Integer, CartItem> cartMap = (Map<Integer, CartItem>) session.getAttribute("cart");
            if (cartMap != null) {
                int stt = 1;
                long totalAmount = 0;
                for (CartItem cartItem : cartMap.values()) {
                    Product product = cartItem.getPro();
                    int quantity = cartItem.getQuantity();
                    long totalPrice = product.getDiscounted_price() > 0 ? product.getDiscounted_price() * quantity
                            : product.getPrice() * quantity;
                    String formattedPrice = formatMoneyVND(totalPrice);
                    content.append("<tr>");
                    content.append("<td>" + stt + "</td>");
                    content.append("<td>" + product.getProduct_name() + "</td>");
                    content.append("<td>" + formattedPrice + "</td>");
                    content.append("<td>" + quantity + "</td>");
                    content.append("<td>" + formattedPrice + "</td>");
                    content.append("</tr>");
                    stt++;
                    totalAmount += totalPrice;
                }
                content.append("</tbody>");
                content.append("</table>");
                content.append("<h3 class=\"total-amount\">Tổng số tiền: " + formatMoneyVND(totalAmount) + "</h3>");
                content.append("</div>");
                content.append("</body>");
                content.append("</html>");
            }
            // Thiết lập nội dung email
            message.setContent(content.toString(), "text/html; charset=utf-8");

            // Gửi email
            Transport.send(message);

            session.setAttribute("email", email);

            // Insert the order into the database
            insertOrderToDatabase(session);
            session.removeAttribute("cart");
        } catch (MessagingException e) {
            e.printStackTrace();
            // Xử lý lỗi khi gửi email
        }
    }
    private void insertOrderToDatabase(HttpSession session) {
        // Get order information from the session (if needed)

        int userId = (int) session.getAttribute("user_id");
        long totalAmount = ((Integer) session.getAttribute("totalAmount")).intValue();



        // Create the order object
        Order order = new Order();
        order.setUser_id(userId);
        Date currentDate = new Date();
        order.setOrder_date(new java.sql.Date(currentDate.getTime()));
        order.setTotal_amount(totalAmount);
        order.setStatus("Pending"); // Set the initial status as "Pending" (or any other default status)

        // Insert the order into the database using the DAO
        try {
            OrderModel.insertOrder(order);
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception (e.g., log the error, show an error message to the user, etc.)
        }
    }
}
