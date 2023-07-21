package pxu.edu.vn.employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import pxu.edu.vn.dao.DBConnection;
import pxu.edu.vn.product.Product;

public class EmployeeModel {
	public static ArrayList<employee> getAll() throws Exception {
		ArrayList<employee> lst = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			String sql = "SELECT * FROM users where role='admin' ";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				employee employee = new employee();
				employee.setUser_id(rs.getInt(1));
				employee.setUsername(rs.getString(2));
				employee.setPassword(rs.getString(3));
				employee.setEmail(rs.getString(4));
				employee.setPhone(rs.getString(5));
				employee.setFull_name(rs.getString(6));
				employee.setGender(rs.getString(7));
				employee.setRole(rs.getString(8));
				lst.add(employee);
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
	public static void insertEmployee(employee employee) throws Exception {
		Connection conn = null;
		Statement stmt = null;

		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			String sql = "INSERT INTO users (username, password, email, phone, full_name, gender, role) VALUES ('"
					+ employee.getUsername() + "', '" + employee.getPassword() + "', '" + employee.getEmail() + "', '"
					+ employee.getPhone() + "', '" + employee.getFull_name() + "', '" + employee.getGender() + "', '"
					+ employee.getRole() + "')";
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
	public static void updateEmployee(employee employee) throws Exception {
		Connection conn = null;
		Statement stmt = null;

		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			String sql = "UPDATE customers SET username = '" + employee.getUsername() + "', password = '"
					+ employee.getPassword() + "', email = '" + employee.getEmail() + "', phone = '"
					+ employee.getPhone() + "', full_name = '" + employee.getFull_name() + "', gender = '"
					+ employee.getGender() + "', role = '" + employee.getRole() + "' WHERE user_id = "
					+ employee.getUser_id();
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
	public static void deleteEmployee(int userId) throws Exception {
		Connection conn = null;
		Statement stmt = null;

		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			String sql = "DELETE FROM users WHERE user_id = " + userId;
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
