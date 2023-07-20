package pxu.edu.vn.product;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
}
