package handles;

public class Account {
	private String name;
	private String username;
	private String category;
	
	public Account(String name, String username, String category) {
		super();
		this.name = name;
		this.username = username;
		this.category = category;
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
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Account [name=" + name + ", username=" + username + ", category=" + category + "]";
	}
	
}
