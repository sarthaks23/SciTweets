package summarize;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.MalformedURLException;

import com.aylien.textapi.TextAPIClient;
import com.aylien.textapi.TextAPIException;
import com.aylien.textapi.parameters.SummarizeParams;
import com.aylien.textapi.responses.Summarize;

import properties.RetrieveProperties;

public class SummarizeService {

	static RetrieveProperties rp = new RetrieveProperties();

	public static String summarize(String urlInput, int numOfSentences)
			throws FileNotFoundException, IOException, MalformedURLException, TextAPIException {
		TextAPIClient client = new TextAPIClient(rp.getAylienAppID(), rp.getAylienKey());
		SummarizeParams.Builder builder = SummarizeParams.newBuilder();
		java.net.URL url = new java.net.URL(urlInput);
		builder.setUrl(url);
		builder.setNumberOfSentences(numOfSentences);
		Summarize summary = null;
		summary = client.summarize(builder.build());
		String finalSummary =  String.join(",", summary.getSentences()).replaceAll(",", " ");
		return finalSummary;
	}
	
}
