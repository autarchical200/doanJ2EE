package pxu.edu.vn.brand;

import java.sql.Connection;
import java.sql.*;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import pxu.edu.vn.dao.DBConnection;

public class brandModel {
	public static ArrayList<brand> getAll() throws Exception {
		ArrayList<brand> lst = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			String sql = "SELECT * FROM brands";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				brand Brand = new brand();
				Brand.setBrand_id(rs.getInt(1));
				Brand.setBrand_name(rs.getString(2));
				Brand.setBrand_country(rs.getString(3));
				Brand.setBrand_nsx(rs.getDate(4));
				lst.add(Brand);
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
	public static void insertBrand(brand brand) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.getConnection();
			String sql = "INSERT INTO brands (brand_name, brand_country, brand_nsx) VALUES (?, ?, ?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, brand.getBrand_name());
			pstmt.setString(2, brand.getBrand_country());
			pstmt.setDate(3, new java.sql.Date(brand.getBrand_nsx().getTime()));

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// Ghi log hoặc ném ra ngoại lệ chứa thông báo lỗi
			throw new Exception("Lỗi khi thêm dữ liệu vào cơ sở dữ liệu", e);
		} finally {
			// Đảm bảo đóng kết nối và giải phóng tài nguyên sau khi sử dụng xong
			try {
				if (pstmt != null) {
					pstmt.close();
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
	public static void updateBrand(brand brand) throws Exception {
		Connection conn = null;
		Statement stmt = null;

		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			String sql = "UPDATE brands SET brand_name = '" + brand.getBrand_name() + "', brand_country = '"
					+ brand.getBrand_country() + "', brand_nsx = '" + brand.getBrand_nsx() + "' WHERE brand_id = "
					+ brand.getBrand_id();
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
	public static void deleteBrand(int brandId) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.getConnection();
			String sql = "DELETE FROM brands WHERE brand_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, brandId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// Ghi log hoặc ném ra ngoại lệ chứa thông báo lỗi
			throw new Exception("Lỗi khi xóa dữ liệu khỏi cơ sở dữ liệu", e);
		} finally {
			// Đảm bảo đóng kết nối và giải phóng tài nguyên sau khi sử dụng xong
			try {
				if (pstmt != null) {
					pstmt.close();
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

	public static brand getBrandById(String brandId) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		brand brand = null; // Khởi tạo đối tượng brand trước khi sử dụng

		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT * FROM brands WHERE brand_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, brandId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				brand = new brand(); // Khởi tạo đối tượng brand
				brand.setBrand_id(rs.getInt("brand_id"));
				brand.setBrand_name(rs.getString("brand_name"));
				brand.setBrand_country(rs.getString("brand_country"));
				brand.setBrand_nsx(rs.getDate("brand_nsx"));
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
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException ex) {
				// Ghi log hoặc ném ra ngoại lệ chứa thông báo lỗi
				throw new Exception("Lỗi khi đóng kết nối", ex);
			}
		}

		return brand; // Trả về đối tượng brand
	}

}
