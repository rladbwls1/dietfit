package test.spring.mvc.controller;

import java.io.FileWriter;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.vertx.java.core.Handler;
import org.vertx.java.core.Vertx;
import org.vertx.java.core.http.HttpServer;
import org.vertx.java.core.http.RouteMatcher;
import org.vertx.java.core.json.JsonObject;
import com.nhncorp.mods.socket.io.SocketIOServer;
import com.nhncorp.mods.socket.io.SocketIOSocket;
import com.nhncorp.mods.socket.io.impl.DefaultSocketIOServer;
import com.nhncorp.mods.socket.io.spring.DefaultEmbeddableVerticle;

public class SellerChat extends DefaultEmbeddableVerticle {

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

                        FileWriter writer = null;
                        try {
                            writer = new FileWriter("D://chat//" + roomName + ".txt", true);
                            writer.write(msg);
                            writer.flush();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        io.sockets().in(roomName).emit("response", event);
                    }
                });
            }
        });

        server.listen(7777);
    }

    private String createRoomForUser(String userId, String userType) {
        return "room_" + userId + "_" + userType;
    }

    // 사용자가 문의를 종료했을 때 호출되는 메서드
    public void closeChat(String userId) {
        String roomName = userRooms.get(userId);
        io.sockets().in(roomName).emit("chatClosed", new JsonObject().putString("message", "Chat closed by user."));
        // TODO: 여기에서 필요한 추가 로직 수행
    }
}


