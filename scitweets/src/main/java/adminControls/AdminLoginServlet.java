package adminControls;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import properties.RetrieveProperties;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/adminlogin")
public class AdminLoginServlet extends HttpServlet {
	
	static RetrieveProperties rp = new RetrieveProperties();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/adminlogin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (username.equals(rp.getAdminUsername()) && password.equals(rp.getAdminPassword())) {
			request.getSession().setAttribute("username", username);
			request.setAttribute("errorMessage", "Success");
			request.getRequestDispatcher("/admincontrol").forward(request, response);
		} else {
			request.setAttribute("errorMessage", "Invalid Credentials");
			request.getRequestDispatcher("/WEB-INF/views/adminlogin.jsp").forward(request, response);
		}
	}
}
