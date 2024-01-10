<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    }

    .userMessage {
        text-align: right;
        color: blue;
    }

    .serverMessage {
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
                             // 자신 IP : 포트번호  서버마다 다 다르게 해야함
      var socket = io.connect("http://192.168.219.163:9999") // 서버 연결 
      // 채팅 내용을 받는 부분
      socket.on("response",function(message){
         $("#msgs").append(message.msg+"<br />");
      });
      // 채팅 내용을 보내는 부분
      $("#sendBtn").on("click", function(){
         var m = $("#chat").val();
         socket.emit("chatMsg", {msg:"${sessionScope.memId}"+"-"+m}); // 보내기
         $("#chat").val("");
      })
   });
</script>

<input type="text" id="productId" name="productId" value="${productId}" readonly style="width: 400px;"><br>
<div id="chatBox">
    <div class="message serverMessage">상담원: 안녕하세요! 어떤 도움이 필요하신가요?</div>
</div>

<div id="chatContainer">
    <input type="text" name="chat" id="chat" placeholder="메시지 입력" />
    <input type="button" value="전송" id="sendBtn" />
</div>
<div id="msgs">
    <!-- 여기서는 초기에 서버 메시지가 뿌려질 부분 -->
    <div class="message serverMessage">${chat}</div>
</div>