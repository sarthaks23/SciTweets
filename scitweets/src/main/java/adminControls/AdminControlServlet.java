package adminControls;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handles.Account;
import handles.Category;
import handles.CategoryService;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/admincontrol")
public class AdminControlServlet extends HttpServlet {

	private CategoryService categoryService = new CategoryService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Category> categories = categoryService.retrieveCategories();
		List<Account> accountList = new ArrayList<Account>();
		for(Category category : categories) {
			Account[] tempAccountArray = category.getAccounts();
			for (Account account : tempAccountArray) {
				accountList.add(account);
			}
		}
		int numOfAccounts = accountList.size();
		request.setAttribute("accounts", accountList.toArray(new Account[numOfAccounts]));
		int listSize = categories.size();
		request.setAttribute("categories", categories.toArray(new Category[listSize]));
		request.getRequestDispatcher("/WEB-INF/views/admincontrol.jsp").forward(request, response);
	}
}
