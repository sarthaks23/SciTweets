package handles;

import java.util.ArrayList;
import java.util.List;

public class AccountService {
	private static List<Account> accounts = new ArrayList<Account>();
	static {
		/* in order to add a new account, just copy and paste the line below and
		 replace the name and username*/
		accounts.add(new Account("Stand Up To Cancer", "@SU2C"));
		accounts.add(new Account("Broad Institute", "@broadinstitute"));
		accounts.add(new Account("Node.js", "@nodejs"));
		accounts.add(new Account("Nature BIOTECH", "@NatureBiotech"));
		accounts.add(new Account("Nasa", "@Nasa"));
		accounts.add(new Account("Jetstrap", "@jetstrap"));
	}

	public List<Account> retrieveAccounts() {
		return accounts;
	}
}
