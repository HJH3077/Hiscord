<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Lato&display=swap');

body {
	margin: 0;
	padding: 0;
	background: #fafafa;
}

#chat_container {
	display: flex;
	width: 100%;
	max-height: 100%;
}

#chat_place {
	background: #fff;
	border-left: 1px solid #ebeced;
	border-right: 1px solid #ebeced;
	margin-left: 50px;
	width: 1000px;
	min-width: 1000px;
}

#chat_header {
	font-size: 15px;
	padding: 13px 0;
	background-color: #fff;
	color: black;
	text-align: center;
	border-bottom: 1px solid #ebeced;
	font-family: 'Lato', sans-serif;
	font-weight: bold;
	line-height: 2em;
	height: 32px;
}

#chat_container #chat_box {
	position: sticky;
	padding: 0 22px;
	background-color: #fff;
	box-sizing: border-box;
	height: 85%;
}

#chatting {
	height: 85vh;
	overflow: scroll;
	display: flex;
	flex-direction: column-reverse;
	flex: 1 1;
}

#chat_input {
	margin-top: 20px;
}

#chat_input textarea {
	width: 1000px;
	height: 45px;
	box-sizing: border-box;
	border-radius: 0.4em;
	font-size: 18px;
	border-radius: 0.4em;
}

#chat_user {
	background-color: #fff;
	margin-left: 10px;
	width: 200px;
	max-height: 100%;
	height: 100vh;
	overflow: hidden auto;
}

#list_title {
	text-align: center;
	height: 42px;
	border-bottom: 1px solid #f1f3f5;
	font-size: 15px;
	font-family: 'Lato', sans-serif;
	font-weight: bold;
}

.user_list {
	padding: auto;
	height: 80px;
	border-bottom: 1px solid #f1f3f5;
	font-size: 20px;
}

.user_list .rooms {
	padding: 13px;
	margin-top: 7px;
}

.chat_content {
	display: flex;
	height: auto;
}

.chat_content .ch_avatar {
	text-align: center;
}

.chat_content .ch_avatar img {
	width: 3.5em;
	height: 3.5em;
	border-radius: 1.75em;
}

.chat_content .comment p {
	padding: 0;
	margin: auto;
	margin-left: 15px;
}
</style>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

</head>
<body>
	<div id="one">
		별명:<input type="text" id="nickname" /> <input type="button"
			id="enter" value="입장" />
	</div>
	<div id="two" style="display: none">
		<input type="button" id="exit" value="퇴장" /><br />
		<div id="chatarea"
			style="width: 400px; height: 600px; border: 1px solid;"></div>
		<input type="text" id="message" /> <input type="button" id="send"
			value="보내기" />
	</div>
</body>
<script type="text/javascript">
	one = document.getElementById("one");
	two = document.getElementById("two");
	document.getElementById("enter").addEventListener("click", function() {
		//웹 소켓 연결해주는 함수 호출
		connect();
	});
	document.getElementById("exit").addEventListener("click", function() {
		//연결을 해제해주는 함수 호출
		disconnect();
	});
	document.getElementById("send").addEventListener("click", function() {
		//연결을 해제해주는 함수 호출
		send();
	});
	var websocket;
	//입장 버튼을 눌렀을 때 호출되는 함수
	function connect() {
		websocket = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/websocket/echo.do");
		//웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
		websocket.onopen = onOpen;
		websocket.onmessage = onMessage;
		websocket.onclose = onClose;
	}
	//퇴장 버튼을 눌렀을 때 호출되는 함수
	function disconnect() {
		msg = document.getElementById("nickname").value;
		websocket.send(msg + "님이 퇴장하셨습니다");
		websocket.close();
	}
	//보내기 버튼을 눌렀을 때 호출될 함수
	function send() {
		nickname = document.getElementById("nickname").value;
		msg = document.getElementById("message").value;
		websocket.send(nickname + ":" + msg);
		document.getElementById("message").value = "";
	}
	//웹 소켓에 연결되었을 때 호출될 함수
	function onOpen() {
		nickname = document.getElementById("nickname").value;
		two = document.getElementById("two");
		two.style.display = 'block';
		websocket.send(nickname + "님 입장하셨습니다.");
	}
	//웹 소켓에서 연결이 해제 되었을 때 호출될 함수
	function onMessage(evt) {
		data = evt.data;
		chatarea = document.getElementById("chatarea");
		chatarea.innerHTML = data + "<br/>" + chatarea.innerHTML
	}
	function onClose() {
	}
</script>
</html>

