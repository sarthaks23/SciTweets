package newsengine;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aylien.textapi.TextAPIException;

import handles.CategoryService;
import tweets.STweet;
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
			List<STweet> tweetList = tweetService.retrieveTweets(request.getParameter("user"));
			request.setAttribute("tweets", tweetList);
			request.setAttribute("numOfArticles", (tweetList).size());
			int month = tweetList.get(tweetList.size() - 1).getMonth();
			int year = tweetList.get(tweetList.size() - 1).getYear();
			int difference = calculateMonths(month, year);
			if (difference != 0){
				request.setAttribute("months", difference);
			} else {
				request.setAttribute("months", "");
			}
		} catch (SQLException | TextAPIException | TwitterException | InstantiationException | IllegalAccessException
				| ClassNotFoundException e) {
			e.printStackTrace();
		}
		request.setAttribute("name", request.getParameter("name"));
		request.setAttribute("categories", categoryService.retrieveCategories());
		request.setAttribute("method", "post");
		request.getRequestDispatcher("/WEB-INF/views/newsengine.jsp").forward(request, response);
	}

	private int calculateMonths(int month, int year) {
		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		int currentMonth = calendar.get(Calendar.MONTH);
		int currentYear = calendar.get(Calendar.YEAR);
		int difference = (((currentYear - year) * 12) + currentMonth) - month;
		return difference;
	}
}
