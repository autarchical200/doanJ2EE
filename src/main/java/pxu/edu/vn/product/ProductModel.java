package pxu.edu.vn.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
<<<<<<< HEAD
import java.util.List;
import pxu.edu.vn.dao.DBConnection;

public class ProductModel {
	public ProductModel() {
		super();
		// TODO Auto-generated constructor stub
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
				product.setPrice(rs.getDouble("price"));
				product.setDiscounted_price(rs.getDouble("discounted_price"));
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
			pstmt.setDouble(4, product.getPrice());
			pstmt.setDouble(5, product.getDiscounted_price());
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
			pstmt.setDouble(4, product.getPrice());
			pstmt.setDouble(5, product.getDiscounted_price());
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
				product.setPrice(rs.getDouble("price"));
				product.setDiscounted_price(rs.getDouble("discounted_price"));
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
=======
import pxu.edu.vn.dao.DBConnection;

public class ProductModel {
    public static ArrayList<Product> getAllProducts() throws Exception {
        ArrayList<Product> productList = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            stmt = conn.createStatement();
            String sql = "SELECT * FROM products";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt(1));
                product.setProductName(rs.getString(2));
                product.setCategoryID(rs.getInt(3));
                product.setBrandID(rs.getInt(4));
                product.setPrice(rs.getDouble(5));
                product.setDiscountedPrice(rs.getDouble(6));
                product.setProductImg(rs.getString(7));
                product.setProductInfo(rs.getString(8));
                productList.add(product);
            }
        } catch (SQLException e) {
            throw new Exception("Lỗi khi lấy dữ liệu từ cơ sở dữ liệu", e);
        } finally {
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
                throw new Exception("Lỗi khi đóng kết nối", ex);
            }
        }
        return productList;
    }
    public static ArrayList<Product> getProductsByCategoryId(int categoryId) throws Exception {
        ArrayList<Product> productList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT * FROM products WHERE category_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, categoryId);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt(1));
                product.setProductName(rs.getString(2));
                product.setCategoryID(rs.getInt(3));
                product.setBrandID(rs.getInt(4));
                product.setPrice(rs.getDouble(5));
                product.setDiscountedPrice(rs.getDouble(6));
                product.setProductImg(rs.getString(7));
                product.setProductInfo(rs.getString(8));
                productList.add(product);
            }
        } catch (SQLException e) {
            throw new Exception("Lỗi khi lấy dữ liệu từ cơ sở dữ liệu", e);
        } finally {
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
                throw new Exception("Lỗi khi đóng kết nối", ex);
            }
        }
        return productList;
    }
    // Hàm Thêm Dữ Liệu
    public static void insertProduct(Product product) throws Exception {
        Connection conn = null;
        Statement stmt = null;

        try {
            conn = DBConnection.getConnection();
            stmt = conn.createStatement();
            String sql = "INSERT INTO products (product_name, category_id, brand_id, price, discounted_price, product_img, product_info) VALUES ('"
                    + product.getProductName() + "', " + product.getCategoryID() + ", " + product.getBrandID() + ", "
                    + product.getPrice() + ", " + product.getDiscountedPrice() + ", '" + product.getProductImg()
                    + "', '" + product.getProductInfo() + "')";
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            throw new Exception("Lỗi khi thêm dữ liệu vào cơ sở dữ liệu", e);
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                throw new Exception("Lỗi khi đóng kết nối", ex);
            }
        }
    }

    // Hàm Sửa Dữ Liệu
    public static void updateProduct(Product product) throws Exception {
        Connection conn = null;
        Statement stmt = null;

        try {
            conn = DBConnection.getConnection();
            stmt = conn.createStatement();
            String sql = "UPDATE products SET product_name = '" + product.getProductName() + "', category_id = "
                    + product.getCategoryID() + ", brand_id = " + product.getBrandID() + ", price = "
                    + product.getPrice() + ", discounted_price = " + product.getDiscountedPrice() + ", product_img = '"
                    + product.getProductImg() + "', product_info = '" + product.getProductInfo() + "' WHERE product_id = "
                    + product.getProductID();
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            throw new Exception("Lỗi khi cập nhật dữ liệu trong cơ sở dữ liệu", e);
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                throw new Exception("Lỗi khi đóng kết nối", ex);
            }
        }
    }

    // Hàm Xóa
    public static void deleteProduct(int productId) throws Exception {
        Connection conn = null;
        Statement stmt = null;

        try {
            conn = DBConnection.getConnection();
            stmt = conn.createStatement();
            String sql = "DELETE FROM products WHERE product_id = " + productId;
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            throw new Exception("Lỗi khi xóa dữ liệu khỏi cơ sở dữ liệu", e);
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                throw new Exception("Lỗi khi đóng kết nối", ex);
            }
        }
    }
>>>>>>> Hung
}
