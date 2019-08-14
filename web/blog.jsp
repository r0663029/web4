<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <script src="js/webSocket.js"></script>
        <jsp:include page="head.jsp">
            <jsp:param name="title" value="Blog" />
        </jsp:include>
    </head>
    <body onload="openSocket()">
        <jsp:include page="header.jsp">
            <jsp:param name="title" value="Blog" />
        </jsp:include>
        <main>
            <section class="topic">
                <h3>Projectweek</h3>
                <p>"Was het een interessante projectweek?"</p>
                <br>
                <p>comments:</p>
                <div id="messages1"></div>
                <div class="topicInputFields">
                    <h5>Name</h5>
                    <input type="text" id="nameinput1"/>
                    <br>
                    <h5>Rating (../10)</h5>
                    <input type="text" id="ratinginput1"/>
                    <br>
                    <h5>Comment</h5>
                    <input type="text" id="messageinput1"/>
                </div>
                <button class="send-button" type="button" onclick="send(1);" >Send</button>
            </section>
            <section class="topic">
                <h3>Plannen voor vandaag</h3>
                <p>Wat zijn jouw plannen voor vandaag?</p>
                <br>
                <div id="messages2"></div>
                <div class="topicInputFields">
                    <h5>Name</h5>
                    <input type="text" id="nameinput2"/>
                    <br>
                    <h5>Rating (../10)</h5>
                    <input type="text" id="ratinginput2"/>
                    <br>
                    <h5>Comment</h5>
                    <input type="text" id="messageinput2"/>
                </div>
                <button class="send-button" type="button" onclick="send(2);" >Send</button>
            </section>
            <section class="topic">
                <h3>Muziek</h3>
                <p>Naar welke muziek ben je momenteel an het luisteren?</p>
                <br>
                <div id="messages3"></div>
                <div class="topicInputFields">
                    <h5>Name</h5>
                    <input type="text" id="nameinput3"/>
                    <br>
                    <h5>Rating (../10)</h5>
                    <input type="text" id="ratinginput3"/>
                    <br>
                    <h5>Comment</h5>
                    <input type="text" id="messageinput3"/>
                </div>
                <button class="send-button" type="button" onclick="send(3);" >Send</button>
            </section>
            <section class="topic">
                <h3>Examenvragen</h3>
                <p>Wat zijn de examenvragen voor het vak web4?</p>
                <br>
                <div id="messages4"></div>
                <div class="topicInputFields">
                    <h5>Name</h5>
                    <input type="text" id="nameinput4"/>
                    <br>
                    <h5>Rating (../10)</h5>
                    <input type="text" id="ratinginput4"/>
                    <br>
                    <h5>Comment</h5>
                    <input type="text" id="messageinput4"/>
                </div>
                <button class="send-button" type="button" onclick="send(4);" >Send</button>
            </section>
            <section class="topic">
                <h3>Kerstversiering</h3>
                <p>Welke kleur heeft de versiering in jouw kerstboom?</p>
                <br>
                <div id="messages5"></div>
                <div class="topicInputFields">
                    <h5>Name</h5>
                    <input type="text" id="nameinput5"/>
                    <br>
                    <h5>Rating (../10)</h5>
                    <input type="text" id="ratinginput5"/>
                    <br>
                    <h5>Comment</h5>
                    <input type="text" id="messageinput5"/>
                </div>
                <button class="send-button" type="button" onclick="send(5);" >Send</button>
            </section>
            <script type="text/javascript">
                var webSocket;
                var messages;

                function openSocket(){
                    webSocket = new WebSocket("ws://localhost:8080/echo");
                    webSocket.onmessage = function(event){
                        writeResponse(event.data);
                    };
                }

                function send(topicId){
                    var text = document.getElementById("messageinput" + topicId).value;
                    var name = document.getElementById("nameinput" + topicId).value;
                    var rating = document.getElementById("ratinginput" + topicId).value;
                    if(text.length == 0 || name.length == 0 || rating.length == 0){
                        alert("Some fields are empty!")
                    }else if (isNaN(rating) ||rating > 10 || rating < 0){
                        alert("Rating is not a number between 0 and 10!");
                    }else {
                        var comment = "<br/>" + rating + "/10 - " + name + "<br/>" + text;
                        webSocket.send(JSON.stringify({id: topicId, comment: comment}))
                    }
                }

                function closeSocket(){
                    webSocket.close();
                }

                function writeResponse(text){
                    var serverResponse = JSON.parse(text);
                    var topicId = serverResponse.id;
                    var comment = serverResponse.comment;
                    messages = document.getElementById("messages" + topicId);
                    messages.innerHTML += "<br/>" + comment;
                }
            </script>
        </main>
        <jsp:include page="footer.jsp">
            <jsp:param name="title" value="Blog" />
        </jsp:include>
    </body>
</html>