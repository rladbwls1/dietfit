package test.spring.mvc.controller;
import java.io.FileWriter;
import java.util.logging.Handler;

import org.vertx.java.core.Vertx;
import org.vertx.java.core.http.HttpServer;
import org.vertx.java.core.json.JsonObject;

import com.nhncorp.mods.socket.io.SocketIOServer;
import com.nhncorp.mods.socket.io.SocketIOSocket;
import com.nhncorp.mods.socket.io.impl.DefaultSocketIOServer;
import com.nhncorp.mods.socket.io.spring.DefaultEmbeddableVerticle;

public class SellerChat extends DefaultEmbeddableVerticle{

	private SocketIOServer io = null;
	
	@Override
	public void start(Vertx arg0) {
		HttpServer server = arg0.createHttpServer(); //서버생성
		io = new DefaultSocketIOServer(arg0, server);
		io.sockets().onConnection(new Handler<SocketIOSocket>() {
			@Override
			public void handle(SocketIOSocket socket) {
				socket.on("chatMsg", new Handler<JsonObject>() {
					public void handle(JsonObject event) {
						String msg = event.getString("msg");  //받은 대화 내용
						
						String id = msg.split("-")[0];
								
						FileWriter writer = null;
						
						try {
							writer = new FileWriter("D://chat//"+id+".txt",true); //디폴트는 flase  true는 이어서 쓸수있음
							writer.write(msg);
							writer.flush();
						}catch(Exception e) {
							e.printStackTrace();
						}
								
						//연결된 모든 사용자에게 대화 보내기
						io.sockets().emit("response",event);
					}
				});
			}
		});
		server.listen(7777);
	}
}