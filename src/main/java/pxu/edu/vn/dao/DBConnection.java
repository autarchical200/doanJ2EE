package pxu.edu.vn.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection dbConnection;

	public DBConnection() {

	}

	public DBConnection(String dbServer, String dbAddress, String dbPort, String database, String username,
			String password, String dbDriver) {
		String dbURL = "jdbc:" + dbServer + "://" + dbAddress + ":" + dbPort + "/" + database;
		try {
			Class.forName(dbDriver);
			if (dbConnection == null) {
				dbConnection = DriverManager.getConnection(dbURL, username, password);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			dbConnection = null;
		}
	}

	public static Connection getDbConnection() {
		return dbConnection;
	}

}
