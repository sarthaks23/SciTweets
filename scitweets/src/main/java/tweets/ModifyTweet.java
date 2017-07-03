package tweets;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ModifyTweet {
	public static String deleteSecondURL(String text){
		final String URL_REGEX = "^((https?|ftp)://|(www|ftp)\\.)?[a-z0-9-]+(\\.[a-z0-9-]+)+([/?].*)?$";
		int URLCounter = 0;
		String finalText = null;
		Pattern p = Pattern.compile(URL_REGEX);
		List<String> textWord = new ArrayList<String>();
		String[] words = text.split("\\s+");
		for(int i = 0; i < words.length; i++){
			textWord.add(words[i]);
		}
		for(String word : textWord){
			Matcher m = p.matcher(word);
			if(m.find()){
				URLCounter++;
				if(URLCounter == 2){
					textWord.remove(word);
					finalText = String.join(",", textWord).replaceAll(",", " ");
					return finalText;
				}
			}
		}
		return text;
	}
}
