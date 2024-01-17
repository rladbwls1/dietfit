<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/resources/js/jquery-1.10.2.min.js"></script>
<script src="/resources/js/socket.io.js"></script>
<head>
    <style>
        #userList {
            border: 1px solid #ccc;
            padding: 10px;
            height: 300px;
            overflow-y: scroll;
        }

        .userItem {
            margin-bottom: 5px;
            cursor: pointer;
        }

        .chatBox {
            border: 1px solid #ccc;
            padding: 10px;
            height: 300px;
            overflow-y: scroll;
        }

        .msgs {
            margin-bottom: 5px;
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
    <div id="userList">
        <c:forEach var="user" items="${userRequests}">
            <div class="userItem" onclick="openChat('${user.userId}', '${user.userName}')">
                ${user.userName}님의 채팅 요청
            </div>
        </c:forEach>
    </div>

    <div class="chatBox" id="chatBox">
        <div id="msgs" class="msgs"></div>
    </div>

    <div class="chatContainer">
        <input type="text" name="chat" class="chat" id="chat" placeholder="메시지 입력" />
        <input type="button" value="전송" class="sendBtn" id="sendBtn" />
    </div>

    <script>
    var socket = io.connect("http://192.168.219.163:7777");

    socket.on("response", function (message) {
        var messageClass = message.senderId === "${userId}" ? "userMessage" : "adminMessage";
        var msg = message.msg;
        var msgid = msg.split("-")[0];

        // 관리자이거나 사용자인 경우 모두 메시지를 표시합니다.
        if (message.senderId === "${userId}" || msgid === "${userId}") {
            $("#msgs").append('<div class="message ' + messageClass + '">' + message.msg + '</div><br />');
        } else {
            // 다른 경우에는 다른 동작을 수행하거나 생략할 수 있습니다.
        }
    });

        // 사용자의 채팅 요청을 받아서 목록에 추가하는 부분
        socket.on("userRequest", function (user) {
            $("#userList").append('<div class="userItem" onclick="openChat(\'' + user.userId + '\', \'' + user.userName + '\')">' + user.userName + '님의 채팅 요청</div>');
        });

        // 사용자와 채팅방 열기
        function openChat(userId, userName) {
            // 서버에 해당 사용자의 채팅방 입장 요청 보내기
            socket.emit("joinRoom", { userId: userId, userType: "admin" });
            // TODO: 해당 사용자의 채팅방을 표시하는 로직 추가 (예: Ajax 호출 등)

            // 선택한 사용자의 채팅방으로 UI 변경
            $("#chatBox").html('<div class="userMessage">채팅방: ' + userName + '</div>');
        }

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
                socket.emit("chatMsg", { msg: "${adminId}" + "-" + m, senderId: "${adminId}", roomType: "admin" });
                $(".chat").val("");
            }
        }
    </script>
</body>
</html>
