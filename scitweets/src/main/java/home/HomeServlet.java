package home;

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
@WebServlet(urlPatterns = "/home")
public class HomeServlet extends HttpServlet {
	private TweetService tweetService = new TweetService();
	private CategoryService categoryService = new CategoryService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("categories", categoryService.retrieveCategories());
		request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setAttribute("tweets", tweetService.retrieveTweets(request.getParameter("user")));
		} catch (SQLException | TextAPIException | TwitterException | InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		request.setAttribute("categories", categoryService.retrieveCategories());
		request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
	}
}
