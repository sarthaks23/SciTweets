package filter;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class Filter {

	public static boolean hasURL(String t) {
		final String URL_REGEX = "^((https?|ftp)://|(www|ftp)\\.)?[a-z0-9-]+(\\.[a-z0-9-]+)+([/?].*)?$";
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

	private static List<String> retrieveArticle(String urlInput) throws IOException {
		final String SPECIALCHAR_REGEX = "[^a-z0-9 ]";
		Document webpage = Jsoup.connect(urlInput).get();
		String article = webpage.body().toString();
		String[] parsedArticle = Jsoup.parse(article).toString().split("\\s+");
		Pattern p = Pattern.compile(SPECIALCHAR_REGEX, Pattern.CASE_INSENSITIVE);
		List<String> cleanedArticle = new ArrayList<String>();
		for (String word : parsedArticle) {
			Matcher m = p.matcher(word);
			if (!m.find()) {
				cleanedArticle.add(word);
			}
		}
		return cleanedArticle;
	}

	private static boolean checkArticle(List<String> article) {
		List<String> filterWords = new ArrayList<String>();
		List<String> tempArray = new ArrayList<String>();
		int matchCounter = 0;
		ClassLoader cs = new Filter().getClass().getClassLoader();
		File filterWordsFile = new File(cs.getResource("FilterWords.txt").getFile());
		try {
			Scanner scan = new Scanner(filterWordsFile);
			while (scan.hasNextLine()) {
				String word = scan.nextLine();
				if (!word.isEmpty() || !word.contains("<")) {
					filterWords.add(word);
				}
			}
			scan.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		for (String wordInArticle : article) {
			wordInArticle = wordInArticle.toLowerCase().replaceAll("\\s+", "").replaceAll("[^a-zA-Z0-9]", "");
			if (!tempArray.contains(wordInArticle)) {
				tempArray.add(wordInArticle);
				for (String wordInFilter : filterWords) {
					wordInFilter.toLowerCase().replaceAll("\\s+", "");
					if (wordInArticle.equalsIgnoreCase(wordInFilter)) {
						matchCounter++;
						break;
					}
				}
			}
			if (matchCounter > 3) {
				return true;
			}
		}
		return false;
	}

	public static boolean checkTweet(String urlInput) throws IOException {
		return Filter.checkArticle(Filter.retrieveArticle(urlInput));
	}
}
