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