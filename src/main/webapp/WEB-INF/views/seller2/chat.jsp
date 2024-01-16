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
    <div class="chatBox" id="chatBox">
        <div class="message serverMessage">
            상담원: ${id}님 안녕하세요! 어떤 도움이 필요하신가요?
        </div>
        <div id="msgs" class="msgs"></div>
    </div>

    <div class="chatContainer">
        <input type="text" name="chat" class="chat" id="chat" placeholder="메시지 입력" />
        <input type="button" value="전송" class="sendBtn" id="sendBtn" />
    </div>

    <script>
        var socket = io.connect("http://192.168.219.163:7777");
        var userId = "${id}";
        var adminStatus = ${adminstatus};
        
        socket.on("response", function (message) {
            var messageClass = message.senderId === userId ? "userMessage" : "otherMessage";
            var msg = message.msg;
            var msgid = msg.split("-")[0];
            if (message.senderId === userId) {
                // 동일하다면 사용자 ID와 메시지를 처리
                $("#msgs").append('<div class="message ' + messageClass + '">' + message.msg + '</div><br />');
            } else {
                // 다르다면 다른 처리를 수행
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
                socket.emit("chatMsg", { msg: "${id}" + "-" + m, senderId: "${id}", roomType: "user" });
                $(".chat").val("");
            }
        }
     // 사용자가 채팅을 종료했을 때 호출되는 함수
        function closeChat() {
            // 서버에 채팅 종료 요청 보내기
            socket.emit("closeChat", { userId: "${id}" });
            // TODO: 여기에서 필요한 추가 로직 수행
        }

    </script>
</body>
</html>
