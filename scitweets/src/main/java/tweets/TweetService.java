package tweets;

import java.util.List;

import filter.Filter;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.User;

import java.io.IOException;
import java.util.ArrayList;

public class TweetService {
	private static List<STweet> tweets = new ArrayList<STweet>();
	private static TwitterFactory tf = new TwitterFactory();
	private static Twitter twitter = tf.getInstance();
	private String url;

	public List<STweet> retrieveTweets(String username) throws IOException {
		if (!tweets.isEmpty()) {
			tweets.clear();
		}
		try {
			User user = twitter.showUser(username);
			long userID = user.getId();
			List<Status> statuses = twitter.getUserTimeline(userID);
			for (Status status : statuses) {
				if (Filter.hasURL(status.getText())) {
					for (int i = 0; i < status.getURLEntities().length; i++) {
						url = status.getURLEntities()[i].getExpandedURL();
			
					}
					if(Filter.checkTweet(url)){
						tweets.add(new STweet(user.getName(), status.getText(), url, "Description to be added later"));
					}
				}
			}
		} catch (TwitterException te) {
			te.printStackTrace();
			System.out.println("Failed to search tweets: " + te.getMessage());
			System.exit(-1);
		}
		return tweets;
	}

}
