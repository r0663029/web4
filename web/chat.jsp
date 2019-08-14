<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/sample.css">
    <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/status.js"></script>
    <script type="text/javascript" src="js/friends.js"></script>
    <script type="text/javascript" src="js/friend-button.js"></script>
    <jsp:include page="head.jsp">
        <jsp:param name="title" value="Chat" />
    </jsp:include>
</head>
<body onload="getPeople()">
    <jsp:include page="header.jsp">
        <jsp:param name="title" value="Chat" />
    </jsp:include>
    <main>
        <div id="currentStatus">${status}</div>
        Online:<div id="currentOnline"></div>
        Offline:<div id="currentOffline"></div>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody id="friends-table-body">

            </tbody>
        </table>
        <select id="status" onchange="setStatus(this.options[this.selectedIndex].value)">
            <option id="Online">Online</option>
            <option id="Away">Away</option>
            <option id="Offline">Offline</option>
        </select>
        <br>
        <h3>Change Status</h3>
        <input type="text" id="customStatus">
        <button id="statusbtn" onclick="setStatus(document.getElementById('customStatus').value)">Use custom status</button>
        <br><br>
        <button id="friend-button">New Friend</button>
        <br><br>
        <div id="add-friend-area">
            <p>
                <label for="emailFriend">e-mailadres</label>
                <input type="text" id="emailFriend">
            </p>
            <button onclick="addFriend(document.getElementById('emailFriend'))">Add friend</button>
        </div>
    </main>
</body>
</html>
