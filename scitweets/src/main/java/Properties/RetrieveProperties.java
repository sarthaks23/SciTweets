package Properties;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class RetrieveProperties {
	
	private String getProperties(String filename, String property) throws IOException{
		File configFile = new File(getClass().getClassLoader().getResource(filename).getFile());
		FileReader reader = new FileReader(configFile);
		Properties prop = new Properties();
		prop.load(reader);
		return prop.getProperty(property);
	}
	
	public String getAylienKey() throws FileNotFoundException, IOException {
		return getProperties("Aylien.properties", "KEY");
	}

	public String getAylienAppID() throws FileNotFoundException, IOException {
		return getProperties("Aylien.properties", "APP_ID");
	}
	
	public String getAdminUsername() throws IOException{
		return getProperties("AdminCredentials.properties", "Username");
	}
	
	public String getAdminPassword() throws IOException{
		return getProperties("AdminCredentials.properties", "Password");
	}
}
