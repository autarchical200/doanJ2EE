package pxu.edu.vn.order;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Date;
import java.util.ArrayList;

import pxu.edu.vn.dao.DBConnection;

public class OrderModel {
	public static ArrayList<Order> getAll() throws Exception {
		ArrayList<Order> lst = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			String sql = "SELECT * FROM orders";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Order order = new Order();
				order.setOrder_id(rs.getInt(1));
				order.setUser_id(rs.getInt(2));
				order.setOrder_date(rs.getDate(3));
				order.setTotal_amount(rs.getDouble(4));
				order.setStatus(rs.getString(5));

				lst.add(order);
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

	public static void insertOrder(Order order) throws Exception {
	    Connection conn = null;
	    Statement stmt = null;

	    try {
	        conn = DBConnection.getConnection();
	        stmt = conn.createStatement();
	        String sql = "INSERT INTO orders (user_id, order_date, total_amount, status) VALUES (" +
                    order.getUser_id() + ", '" +
                    order.getOrder_date() + "', " +
                    order.getTotal_amount() + ", '" +
                    order.getStatus() + "')";

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
	public static void updateOrder(Order order) throws Exception {
		Connection conn = null;
		Statement stmt = null;

		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			String sql = "UPDATE orders SET user_id = " + order.getUser_id() + ", order_date = '"
					+ order.getOrder_date() + "', total_amount = " + order.getTotal_amount() + " WHERE order_id = "
					+ order.getOrder_id();
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
	public static void deleteOrder(int orderId) throws Exception {
		Connection conn = null;
		Statement stmt = null;

		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			String sql = "DELETE FROM orders WHERE order_id = " + orderId;
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
