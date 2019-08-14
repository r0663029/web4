var xhr = new XMLHttpRequest();

function getPeople(){
    xhr.open("POST", "Controller?action=GetFriends", true);
    xhr.onreadystatechange = getDataPeople;
    xhr.send(null);
    setTimeout(getPeople, 2000);
}

function getDataPeople () {
    if (xhr.status == 200) {
        if (xhr.readyState == 4) {
            var serverResponse = JSON.parse(xhr.responseText);
            console.log(xhr.responseText);
            var tbody = document.getElementById('friends-table-body');
            var currentOnline = document.getElementById('currentOnline');
            var currentOffline  = document.getElementById('currentOffline');
            while(tbody.hasChildNodes()) {
                tbody.removeChild(tbody.firstChild);
            }
            var offlineCount = 0;
            var onlineCount = 0;

            for(var friend in serverResponse) {
                if (serverResponse[friend].status == "Offline"){
                    offlineCount++;
                }else {
                    onlineCount++;
                }
                var row = tbody.insertRow(-1);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);

                cell1.innerHTML = serverResponse[friend].firstName;
                cell2.innerHTML = serverResponse[friend].status;
                //cell1.onclick = function () {}
            }
            currentOffline.innerHTML = offlineCount.toString();
            currentOnline.innerHTML = onlineCount.toString();

            xhr.abort();
        }
    }
}

function addFriend(friendId){
    xhr.open("POST", "Controller?action=AddFriend&friendId=" + friendId.value, true);
    //xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = getDataPeople;
    xhr.send(null);
    friendId.value = '';
}
