package dbconnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Properties.RetrieveProperties;

public class DBConnect {
	static RetrieveProperties rp = new RetrieveProperties();

	private static Connection dbconnect()
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection conn = DriverManager.getConnection(rp.getDBURL(), rp.getDBUsername(), rp.getDBPass());
		return conn;
	}

	public static void insertIntoLinkcache(String url, String summary)
			throws SQLException, IOException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		Connection conn = dbconnect();
		PreparedStatement ps = conn.prepareStatement("INSERT INTO linkcache (url, summary) VALUES (?,?)");
		ps.setString(1, url);
		ps.setString(2, summary);
		ps.execute();
		conn.close();
	}

	public static String[] selectFromLinkcache(String url)
			throws SQLException, IOException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		Connection conn = dbconnect();
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM linkcache WHERE url=?");
		ps.setString(1, url);
		ResultSet resultset = ps.executeQuery();
		String[] results = new String[2];
		if (!resultset.next()) {
			conn.close();
			return null;
		} else {
			results[0] = resultset.getString("url");
			results[1] = resultset.getString("summary"); 
			conn.close();
			return results;
		}
	}

	public static void insertIntoHandles(String name, String username)
			throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException, IOException {
		Connection conn = dbconnect();
		PreparedStatement ps = conn.prepareStatement("INSERT INTO handles (name, username) VALUES (?,?)");
		ps.setString(1, name);
		ps.setString(2, username);
		ps.execute();
		conn.close();
	}

	public static void deleteFromHandles(String username)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		Connection conn = dbconnect();
		String query = "DELETE FROM handles WHERE username=?";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, username);
		ps.execute();
		conn.close();
	}

	public static List<String[]> selectAllFromHandles()
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		Connection conn = dbconnect();
		Statement statement = conn.createStatement();
		ResultSet resultset = statement.executeQuery("SELECT * FROM handles");
		ArrayList<String[]> results = new ArrayList<String[]>();
		while (resultset.next()) {
			String[] row = new String[2];
			row[0] = resultset.getString("name");
			row[1] = resultset.getString("username");
			results.add(row);
		}
		conn.close();
		return results;
	}
}