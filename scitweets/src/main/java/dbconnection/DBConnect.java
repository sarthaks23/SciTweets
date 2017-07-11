package dbconnection;

import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import compress.Compress;

public class DBConnect {
	private static String dbURL = "jdbc:mysql://localhost:3306/scitweetsdb?useSSL=false&serverTimezone=PST";
	private static String dbUser = "scitweets";
	private static String dbPass = "scitweets";

	private static Connection dbconnect()
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
		return conn;
	}

	public static void insertIntoLinkcache(String url, String summary)
			throws SQLException, IOException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		Statement statement = dbconnect().createStatement();
		statement.executeUpdate("INSERT INTO linkcache (url) VALUES ('" + url + "');");
		PreparedStatement ps = dbconnect().prepareStatement("UPDATE linkcache SET summary=? WHERE url='" + url + "'");
		ps.setBytes(1, Compress.compressSummary(summary));
		ps.execute();
	}

	public static String[] selectFromLinkcache(String url)
			throws SQLException, IOException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		Statement statement = dbconnect().createStatement();
		ResultSet resultset = statement.executeQuery("SELECT * FROM linkcache WHERE url='" + url + "'");
		String[] results = new String[2];
		if (!resultset.next()) {
			return null;
		} else {
			results[0] = resultset.getString("url");
			Blob blob = resultset.getBlob("summary");
			results[1] = Compress.decompressSummary(blob.getBytes(1, (int) blob.length()));
			return results;
		}
	}

	public static void insertIntoHandles(String name, String username)
			throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		Statement statement = dbconnect().createStatement();
		statement.executeUpdate("INSERT INTO handles (name, username) VALUES ('" + name + "', '" + username + "');");
	}

	public static void deleteFromHandles(String username)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		String query = "DELETE FROM handles WHERE username = ?";
		PreparedStatement ps = dbconnect().prepareStatement(query);
		ps.setString(1, username);
		ps.execute();
	}

	public static List<String[]> selectAllFromHandles()
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Statement statement = dbconnect().createStatement();
		ResultSet resultset = statement.executeQuery("SELECT * FROM handles");
		ArrayList<String[]> results = new ArrayList<String[]>();
		while(resultset.next()){
			String[] row = new String[2];
			row[0] = resultset.getString("name");
			row[1] = resultset.getString("username");
			results.add(row);
		}
		return results;
	}
}