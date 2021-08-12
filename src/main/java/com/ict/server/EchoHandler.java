package com.ict.server;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class EchoHandler extends TextWebSocketHandler{
    
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	// 클라이언트가 서버로 메세지 전송 처리
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		TextMessage msg = new TextMessage(message.getPayload());
		for (WebSocketSession temp : sessionList) {
			temp.sendMessage(msg);
		}
	}
}

