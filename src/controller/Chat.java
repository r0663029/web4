package controller;

import domain.Person;
import domain.PersonService;
import domain.Role;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Chat extends RequestHandler {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("status", "Offline");
        HttpSession session = request.getSession();
        if(session != null){
            Person person = (Person) session.getAttribute("user");
            if(person != null) {
                request.setAttribute("status", person.getStatus());
                request.setAttribute("friends", person.getFriends());
            }
        }

        String destination = "chat.jsp";
        return destination;
    }

    @Override
    public void setModel(PersonService personService) {
        super.setModel(personService);
    }

    @Override
    protected boolean isFromUserWithRole(HttpServletRequest request, Role role) {
        return super.isFromUserWithRole(request, role);
    }
}
