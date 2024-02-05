<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"
    />
    <title>
      Kakao Talk Channel Create Chat Button Demo - Kakao JavaScript SDK
    </title>
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.6.0/kakao.min.js"
      integrity="sha384-6MFdIr0zOira1CHQkedUqJVql0YtcZA1P0nbPrQYJXVJZUkTk/oX4U9GhUIs3/z8" crossorigin="anonymous"></script>
  </head>
  <body>
    <div id="kakao-talk-channel-chat-button"></div>
    <script type="text/javascript">
      // 사용할 앱의 JavaScript 키를 설정해 주세요.
      Kakao.init('ce765a4e5047770d03e8b69f53f43139');
      // 채널 1:1 채팅 버튼을 생성합니다.
      Kakao.Channel.createChatButton({
        container: '#kakao-talk-channel-chat-button',
        channelPublicId: '_GCliG',
        title: 'consult',
        size: 'small',
        color: 'yellow',
        shape: 'pc',
        supportMultipleDensities: true,
      });
    </script>
  </body>
</html>