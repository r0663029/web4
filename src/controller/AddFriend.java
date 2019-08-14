package controller;

import com.google.gson.Gson;
import domain.Person;
import domain.PersonService;
import domain.Role;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AddFriend extends RequestHandler {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        Person friend = getPersonService().getPerson(request.getParameter("friendId"));
        Person user = ((Person)(request.getSession().getAttribute("user")));

        if(!user.getFriends().contains(friend.getUserId())){
            if(!user.getUserId().equals(friend.getUserId())){
                user.addFriend(friend.getUserId());
                friend.addFriend(user.getUserId());
            }
        }

        ArrayList<Person> friendsList = new ArrayList<>();
        for(int i = 0; i < user.getFriends().size(); i++){
            friendsList.add(getPersonService().getPerson(user.getFriends().get(i)));
        }

        Gson gson = new Gson();
        String json = gson.toJson(friendsList);
        return json;
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
