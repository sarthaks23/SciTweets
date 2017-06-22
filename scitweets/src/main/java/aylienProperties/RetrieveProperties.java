package aylienProperties;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class RetrieveProperties {
	public static String getKey() throws FileNotFoundException, IOException {
		File configFile = new File("Aylien.properties");
		FileReader reader = new FileReader(configFile);
		Properties prop = new Properties();
		prop.load(reader);
		return prop.getProperty("KEY");
	}

	public static String getAppID() throws FileNotFoundException, IOException {
		File configFile = new File("Aylien.properties");
		FileReader reader = new FileReader(configFile);
		Properties prop = new Properties();
		prop.load(reader);
		return prop.getProperty("APP_ID");
	}
}
