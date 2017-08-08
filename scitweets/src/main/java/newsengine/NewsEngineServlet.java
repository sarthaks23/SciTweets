package newsengine;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aylien.textapi.TextAPIException;

import handles.CategoryService;
import tweets.TweetService;
import twitter4j.TwitterException;

@SuppressWarnings("serial")
<<<<<<< HEAD:scitweets/src/main/java/home/HomeServlet.java
@WebServlet(urlPatterns = "/home")
public class HomeServlet extends HttpServlet {

=======
@WebServlet(urlPatterns = "/newsengine")
public class NewsEngineServlet extends HttpServlet {
	
>>>>>>> 3879e18d7e7711a32f658c9c1c71c174326837ae:scitweets/src/main/java/newsengine/NewsEngineServlet.java
	private TweetService tweetService = new TweetService();
	private CategoryService categoryService = new CategoryService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("categories", categoryService.retrieveCategories());
<<<<<<< HEAD:scitweets/src/main/java/home/HomeServlet.java
		request.setAttribute("instruction", "get");
		request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
=======
		request.setAttribute("method", "get");
		request.getRequestDispatcher("/WEB-INF/views/newsengine.jsp").forward(request, response);
>>>>>>> 3879e18d7e7711a32f658c9c1c71c174326837ae:scitweets/src/main/java/newsengine/NewsEngineServlet.java
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setAttribute("tweets", tweetService.retrieveTweets(request.getParameter("user")));
		} catch (SQLException | TextAPIException | TwitterException | InstantiationException | IllegalAccessException
				| ClassNotFoundException e) {
			e.printStackTrace();
		}
		request.setAttribute("instruction", "post");
		request.setAttribute("username", request.getParameter("user"));
		request.setAttribute("name", request.getParameter("name"));
		request.setAttribute("categories", categoryService.retrieveCategories());
		request.setAttribute("method", "post");
		request.getRequestDispatcher("/WEB-INF/views/newsengine.jsp").forward(request, response);
	}
}
