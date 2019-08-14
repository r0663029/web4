package controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import domain.Person;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Console;
import java.io.IOException;

@WebServlet("/GetUsers")
public class GetUsers extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    public void processRequest(HttpServletRequest request, HttpServletResponse response) {

        Gson gsonBuilder = new GsonBuilder().create();
        String json = gsonBuilder.toJson(RequestHandler.getPersonService().getPersons());

        response.setContentType("application/json");
        // setting the CORS request, CrossOriginResourceSharing
        // so that this url/response is accessible in another domain (angular application for example)
        response.setHeader("Access-Control-Allow-Origin", "*");
        try{
            response.getWriter().write(json);
        }catch (IOException e){
            System.out.println(e.getMessage());
        }
    }
}
