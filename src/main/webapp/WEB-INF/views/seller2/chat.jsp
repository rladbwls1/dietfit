<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/resources/js/jquery-1.10.2.min.js"></script>
<script src="/resources/js/socket.io.js"></script>
<head>
<style>
    #chatBox {
        border: 1px solid #ccc;
        padding: 10px;
        height: 300px;
        overflow-y: scroll;
    }

    .message {
        margin-bottom: 5px;
        overflow: hidden; /* float 해제 */
    }

    .userMessage {
        text-align: right;
        color: blue;
    }

    .otherMessage {
        text-align: left;
        color: green;
    }

    #chatContainer {
        display: flex;
        align-items: center;
        padding: 10px;
    }

    #chat {
        flex: 1;
        padding: 5px;
    }

    #sendBtn {
        margin-left: 10px;
    }
</style>
</head>
<script>
   $(function(){
      var socket = io.connect("http://192.168.219.163:7777") // 서버 연결 
      // 채팅 내용을 받는 부분
      socket.on("response",function(message){
         var messageClass = message.sender === "${id}" ? "userMessage" : "otherMessage";
         $("#msgs").append('<div class="message ' + messageClass + '">' + message.msg + '</div><br />');
      });
      // 채팅 내용을 보내는 부분
      $("#sendBtn").on("click", function(){
         sendMessage();
      });

      // 엔터키로 채팅 전송
      $("#chat").keypress(function(event) {
         if (event.which === 13) {
            sendMessage();
         }
      });

      function sendMessage() {
         var m = $("#chat").val();
         if (m.trim() !== "") {
            socket.emit("chatMsg", {msg:"${id}"+"-"+m, sender: "${id}"}); // 보내기
            $("#chat").val("");
         }
      }
   });
</script>

<!--<input type="text" id="productId" name="productId" value="${productId}" readonly style="width: 400px;"><br>-->
<div id="chatBox">
    <div class="message serverMessage">
        <c:choose>
            <c:when test="${status eq 1}">
                상담원: ${id}님 안녕하세요! 어떤 도움이 필요하신가요?
            </c:when>
            <c:when test="${status eq 888}">
                상담 요청을 하셨습니다.
            </c:when>
        </c:choose>
    </div>
	<div id="msgs">
	    ${chat}
	</div>
</div>

<div id="chatContainer">
    <input type="text" name="chat" id="chat" placeholder="메시지 입력" />
    <input type="button" value="전송" id="sendBtn" />
</div>