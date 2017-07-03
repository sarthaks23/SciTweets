package aylienProperties;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class RetrieveProperties {
	
	private String getProperties(String property) throws IOException{
		File configFile = new File(getClass().getClassLoader().getResource("Aylien.properties").getFile());
		FileReader reader = new FileReader(configFile);
		Properties prop = new Properties();
		prop.load(reader);
		return prop.getProperty(property);
	}
	
	public String getKey() throws FileNotFoundException, IOException {
		return getProperties("KEY");
	}

	public String getAppID() throws FileNotFoundException, IOException {
		return getProperties("APP_ID");
	}
}
