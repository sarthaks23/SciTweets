package handles;

import java.util.ArrayList;
import java.util.List;

public class AccountService {
	private static List<Account> accounts = new ArrayList<Account>();
	static {
		/* in order to add a new account, just copy and paste the line below and
		 replace the name and username*/
		accounts.add(new Account("Stand Up To Cancer", "@SU2C"));
	}

	public List<Account> retrieveAccounts() {
		return accounts;
	}
}
