package dbconnection;

import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import compress.Compress;

public class DBConnect {
	private static String dbURL = "jdbc:mysql://localhost:3306/scitweetsdb?useSSL=false";
	private static String dbUser = "scitweets";
	private static String dbPass = "scitweets";

	public static void insert(String url, String summary) throws SQLException, IOException {
		Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
		Statement statement = conn.createStatement();
		statement.executeUpdate("INSERT INTO linkcache (url) VALUES ('" + url + "');");
		PreparedStatement ps = conn.prepareStatement("UPDATE linkcache SET summary=? WHERE url='" + url + "'");
		ps.setBytes(1, Compress.compressSummary(summary));
		ps.execute();
	}

	public static String[] select(String url) throws SQLException, IOException {
		Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
		Statement statement = conn.createStatement();
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
}
