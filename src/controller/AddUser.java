package controller;

import domain.Person;
import domain.PersonService;
import domain.Role;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class AddUser extends RequestHandler {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        List<String> errors = new ArrayList<String>();
        String destination = "index.jsp";

        Person person = new Person();

        String firstname = request.getParameter("firstname");
        try {
            person.setFirstName(firstname);
        }catch (IllegalArgumentException e){
            errors.add(e.getMessage());
        }

        String lastname = request.getParameter("lastname");
        try {
            person.setLastName(lastname);
        }catch (IllegalArgumentException e){
            errors.add(e.getMessage());
        }

        String age = request.getParameter("age");
        if(age.isEmpty() || age == null){
            errors.add("No age given");
        }else {
            try {
                person.setAge(Integer.parseInt(age));
            }catch (IllegalArgumentException e){
                errors.add(e.getMessage());
            }
        }

        String gender = request.getParameter("gender");
        person.setGender(gender);

        String userId = request.getParameter("userId");
        try {
            person.setUserId(userId);
        }catch (IllegalArgumentException e){
            errors.add(e.getMessage());
        }

        String password = request.getParameter("password");
        String password2 = request.getParameter("passwordRepeat");
        if (!password.equals(password2)) errors.add("Repeated password doesn't match");
        try {
            person.setHashedPassword(password);
        }catch (IllegalArgumentException e){
            errors.add(e.getMessage());
        }

        String role = request.getParameter("role");
        person.setRole(Role.valueOf(role));

        try {
            getPersonService().addPerson(person);
        }catch (IllegalArgumentException e){
            errors.add(e.getMessage());
        }

        if (errors.size() > 0) {
            request.setAttribute("errors", errors);
            destination = "addUser.jsp";
        }

        return destination;
    }
    @Override
    public void setModel(PersonService personService) {
        super.setModel(personService);
    }

}
