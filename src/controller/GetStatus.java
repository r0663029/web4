package controller;

import domain.Person;
import domain.PersonService;
import domain.Role;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetStatus extends RequestHandler {


    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        return ((Person)(request.getSession().getAttribute("user"))).getStatus();
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
