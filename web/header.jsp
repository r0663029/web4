<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header role="banner">
    <img alt="Books" src="images/books.jpg">
    <h1><span>Chat App</span></h1>
    <nav>
        <ul>
        <c:choose>
            <c:when test="${param.title=='Add User'}">
                <li id="actual"><a href="addUser.jsp">Add User</a></li>
                <li><a href="Controller?action=Chat">Chat</a></li>
                <li><a href="Controller">Home</a></li>
            </c:when>
            <c:when test="${param.title=='Home'}">
                <li id="actual"><a href="Controller">Home</a></li>
                <li onclick="closeSocket()"><a href="Controller?action=Chat">Chat</a></li>
                <li onclick="closeSocket()"><a href="addUser.jsp">Add User</a></li>
            </c:when>
            <c:when test="${param.title=='Chat'}">
                <li id="actual"><a href="Controller?action=Chat">Chat</a></li>
                <li><a href="Controller">Home</a></li>
                <li><a href="addUser.jsp">Add User</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="Controller">Home</a></li>
                <li><a href="Controller?action=Chat">Chat</a></li>
                <li><a href="addUser.jsp">Add User</a></li>
            </c:otherwise>
        </c:choose>
        </ul>
    </nav>
    <h2>
        ${param.title}
    </h2>
</header>