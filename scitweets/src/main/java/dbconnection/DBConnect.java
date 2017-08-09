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

import properties.RetrieveProperties;

public class DBConnect {

	static RetrieveProperties rp = new RetrieveProperties();

	private static Connection dbconnect()
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection conn = DriverManager.getConnection(rp.getDBURL(), rp.getDBUsername(), rp.getDBPass());
		return conn;
	}

	public static void insertIntoLinkcache(String url, String summary, boolean isValid)
			throws SQLException, IOException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		Connection conn = dbconnect();
		PreparedStatement ps = conn.prepareStatement("INSERT INTO linkcache (url, summary, isValid) VALUES (?,?,?)");
		ps.setString(1, url);
		ps.setString(2, summary);
		ps.setBoolean(3, isValid);
		ps.execute();
		conn.close();
	}

	public static String[] selectFromLinkcache(String url)
			throws SQLException, IOException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		Connection conn = dbconnect();
		PreparedStatement ps = conn.prepareStatement("SELECT url, summary FROM linkcache WHERE url=?");
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

	public static boolean checkIsValid(String url) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		Connection conn = dbconnect();
		PreparedStatement ps = conn.prepareStatement("SELECT isValid FROM linkcache WHERE url=?");
		ps.setString(1, url);
		ResultSet resultset = ps.executeQuery();
		while (resultset.next()){
			boolean isValid = resultset.getBoolean("isValid");
			if(isValid) {
				return true;
			}
		}
		return false;
	}
	
	public static void insertIntoHandles(String name, String username, String category)
			throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException, IOException {
		Connection conn = dbconnect();
		PreparedStatement getCategoryID = conn.prepareStatement("SELECT CategoryID FROM category WHERE CategoryName=?");
		getCategoryID.setString(1, category);
		ResultSet resultset = getCategoryID.executeQuery();
		resultset.next();
		int CategoryID = resultset.getInt("CategoryID");
		PreparedStatement ps = conn.prepareStatement("INSERT INTO handles (name, username, CategoryID) VALUES (?,?,?)");
		ps.setString(1, name);
		ps.setString(2, username);
		ps.setInt(3, CategoryID);
		ps.execute();
		conn.close();
	}

	public static void deleteHandle(String username)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		Connection conn = dbconnect();
		PreparedStatement deleteFromHandle = conn.prepareStatement("DELETE FROM handles WHERE username=?");
		deleteFromHandle.setString(1, username);
		deleteFromHandle.execute();
		conn.close();
	}

	public static List<String[]> selectAllFromHandles()
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		Connection conn = dbconnect();
		Statement statement = conn.createStatement();
		ResultSet resultset = statement.executeQuery("SELECT name, username, CategoryID FROM handles");
		ArrayList<String[]> results = new ArrayList<String[]>();
		while (resultset.next()) {
			String[] row = new String[3];
			row[0] = resultset.getString("name");
			row[1] = resultset.getString("username");
			row[2] = Integer.toString(resultset.getInt("CategoryID"));
			results.add(row);
		}
		conn.close();
		return results;
	}

	public static List<String[]> selectFromCategory()
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		Connection conn = dbconnect();
		Statement statement = conn.createStatement();
		ResultSet resultset = statement.executeQuery("SELECT CategoryID, CategoryName FROM category");
		ArrayList<String[]> results = new ArrayList<String[]>();
		while (resultset.next()) {
			String[] row = new String[2];
			row[0] = Integer.toString(resultset.getInt("CategoryID"));
			row[1] = resultset.getString("CategoryName");
			results.add(row);
		}
		conn.close();
		return results;
	}
	
	public static void deleteCategory(String category) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException{
		Connection conn = dbconnect();
		PreparedStatement deleteCategory = conn.prepareStatement("DELETE FROM category WHERE CategoryName=?");
		deleteCategory.setString(1, category);
		deleteCategory.execute();
		conn.close();
	}

	public static boolean categoryExists(String category)
			throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException, IOException {
		Connection conn = dbconnect();
		String query = "SELECT 1 FROM category WHERE CategoryName=?";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, category);
		ResultSet resultset = ps.executeQuery();
		if (resultset.next()) {
			conn.close();
			return true;
		} else {
			conn.close();
			return false;
		}
	}

	public static void insertIntoCategory(String category)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		Connection conn = dbconnect();
		Statement statement = conn.createStatement();
		ResultSet resultset = statement.executeQuery("SELECT CategoryID FROM category");
		int lastInt = 0;
		while (resultset.next()){
			lastInt = resultset.getInt("CategoryID");
		}
		int newInt = lastInt + 1;
		PreparedStatement ps = conn.prepareStatement("INSERT INTO category (CategoryID, CategoryName) VALUES (?,?)");
		ps.setInt(1, newInt);
		ps.setString(2, category);
		ps.execute();
		conn.close();
	}
}