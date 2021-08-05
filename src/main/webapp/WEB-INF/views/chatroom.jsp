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
.chat_content .ch_avatar{
    text-align: center;
}
.chat_content .ch_avatar img{
    width: 3.5em;
    height: 3.5em;
    border-radius: 1.75em;
}

.chat_content .comment p{
	padding: 0;
	margin: auto;
	margin-left: 15px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<%@ include file="head.jsp"%>
	<div id="chat_container">
		<div id="chat_place">
			<div id="chat_header">공용채팅방</div>
			<div id="chat_box">
				<div id="chatting">
					<div class="chat_content">
						<div class="ch_avatar">
							<img alt="디스코드" src="../images/discord.png" style="width: 55px;">
						</div>
						<div class="comment">
							<p style="font-size: 20px;">홍길동</p>
							<p style="margin-top: 5px;">안녕하세요1234</p>
						</div>
					</div>
				</div>
			</div>
			<div id="chat_input">
				<textarea placeholder="채팅을 입력하세요."></textarea>
				<button>전송</button>
			</div>
		</div>
		<!-- <div id="chat_user">
			<div id="list_title">
				<p>참가자 목록</p>
			</div>
			<div class="user_list">
				<div class="rooms">
					<img alt="디스코드" src="resources/images/discord.png" style="width: 40px;">
					<span style="margin-left: 10px;"> 유저1</span>

				</div>
			</div>
			<div class="user_list">
				<div class="rooms">
					<img alt="디스코드" src="resources/images/discord.png" style="width: 40px;">
					<span style="margin-left: 10px;"> 유저2</span>
				</div>
			</div>
		</div> -->
	</div>
</body>
</html>