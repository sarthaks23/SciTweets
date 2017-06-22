package summarize;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.MalformedURLException;

import com.aylien.textapi.TextAPIClient;
import com.aylien.textapi.TextAPIException;
import com.aylien.textapi.parameters.SummarizeParams;
import com.aylien.textapi.responses.Summarize;

import aylienProperties.RetrieveProperties;

public class SummarizeService {
	public static String summarize(String urlInput, int numOfSentences)
			throws FileNotFoundException, IOException, MalformedURLException {
		TextAPIClient client = new TextAPIClient(RetrieveProperties.getAppID(), RetrieveProperties.getKey());
		SummarizeParams.Builder builder = SummarizeParams.newBuilder();
		java.net.URL url = new java.net.URL(urlInput);
		builder.setUrl(url);
		builder.setNumberOfSentences(5);
		Summarize summary = null;
		try {
			summary = client.summarize(builder.build());
		} catch (TextAPIException e) {
			e.printStackTrace();
			return "Error retrieving summary";
		}
		String finalSummary = null;
		for (String sentence : summary.getSentences()) {
			finalSummary = sentence + " ";
		}
		return finalSummary;
	}
}
