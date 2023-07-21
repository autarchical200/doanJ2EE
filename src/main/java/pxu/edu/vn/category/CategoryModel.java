package pxu.edu.vn.category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import pxu.edu.vn.dao.DBConnection;

public class CategoryModel {
    public static ArrayList<Category> getAllCategories() throws Exception {
        ArrayList<Category> categoryList = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            stmt = conn.createStatement();
            String sql = "SELECT * FROM categories";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryID(rs.getInt(1));
                category.setCategoryName(rs.getString(2));

                // Thêm category vào danh sách
                categoryList.add(category);
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
        return categoryList;
    }
}
