package pxu.edu.vn.SendMail;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@WebServlet("/SendMailServlet")
public class SendMailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String fullName = request.getParameter("full_name");

        // Lưu thông tin khách hàng vào session
        HttpSession session = request.getSession();
        session.setAttribute("username", username);
        session.setAttribute("password", password);
        session.setAttribute("email", email);
        session.setAttribute("phone", phone);
        session.setAttribute("full_name", fullName);

        // Gửi email với mã xác nhận
        sendConfirmationEmail(email, session);

        // Chuyển hướng người dùng đến trang nhập mã xác nhận
        response.sendRedirect(request.getContextPath() + "/Register/check_mail_validate.jsp");
    }

    private void sendConfirmationEmail(String email, HttpSession session) {
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
            message.setSubject("Xác nhận tài khoản");
            String randomCode = generateRandomCode(6); // Tạo mã xác nhận gồm 6 ký tự
            session.setAttribute("confirmation_code", randomCode); // Lưu mã xác nhận trong session
            message.setText("Mã xác nhận của bạn là: " + randomCode);

            // Gửi email
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
            // Xử lý lỗi khi gửi email
        }
    }

    private String generateRandomCode(int length) {
        String characters = "0123456789";
        StringBuilder randomCode = new StringBuilder();
        int max = characters.length() - 1;

        for (int i = 0; i < length; i++) {
            int index = (int) (Math.random() * max);
            randomCode.append(characters.charAt(index));
        }

        return randomCode.toString();
    }
}
