<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
    <jsp:include page="head.jsp">
        <jsp:param name="title" value="Add User" />
    </jsp:include>
    </head>
    <body>
    <jsp:include page="header.jsp">
        <jsp:param name="title" value="Add User" />
    </jsp:include>
    <main>
        <c:if test="${errors.size()>0 }">
            <div class="danger">
                <ul>
                    <c:forEach var="error" items="${errors }">
                        <li>${error }</li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
        <form method="post" action="Controller?action=AddUser">
            <p>
                <label for="firstname">Firstname</label>
                <input type="text" id="firstname" name="firstname">
            </p>
            <p>
                <label for="lastname">Lastname</label>
                <input type="text" id="lastname" name="lastname">
            </p>
            <p>
                <label for="age">Age</label>
                <input type="number" id="age" name="age">
            </p>
            <p>
                <label for="gender">Gender </label>
                <select name="gender" id="gender">
                    <option value="Female">Female</option>
                    <option value="Male">Male</option>
                </select>
            </p>
            <p>
                <label for="email">E-mail </label>
                <input type="text" id="email" name="userId">
            </p>
            <p>
                <label for="password">Password</label>
                <input type="password" id="password" name="password">
            </p>
            <p>
                <label for="passwordRepeat">Repeat password</label>
                <input type="password" id="passwordRepeat" name="passwordRepeat">
            </p>
            <p>
                <label for="role">Role </label>
                <select name="role" id="role">
                    <option value="LID">Lid</option>
                    <option value="BIB">Bibliothekaris</option>
                </select>
            </p>
            <p>
                <input type="submit" id="loginbutton" value="Submit">
            </p>
        </form>
    </main>
    </body>
    </html>