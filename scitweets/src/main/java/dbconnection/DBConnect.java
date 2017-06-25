package dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnect {
	private static String dbURL = "jdbc:mysql://localhost:3306/scitweetsdb?useSSL=false";
	private static String dbUser = "scitweets";
	private static String dbPass = "scitweets";

	public static void insert(String url, String summary) throws SQLException {
		Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
		Statement statement = conn.createStatement();
		statement.executeUpdate("INSERT INTO linkcache VALUES ('" + url + "','" + summary + "');");
	}

	public static String[] select(String url) throws SQLException {
		Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
		Statement statement = conn.createStatement();
		ResultSet resultset = statement.executeQuery("SELECT * FROM linkcache WHERE url='" + url + "'");
		String[] results = new String[2];
		if (!resultset.next()) {
			return null;
		} else {
			results[0] = resultset.getString("url");
			results[1] = resultset.getString("summary");
			return results;
		}
	}
}
