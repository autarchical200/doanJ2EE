package pxu.edu.vn.brand;

import java.sql.Connection;
import java.sql.ResultSet;
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
        Statement stmt = null;

        try {
            conn = DBConnection.getConnection();
            stmt = conn.createStatement();
            String sql = "INSERT INTO brands (brand_name, brand_country, brand_nsx) VALUES ('"
                    + brand.getBrand_name() + "', '" + brand.getBrand_country() + "', '" + brand.getBrand_nsx() + "')";
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
        Statement stmt = null;

        try {
            conn = DBConnection.getConnection();
            stmt = conn.createStatement();
            String sql = "DELETE FROM brands WHERE brand_id = " + brandId;
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
