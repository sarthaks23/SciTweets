package filter;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

}
