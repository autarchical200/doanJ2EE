package pxu.edu.vn.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {
	private static final String URL = "jdbc:mysql://localhost:3306/doanwebsite?useUnicode=true&characterEncoding=UTF-8";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "Hung0976661824";

	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			System.out.println("Kết nối đến cơ sở dữ liệu thành công!");
		} catch (ClassNotFoundException e) {
			System.out.println("Không tìm thấy JDBC driver.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Lỗi trong quá trình kết nối đến cơ sở dữ liệu.");
			e.printStackTrace();
		}
		return connection;
	}

	public static void closeConnection(Connection connection) {
		if (connection != null) {
			try {
				connection.close();
				System.out.println("Đóng kết nối thành công!");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
