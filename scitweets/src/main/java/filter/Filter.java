package filter;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.aylien.textapi.TextAPIClient;
import com.aylien.textapi.TextAPIException;
import com.aylien.textapi.parameters.ExtractParams;
import com.aylien.textapi.responses.Article;

import aylienProperties.RetrieveProperties;

public class Filter {
	public static final String URL_REGEX = "^((https?|ftp)://|(www|ftp)\\.)?[a-z0-9-]+(\\.[a-z0-9-]+)+([/?].*)?$";

	public static boolean hasURL(String t) {
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

	private static String retrieveArticle(String urlInput) throws FileNotFoundException, IOException, TextAPIException {
		TextAPIClient client = new TextAPIClient(RetrieveProperties.getAppID(), RetrieveProperties.getKey());
		ExtractParams.Builder builder = ExtractParams.newBuilder();
		java.net.URL url = new java.net.URL(urlInput);
		builder.setUrl(url);
		builder.setBestImage(false);
		Article extract = client.extract(builder.build());
		String article = extract.getArticle();
		System.out.println(article);
		return article;
	}
	
	private static boolean checkArticle(String article){
		//needs to check article against dictionary
		return false;
	}
	
	public static boolean checkTweet(){
		//this is the function that will be called
		return false;
	}

}
