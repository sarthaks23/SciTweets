package tweets;

public class STweet {
	private String username;
	private String tweet;
	private String url;
	private String description;

	public STweet(String username, String tweet, String url, String description) {
		super();
		this.username = username;
		this.tweet = tweet;
		this.url = url;
		this.description = description;
	}

	@Override
	public String toString() {
		return "STweet [username=" + username + ", tweet=" + tweet + ", url=" + url + ", description=" + description
				+ "]";
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTweet() {
		return tweet;
	}

	public void setTweet(String tweet) {
		this.tweet = tweet;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
