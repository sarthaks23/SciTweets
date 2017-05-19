package handles;

public class Account {
	private String name;
	private String username;
	
	public Account(String name, String username) {
		super();
		this.name = name;
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "account [name=" + name + ", username=" + username + "]";
	}
	
}
