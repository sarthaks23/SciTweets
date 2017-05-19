package tweets;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.User;

import java.util.ArrayList;

public class TweetService {
	private static List<STweet> tweets = new ArrayList<STweet>();
	public static final String URL_REGEX = "^((https?|ftp)://|(www|ftp)\\.)?[a-z0-9-]+(\\.[a-z0-9-]+)+([/?].*)?$";
	private static TwitterFactory tf = new TwitterFactory();
	private static Twitter twitter = tf.getInstance();
	private String url;

	public List<STweet> retrieveTweets(String username) {
		if (!tweets.isEmpty()) {
			tweets.clear();
		}
		try {
			User user = twitter.showUser(username);
			long userID = user.getId();
			List<Status> statuses = twitter.getUserTimeline(userID);
			for (Status status : statuses) {
				if (hasURL(status.getText())) {
					//for loop will get the last url mentioned in tweet
					for(int i=0; i<status.getURLEntities().length; i++){
						url = status.getURLEntities()[i].getExpandedURL();
					}
					tweets.add(new STweet(user.getName(), status.getText(), url,
							"Description to be added later"));
				}
			}
		} catch (TwitterException te) {
			te.printStackTrace();
			System.out.println("Failed to search tweets: " + te.getMessage());
			System.exit(-1);
		}
		return tweets;
	}

	// Filter for right now, will be updated
	private static boolean hasURL(String t) {
		int URLCounter = 0;
		Pattern p = Pattern.compile(URL_REGEX);
		String[] parts = t.split("\\s+");
		for (String part : parts) {
			Matcher m = p.matcher(part);
			if (m.find()) {
				URLCounter++;
			}
			if (URLCounter == 2) {
				return true;
			}
		}
		return false;
	}
}
