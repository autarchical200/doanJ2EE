package pxu.edu.vn.order_detail;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import pxu.edu.vn.dao.DBConnection;

public class Order_Detail_Model {
    public static ArrayList<Order_Detail> getAll() throws Exception {
        ArrayList<Order_Detail> lst = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            stmt = conn.createStatement();
            String sql = "SELECT * FROM order_details";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Order_Detail orderDetail = new Order_Detail();
                orderDetail.setOrder_detail_id(rs.getInt(1));
                orderDetail.setOrder_id(rs.getInt(2));
                orderDetail.setProduct_id(rs.getInt(3));
                orderDetail.setQuantity(rs.getInt(4));
                orderDetail.setPrice(rs.getDouble(5));
                lst.add(orderDetail);
            }
        } catch (SQLException e) {
            // Ghi log hoặc ném ra ngoại lệ chứa thông báo lỗi
            throw new Exception("Lỗi khi lấy dữ liệu từ cơ sở dữ liệu", e);
        } finally {
            // Đảm bảo đóng kết nối và giải phóng tài nguyên sau khi sử dụng xong
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
            } catch (SQLException ex) {
                // Ghi log hoặc ném ra ngoại lệ chứa thông báo lỗi
                throw new Exception("Lỗi khi đóng kết nối", ex);
            }
        }
        return lst;
    }

    // Hàm Thêm Dữ Liệu
    public static void insertOrderDetail(Order_Detail orderDetail) throws Exception {
        Connection conn = null;
        Statement stmt = null;

        try {
            conn = DBConnection.getConnection();
            stmt = conn.createStatement();
            String sql = "INSERT INTO order_details (order_id, product_id, quantity, price) VALUES ("
                    + orderDetail.getOrder_id() + ", " + orderDetail.getProduct_id() + ", " + orderDetail.getQuantity()
                    + ", " + orderDetail.getPrice() + ")";
            stmt.executeUpdate(sql);
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

    // Hàm Sửa Dữ Liệu
    public static void updateOrderDetail(Order_Detail orderDetail) throws Exception {
        Connection conn = null;
        Statement stmt = null;

        try {
            conn = DBConnection.getConnection();
            stmt = conn.createStatement();
            String sql = "UPDATE order_details SET order_id = " + orderDetail.getOrder_id() + ", product_id = "
                    + orderDetail.getProduct_id() + ", quantity = " + orderDetail.getQuantity() + ", price = "
                    + orderDetail.getPrice() + " WHERE order_detail_id = " + orderDetail.getOrder_detail_id();
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            // Ghi log hoặc ném ra ngoại lệ chứa thông báo lỗi
            throw new Exception("Lỗi khi cập nhật dữ liệu trong cơ sở dữ liệu", e);
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

    // Hàm Xóa
    public static void deleteOrderDetail(int orderDetailId) throws Exception {
        Connection conn = null;
        Statement stmt = null;

        try {
            conn = DBConnection.getConnection();
            stmt = conn.createStatement();
            String sql = "DELETE FROM order_details WHERE order_detail_id = " + orderDetailId;
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            // Ghi log hoặc ném ra ngoại lệ chứa thông báo lỗi
            throw new Exception("Lỗi khi xóa dữ liệu khỏi cơ sở dữ liệu", e);
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
