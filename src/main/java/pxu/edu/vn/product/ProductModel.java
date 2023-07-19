package pxu.edu.vn.product;

import pxu.edu.vn.dao.DBConnection;
import pxu.edu.vn.product.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductModel {
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // Get the database connection
            connection = DBConnection.getConnection();

            // Prepare the SQL statement
            String sql = "SELECT * FROM products";
            statement = connection.prepareStatement(sql);

            // Execute the query
            resultSet = statement.executeQuery();

            // Iterate over the result set and create Product objects
            while (resultSet.next()) {
                int productID = resultSet.getInt("product_id");
                String productName = resultSet.getString("product_name");
                int categoryID = resultSet.getInt("category_id");
                int brandID = resultSet.getInt("brand_id");
                double price = resultSet.getDouble("price");
                double discountedPrice = resultSet.getDouble("discounted_price");
                String productImg = resultSet.getString("product_img");
                String productInfo = resultSet.getString("product_info");

                // Create a Product object and add it to the list
                Product product = new Product(productID, productName, categoryID, brandID, price, discountedPrice, productImg, productInfo);
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the resources
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return products;
    }
}
