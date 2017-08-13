package handles;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import dbconnection.DBConnect;

public class AccountService {

	private List<Account> getAccountsFromDb() throws IOException {
		List<Account> accounts = new ArrayList<Account>();
		try {
			List<String[]> rawAccounts = sortHandlesByAlphabet(DBConnect.selectAllFromHandles());
			for (int i = 0; i < rawAccounts.size(); i++) {
				String accountName = rawAccounts.get(i)[0];
				String accountUsername = rawAccounts.get(i)[1];
				int categoryID = Integer.parseInt(rawAccounts.get(i)[2]);
				accounts.add(new Account(accountName, accountUsername, categoryID));
			}
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return accounts;
	}

	private List<String[]> sortHandlesByAlphabet(List<String[]> handles) {
		List<String> handlesToSort = new ArrayList<String>();
		List<String[]> finalHandles = new ArrayList<String[]>();
		for (String[] handle : handles) {
			String handleName = handle[0];
			handlesToSort.add(handleName);
		}
		Collections.sort(handlesToSort);
		for (String sortedHandles : handlesToSort) {
			for (String[] handle : handles) {
				if (sortedHandles == handle[0]) {
					finalHandles.add(handle);
					break;
				}
			}
		}
		return finalHandles;
	}
	
	public List<Account> retrieveAccounts() throws IOException {
		return getAccountsFromDb();
	}
}