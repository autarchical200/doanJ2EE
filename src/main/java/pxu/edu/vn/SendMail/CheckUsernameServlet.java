package pxu.edu.vn.SendMail;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pxu.edu.vn.dao.DBConnection;

@WebServlet("/CheckUsernameServlet")
public class CheckUsernameServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            String username = request.getParameter("username");

            boolean exists = checkUsernameExist(username);

            // Chuẩn bị dữ liệu JSON để gửi về phía client
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.println("{\"exists\": " + exists + "}");
        } catch (Exception e) {
            // Xử lý lỗi nếu cần thiết
            e.printStackTrace();
        } finally {
            // Đảm bảo đóng tất cả kết nối và giải phóng tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                // Xử lý lỗi nếu cần thiết
                e.printStackTrace();
            }
        }
    }

    // Hàm kiểm tra xem username có tồn tại trong cơ sở dữ liệu hay không
    private boolean checkUsernameExist(String username) throws Exception {
        boolean exists = false;

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT COUNT(*) FROM users WHERE username = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            rs = stmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                exists = count > 0;
            }
        } catch (Exception e) {
            // Xử lý lỗi nếu cần thiết
            e.printStackTrace();
            throw e;
        } finally {
            // Đảm bảo đóng kết nối và giải phóng tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                // Xử lý lỗi nếu cần thiết
                e.printStackTrace();
            }
        }

        return exists;
    }
}
