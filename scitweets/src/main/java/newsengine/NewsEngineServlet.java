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
@WebServlet(urlPatterns = "/newsengine")
public class NewsEngineServlet extends HttpServlet {
	
	private TweetService tweetService = new TweetService();
	private CategoryService categoryService = new CategoryService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("categories", categoryService.retrieveCategories());
		request.setAttribute("method", "get");
		request.getRequestDispatcher("/WEB-INF/views/newsengine.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setAttribute("tweets", tweetService.retrieveTweets(request.getParameter("user")));
		} catch (SQLException | TextAPIException | TwitterException | InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		request.setAttribute("username", request.getParameter("user"));
		request.setAttribute("name", request.getParameter("name"));
		request.setAttribute("categories", categoryService.retrieveCategories());
		request.setAttribute("method", "post");
		request.getRequestDispatcher("/WEB-INF/views/newsengine.jsp").forward(request, response);
	}
}
