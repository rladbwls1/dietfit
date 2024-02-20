<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/resources/js/jquery-1.10.2.min.js"></script>
<script src="/resources/js/socket.io.js"></script>
<head>
    <style>
	    .chatBox {
	        border: 1px solid #000000; /* Green border */
	        background-color: #FFF; /* Light grey background */
	        padding: 10px;
	        height: 300px;
	        border-radius: 5px;
	        margin-top : 10px;
	        overflow-y: scroll;
	    }
	
	    .chatContainer {
	        display: flex;
	        align-items: center;
	        padding: 10px;
	        border-radius: 5px;
	        background-color: #FFF; /* Dark background color */
	    }
	
	    .chat {
	        flex: 1;
	        padding: 5px;
	        border: 1px solid #ccc;
	        border-radius: 5px;
	        margin-right: 10px;
	    }
	
	    .sendBtn {
	        background-color: #355FAD; /* Green background color */
	        color: white;
	        border: none;
	        padding: 8px 16px;
	        border-radius: 5px;
	        cursor: pointer;
	    }
	
	    .userMessage {
	        text-align: right;
	        color: #2196F3; /* Blue text color */
	    }
	
	    .otherMessage {
	        text-align: left;
	        color: #4CAF50; /* Green text color */
	    }
	
	    .exitMessage {
	        text-align: center;
	        color: #FF0000; /* Red text color */
	        font-weight: bold;
	    }
	</style>

</head>
<body>
	<input type="text" id="product" name="product" value="${product}" readonly style="width: 400px;"><br>
    <div class="chatBox" id="chatBox">
        <div id="msgs" class="msgs">${chat}</div>
    </div>

    <div class="chatContainer">
        <input type="text" name="chat" class="chat" id="chat" placeholder="메시지 입력" />
        <input type="button" value="전송" class="sendBtn" id="sendBtn" />
    </div>

    <script>
    var socket = io.connect("http://192.168.219.167:7777");
    var sellerid = "${sellerid}";
    var product = "${product}";
    var roomnum = '${roomnum}';
    socket.on("response", function (message) {
    	if(message.roomnum == roomnum){
    		var alignmentClass = message.senderId === sellerid ? 'userMessage' : 'otherMessage';
    		$("#msgs").append('<div class="message ' + alignmentClass + '">' + message.msg + '</div><br />');
    		
    	}
    });
    
        // 엔터키로 채팅 전송
        $(".chat").keypress(function (event) {
            if (event.which === 13) {
                sendMessage();
            }
        });

        // 채팅 메시지 전송
        $(".sendBtn").on("click", function () {
            sendMessage();
        });
        
        function sendMessage() {
            var m = $(".chat").val();
            if (m.trim() !== "") {
                socket.emit("chatMsg", { msg: "${sellerid}" + "-" + m, senderId: "${sellerid}", roomType: "user", roomnum : "${roomnum}" });
                $(".chat").val("");
            }
        }
        
        function goToSpecificPath(path) {
            window.location.href = path;
        }

    </script>
</body>
</html>
