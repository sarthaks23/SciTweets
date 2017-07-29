package adminControls;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnection.DBConnect;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/addhandle")
public class AddHandle extends HttpServlet {
	private static TwitterFactory tf = new TwitterFactory();
	private static Twitter twitter = tf.getInstance();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String usernameToAdd = request.getParameter("username");
		String[] checkFormat = usernameToAdd.split("");
		if (checkFormat[0].equals("@")) {
			try {
				twitter.showUser(usernameToAdd);
				DBConnect.insertIntoHandles(request.getParameter("name"), usernameToAdd);
				request.getRequestDispatcher("/admincontrol").forward(request, response);
			} catch (TwitterException | InstantiationException | IllegalAccessException | ClassNotFoundException
					| SQLException e) {
				if (((TwitterException) e).getStatusCode() == 404) {
					request.setAttribute("errorAddingHandle", "Handle does not exist");
					request.getRequestDispatcher("/admincontrol").forward(request, response);
				}
			}
		}else{
			request.setAttribute("errorAddingHandle" , "Please add an @ sign to the beginning of the username");
			request.getRequestDispatcher("/admincontrol").forward(request, response);		}
	}
}
