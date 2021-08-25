package com.ict.server;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class SocketHandler extends TextWebSocketHandler {
	HashMap<String, WebSocketSession> sessionMap = new HashMap<String, WebSocketSession>(); // 웹소켓 세션을 담아둘 맵
	public static List<String> sessionList = new ArrayList<String>();
	public static int signal;
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) {
		// 메시지 발송
		String msg = message.getPayload();
		for (String key : sessionMap.keySet()) {
			WebSocketSession wss = sessionMap.get(key);
			try {
				wss.sendMessage(new TextMessage(msg));
				System.out.println(msg);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 소켓 연결
		super.afterConnectionEstablished(session);
		Map<String,Object> map = new HashMap<String, Object>();
		map = session.getAttributes();
		String nickname = (String)map.get("login_nickname");
		sessionList.add(nickname);
		sessionMap.put(session.getId(), session);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 소켓 종료
		super.afterConnectionClosed(session, status);
		Map<String,Object> map = new HashMap<String, Object>();
		map = session.getAttributes();
		String nickname = (String)map.get("login_nickname");
		sessionList.remove(nickname);
		sessionMap.remove(session.getId());
	}
}
