Kakao.Channel.followChannel({
  channelPublicId: '${CHANNEL_PUBLIC_ID}',
})
  .then(function(response) {
    console.log(response)
    // 채널 간편 추가 성공 처리
  })
  .catch(function(error) {
    console.error(error)
    // 채널 간편 추가 실패 처리
  })
  
  Kakao.Channel.createAddChannelButton({
  container: '#kakao-add-channel-button',
  channelPublicId: '_GCliG' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
});

Kakao.Channel.createChatButton({
  container: '#kakao-talk-channel-chat-button',
  channelPublicId: '_GCliG' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
});