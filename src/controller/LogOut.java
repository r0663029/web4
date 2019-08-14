package controller;

import domain.Person;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogOut extends RequestHandler {

	@Override
	public String handleRequest(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		Person person = ((Person)(request.getSession().getAttribute("user")));
		person.setStatus("Offline");
		session.invalidate();
		return "index.jsp";
	}
	
}
