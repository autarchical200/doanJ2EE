package pxu.edu.vn.inventory;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Date;
import java.util.ArrayList;

import pxu.edu.vn.dao.DBConnection;

public class InventoryModel {
	public static ArrayList<Inventory> getAll() throws Exception {
		ArrayList<Inventory> lst = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			String sql = "SELECT * FROM inventories";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Inventory inventory = new Inventory();
				inventory.setInventory_id(rs.getInt(1));
				inventory.setProduct_id(rs.getInt(2));
				inventory.setDate_add(rs.getDate(3));
				inventory.setQuantity(rs.getInt(4));
				lst.add(inventory);
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
	public static void insertInventory(Inventory inventory) throws Exception {
		Connection conn = null;
		Statement stmt = null;

		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			String sql = "INSERT inventories INTO inventory (product_id, date_add, quantity) VALUES ("
					+ inventory.getProduct_id() + ", '" + inventory.getDate_add() + "', " + inventory.getQuantity()
					+ ")";
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
	public static void updateInventory(Inventory inventory) throws Exception {
		Connection conn = null;
		Statement stmt = null;

		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			String sql = "UPDATE inventories SET product_id = " + inventory.getProduct_id() + ", date_add = '"
					+ inventory.getDate_add() + "', quantity = " + inventory.getQuantity() + " WHERE inventory_id = "
					+ inventory.getInventory_id();
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
	public static void deleteInventory(int inventoryId) throws Exception {
		Connection conn = null;
		Statement stmt = null;

		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			String sql = "DELETE FROM inventories WHERE inventory_id = " + inventoryId;
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
