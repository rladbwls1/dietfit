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

        .message {
            margin-bottom: 5px;
            overflow: hidden;
        }

        .userMessage {
            text-align: right;
            color: blue;
        }

        .otherMessage {
            text-align: left;
            color: green;
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
    </style>
</head>
<body>
	<input type="text" id="product" name="product" value="${product}" readonly style="width: 400px;"><br>
    <div class="chatBox" id="chatBox">
        <div class="message serverMessage">
            안녕하세요! ${id}님 어떤 도움이 필요하신가요?<br>
            ${chat }
        </div>
        <div id="msgs" class="msgs"></div>
    </div>

    <div class="chatContainer">
        <input type="text" name="chat" class="chat" id="chat" placeholder="메시지 입력" />
        <input type="button" value="전송" class="sendBtn" id="sendBtn" />
        <input type="button" value="나가기" class="exitBtn" id="exitBtn" />
		<input type="hidden" name="roomnum" value="${roomnum}">
		<%--
		<input type="hidden" name="roomnum" value="${product}">
		<input type="hidden" name="roomnum" value="${id}">
		 --%>
    </div>

    <script>
        var socket = io.connect("http://192.168.219.167:7777");
        var userId = "${id}";
        var sellercompany = "${sellercompany}";
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
     // 사용자가 나가기 버튼을 눌렀을 때의 동작
        $(".exitBtn").on("click", function() {

            
            var m ="사용자가 채팅방을 나갔습니다.";
                socket.emit("chatMsg", { msg: "${id}" + "-" + m, senderId: "${id}", roomType: "user", roomnum : "${roomnum}"});
            socket.emit("exitChat", { userId: "${userId}", roomnum: "${roomnum}" });
            
            $(".chatBox").hide();
            
            window.history.back();
        });

        function sendMessage() {
            var m = $(".chat").val();
            if (m.trim() !== "") {
                socket.emit("chatMsg", { msg: "${id}" + "-" + m, senderId: "${id}", roomType: "user", roomnum : "${roomnum}"});
                $(".chat").val("");

                // 메시지 전송 후 채팅 요청 리스트 갱신 요청
                socket.emit("refreshChatList", { sellerId: "${sellercompany}" });
            }
        }
    </script>
</body>
</html>
