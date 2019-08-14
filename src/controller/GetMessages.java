package controller;


import domain.Person;
import domain.PersonService;
import domain.Role;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetMessages extends RequestHandler {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        String receiver = "";
        String message = "";
        try{
            JSONObject obj = new JSONObject(request.getParameter("json"));
            receiver = obj.getString("receiver");
            message = obj.getString("message");
        }catch(JSONException ex){
            System.out.println(ex);
        }
        System.out.println("receiver" + receiver);
        System.out.println("user" + ((Person)request.getSession().getAttribute("user")).getUserId());
        if(receiver.equals(((Person) request.getSession().getAttribute("user")).getUserId())){
            return request.getParameter(message);
        }
        return request.getParameter(message);
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
