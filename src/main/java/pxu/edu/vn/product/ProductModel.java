package pxu.edu.vn.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pxu.edu.vn.dao.DBConnection;

public class ProductModel {
	public ProductModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	// Hàm lấy danh sách sản phẩm theo ID danh mục (category)
	public static List<Product> getProductsByCategoryId(int categoryId) throws Exception {
        List<Product> lst = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();

            String sql = "SELECT * FROM products WHERE category_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, categoryId);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_id(rs.getInt(1));
                product.setProduct_name(rs.getString(2));
                product.setCategory_id(rs.getInt(3));
                product.setBrand_id(rs.getInt(4));
                product.setPrice(rs.getLong(5));
                product.setDiscounted_price(rs.getLong(6));
                product.setProduct_image(rs.getString(7));
                product.setProduct_info(rs.getString(8));
                lst.add(product);
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
        return lst;
    }

	// Hàm lấy danh sách tất cả sản phẩm
	public static List<Product> getAll() throws Exception {
		List<Product> lst = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.getConnection();

			String sql = "SELECT * FROM products";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProduct_id(rs.getInt("product_id"));
				product.setProduct_name(rs.getString("product_name"));
				product.setCategory_id(rs.getInt("category_id"));
				product.setBrand_id(rs.getInt("brand_id"));
				product.setPrice(rs.getLong("price"));
				product.setDiscounted_price(rs.getLong("discounted_price"));
				product.setProduct_image(rs.getString("product_image"));
				product.setProduct_info(rs.getString("product_info"));
				lst.add(product);
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
		return lst;
	}

	// Hàm thêm dữ liệu sản phẩm
	public static void insertProduct(Product product) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.getConnection();
			String sql = "INSERT INTO products (product_name, category_id, brand_id, price, discounted_price, product_image, product_info) VALUES (?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getProduct_name());
			pstmt.setInt(2, product.getCategory_id());
			pstmt.setInt(3, product.getBrand_id());
			pstmt.setLong(4, product.getPrice());
			pstmt.setLong(5, product.getDiscounted_price());
			pstmt.setString(6, product.getProduct_image());
			pstmt.setString(7, product.getProduct_info());
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

	// Hàm sửa dữ liệu sản phẩm
	public static void updateProduct(Product product) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.getConnection();
			String sql = "UPDATE products SET product_name = ?, category_id = ?, brand_id = ?, price = ?, discounted_price = ?, product_image = ?, product_info = ? WHERE product_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getProduct_name());
			pstmt.setInt(2, product.getCategory_id());
			pstmt.setInt(3, product.getBrand_id());
			pstmt.setLong(4, product.getPrice());
			pstmt.setLong(5, product.getDiscounted_price());
			pstmt.setString(6, product.getProduct_image());
			pstmt.setString(7, product.getProduct_info());
			pstmt.setInt(8, product.getProduct_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// Ghi log hoặc ném ra ngoại lệ chứa thông báo lỗi
			throw new Exception("Lỗi khi cập nhật dữ liệu trong cơ sở dữ liệu", e);
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
	 public static List<Product> getProductsByName(String productName) throws Exception {
	        List<Product> productList = new ArrayList<>();
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;

	        try {
	            conn = DBConnection.getConnection();

	            // Tìm kiếm các sản phẩm có tên chứa productName (sử dụng "LIKE" trong câu truy vấn SQL)
	            String sql = "SELECT * FROM products WHERE product_name LIKE ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, "%" + productName + "%");
	            rs = pstmt.executeQuery();
	            while (rs.next()) {
	                Product product = new Product();
	                product.setProduct_id(rs.getInt("product_id"));
	                product.setProduct_name(rs.getString("product_name"));
	                product.setCategory_id(rs.getInt("category_id"));
	                product.setBrand_id(rs.getInt("brand_id"));
	                product.setPrice(rs.getDouble("price"));
	                product.setDiscounted_price(rs.getDouble("discounted_price"));
	                product.setProduct_image(rs.getString("product_image"));
	                product.setProduct_info(rs.getString("product_info"));
	                productList.add(product);
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
	        return productList;
	    }
	
	// Hàm xóa sản phẩm theo ID
	public static void deleteProduct(int productId) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.getConnection();
			String sql = "DELETE FROM products WHERE product_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productId);
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

	// Hàm lấy sản phẩm theo ID
	public static Product getProductById(String productId) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT * FROM products WHERE product_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Product product = new Product();
				product.setProduct_id(rs.getInt("product_id"));
				product.setProduct_name(rs.getString("product_name"));
				product.setCategory_id(rs.getInt("category_id"));
				product.setBrand_id(rs.getInt("brand_id"));
				product.setPrice(rs.getLong("price"));
				product.setDiscounted_price(rs.getLong("discounted_price"));
				product.setProduct_image(rs.getString("product_image"));
				product.setProduct_info(rs.getString("product_info"));
				return product;
			} else {
				return null;
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
	}

}