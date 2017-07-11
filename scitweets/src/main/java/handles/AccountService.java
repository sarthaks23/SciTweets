package handles;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconnection.DBConnect;

public class AccountService {

	private List<Account> getAccountsFromDb() {
		List<Account> accounts = new ArrayList<Account>();
		try {
			List<String[]> rawAccounts = DBConnect.selectAllFromHandles();
			for (int i = 0; i < rawAccounts.size(); i++) {
				String accountName = rawAccounts.get(i)[0];
				String accountUsername = rawAccounts.get(i)[1];
				accounts.add(new Account(accountName, accountUsername));
			}
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return accounts;
	}


	public List<Account> retrieveAccounts() {
		return getAccountsFromDb();
	}
}