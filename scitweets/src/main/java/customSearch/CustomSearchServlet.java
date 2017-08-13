package customSearch;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import filter.Filter;
import tweets.ModifyTweet;
import tweets.STweet;
import twitter4j.Paging;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.User;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/customsearch")
public class CustomSearchServlet extends HttpServlet {

	private static TwitterFactory tf = new TwitterFactory();
	private static Twitter twitter = tf.getInstance();
	private String url;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("handlerequest") != null) {
			try {
				String username = request.getParameter("handlerequest");
				User user = twitter.showUser(username);
				long userID = user.getId();
				Paging p = new Paging();
				p.setCount(100);
				List<Status> statuses = twitter.getUserTimeline(userID, p);
				List<STweet> tweetsToShow = new ArrayList<STweet>();
				for (Status status : statuses) {
					if (Filter.hasURL(status)) {
						url = status.getURLEntities()[0].getExpandedURL();
						String statusText = ModifyTweet.deleteSecondURL(status.getText());
						Date date = status.getCreatedAt();
						Calendar calendar = Calendar.getInstance();
						calendar.setTime(date);
						int month = calendar.get(Calendar.MONTH);
						int year = calendar.get(Calendar.YEAR);
						if (Filter.checkTweet(url)) {
							tweetsToShow.add(new STweet(user.getName(), statusText, url, null, month, year));
						}
					}
				}
				request.setAttribute("tweets", tweetsToShow);
				if (tweetsToShow.isEmpty()) {
					request.setAttribute("error", "noValidTweets");
				} else {
					request.setAttribute("error", "none");
				}
			} catch (TwitterException e) {
				if (((TwitterException) e).getStatusCode() == 404) {
					request.setAttribute("tweets", null);
					request.setAttribute("error", "handleNotFound");
				}
			} finally {
				request.getRequestDispatcher("/WEB-INF/views/customsearch.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("error", null);
			request.setAttribute("tweets", null);
			request.getRequestDispatcher("/WEB-INF/views/customsearch.jsp").forward(request, response);
		}
	}
}
