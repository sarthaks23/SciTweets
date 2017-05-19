package scitweets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tweets.TweetService;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/home")
public class HomeServlet extends HttpServlet {
	private TweetService tweetService = new TweetService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("tweets", tweetService.retrieveTweets(request.getParameter("user")));
		request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
	}
}
