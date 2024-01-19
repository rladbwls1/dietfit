package test.spring.mvc.controller;

import java.io.FileWriter;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.vertx.java.core.Handler;
import org.vertx.java.core.Vertx;
import org.vertx.java.core.http.HttpServer;
import org.vertx.java.core.http.RouteMatcher;
import org.vertx.java.core.json.JsonObject;
import com.nhncorp.mods.socket.io.SocketIOServer;
import com.nhncorp.mods.socket.io.SocketIOSocket;
import com.nhncorp.mods.socket.io.impl.DefaultSocketIOServer;
import com.nhncorp.mods.socket.io.spring.DefaultEmbeddableVerticle;

import test.spring.mvc.service.SellerService;

public class SellerChat extends DefaultEmbeddableVerticle {
	
	@Autowired
	private SellerService service;

    private SocketIOServer io = null;
    private Map<String, SocketIOSocket> userSockets = new ConcurrentHashMap<>();
    private Map<String, String> userRooms = new ConcurrentHashMap<>();

    @Override
    public void start(Vertx vertx) {
        HttpServer server = vertx.createHttpServer();

        RouteMatcher routeMatcher = new RouteMatcher();
        server.requestHandler(routeMatcher);

        io = new DefaultSocketIOServer(vertx, server);
        io.sockets().onConnection(new Handler<SocketIOSocket>() {
            @Override
            public void handle(SocketIOSocket socket) {
                socket.on("joinRoom", new Handler<JsonObject>() {
                    @Override
                    public void handle(JsonObject event) {
                        String userId = event.getString("userId");
                        String userType = event.getString("userType");
                        String roomName = createRoomForUser(userId, userType);
                        userSockets.put(userId, socket);
                        userRooms.put(userId, roomName);
                        socket.join(roomName);
                    }
                });

                socket.on("chatMsg", new Handler<JsonObject>() {
                    @Override
                    public void handle(JsonObject event) {
                        String msg = event.getString("msg");
                        String senderId = event.getString("senderId");
                        String roomName = userRooms.get(senderId);
                        // roomnum 값 가져오기
                        String roomnum = event.getString("roomnum");
                        // 파일 이름에 roomnum 추가
                        String fileName = "D://chat//" + roomnum + ".txt";
                        
                        FileWriter writer = null;
                        try {
                        	writer = new FileWriter(fileName, true);
                            writer.write(msg+"\n");
                            writer.flush();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        io.sockets().in(roomName).emit("response", event);
                    }
                });
                socket.on("exitChat", new Handler<JsonObject>() {
                    @Override
                    public void handle(JsonObject event) {
                        String userId = event.getString("userId");
                        String roomnum = event.getString("roomnum");

                        io.sockets().in(roomnum).emit("chatClosed", new JsonObject().putString("message", "Chat closed by user."));

                        // 채팅방 상태 업데이트
                        service.endchat(Integer.parseInt(roomnum));
                    }
                });
            }
        });

        server.listen(7777);
    }

    private String createRoomForUser(String userId, String userType) {
        return "room_" + userId + "_" + userType;
    }

}


