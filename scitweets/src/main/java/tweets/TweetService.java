package tweets;

import java.util.List;

import com.aylien.textapi.TextAPIException;

import dbconnection.DBConnect;
import filter.Filter;
import summarize.SummarizeService;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.User;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class TweetService {
	private static List<STweet> tweets = new ArrayList<STweet>();
	private static TwitterFactory tf = new TwitterFactory();
	private static Twitter twitter = tf.getInstance();
	private String url;

	public List<STweet> retrieveTweets(String username)
			throws IOException, SQLException, TextAPIException, TwitterException {
		if (!tweets.isEmpty()) {
			tweets.clear();
		}

		User user = twitter.showUser(username);
		long userID = user.getId();
		List<Status> statuses = twitter.getUserTimeline(userID);
		for (Status status : statuses) {
			if (Filter.hasURL(status.getText())) {
				for (int i = 0; i < status.getURLEntities().length; i++) {
					url = status.getURLEntities()[i].getExpandedURL();
				}
				if (DBConnect.select(url) != null) {
					String description = DBConnect.select(url)[1];
					if (!description.equals("Invalid")) {
						tweets.add(new STweet(user.getName(), status.getText(), url, description));
					}
				} else if (Filter.checkTweet(url)) {
					String description = SummarizeService.summarize(url, 5);
					tweets.add(new STweet(user.getName(), status.getText(), url, description));
					DBConnect.insert(url, description);
				} else if (!Filter.checkTweet(url)) {
					DBConnect.insert(url, "Invalid");
				}
			}
		}
		return tweets;
	}

}
