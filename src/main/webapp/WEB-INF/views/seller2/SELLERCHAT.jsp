<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/resources/js/jquery-1.10.2.min.js"></script>
<script src="/resources/js/socket.io.js"></script>
<head>
    <style>

        .chatBox {
            border: 1px solid #ccc;
            padding: 10px;
            height: 300px;
            overflow-y: scroll;
        }
        .chatContainer {
            display: flex;
            align-items: center;
            padding: 10px;
        }

        .chat {
            flex: 1;
            padding: 5px;
        }

        .sendBtn {
            margin-left: 10px;
        }

        .userMessage {
            text-align: right;
            color: blue;
        }

        .otherMessage {
            text-align: left;
            color: green;
        }
    </style>
</head>
<body>
	<input type="button" value="뒤로 가기" onclick="goBack()" />
    <div class="chatBox" id="chatBox">
        <div id="msgs" class="msgs">${chat}</div>
    </div>

    <div class="chatContainer">
        <input type="text" name="chat" class="chat" id="chat" placeholder="메시지 입력" />
        <input type="button" value="전송" class="sendBtn" id="sendBtn" />
    </div>

    <script>
    var socket = io.connect("http://192.168.219.163:7777");
    var sellerid = "${sellerid}";
    var findid = "${findid}";
    var findproduct = "${findproduct}";
    var product = "${product}";
    var roomnum = '${roomnum}';
    socket.on("response", function (message) {
    	if(message.roomnum == roomnum){
    		$("#msgs").append('<div class="message">' + message.msg + '</div><br />');
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
        function goBack() {
            window.history.back();
        }
        
    </script>
</body>
</html>
