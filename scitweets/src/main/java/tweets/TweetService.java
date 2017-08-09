package tweets;

import java.util.List;

import com.aylien.textapi.TextAPIException;

import dbconnection.DBConnect;
import filter.Filter;
import summarize.SummarizeService;
import twitter4j.Paging;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.User;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class TweetService {
	private static List<STweet> tweets = new ArrayList<STweet>();
	private static TwitterFactory tf = new TwitterFactory();
	private static Twitter twitter = tf.getInstance();
	private String url;

	public List<STweet> retrieveTweets(String username) throws IOException, SQLException, TextAPIException,
			TwitterException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		if (!tweets.isEmpty()) {
			tweets.clear();
		}
		User user = twitter.showUser(username);
		long userID = user.getId();
		Paging p = new Paging();
		p.setCount(100);
		List<Status> statuses = twitter.getUserTimeline(userID, p);
		List<String> urlsOnPage = new ArrayList<String>();
		List<String> summariesOnPage = new ArrayList<String>();
		for (Status status : statuses) {
			if (Filter.hasURL(status)) {
				url = status.getURLEntities()[0].getExpandedURL();
				if (!urlsOnPage.contains(url)) {
					String statusText = ModifyTweet.deleteSecondURL(status.getText());
					Date date = status.getCreatedAt();
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(date);
					int month = calendar.get(Calendar.MONTH);
					int year = calendar.get(Calendar.YEAR);
					if (DBConnect.selectFromLinkcache(url) != null) {
						String description = DBConnect.selectFromLinkcache(url)[1];
						boolean isValid = DBConnect.checkIsValid(url);
						if (isValid && !summariesOnPage.contains(description)) {
							tweets.add(new STweet(user.getName(), statusText, url, description, month, year));
							urlsOnPage.add(url);
							summariesOnPage.add(description);
						}
					} else if (Filter.checkTweet(url)) {
						String description = SummarizeService.summarize(url, 4);
						if (description != null && !description.isEmpty() && !summariesOnPage.contains(description)) {
							tweets.add(new STweet(user.getName(), statusText, url, description, month, year));
							DBConnect.insertIntoLinkcache(url, description, true);
							urlsOnPage.add(url);
							summariesOnPage.add(description);
						} else {
							DBConnect.insertIntoLinkcache(url, null, false);
						}
					} else {
						DBConnect.insertIntoLinkcache(url, null, false);
					}
				}
			}
		}
		if (tweets.isEmpty()) {
			Date date = new Date();
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			int month = calendar.get(Calendar.MONTH);
			int year = calendar.get(Calendar.YEAR);
			tweets.add(new STweet("", "", "", "There seems to be no valid tweets :(", month, year));
		}
		return tweets;
	}
}