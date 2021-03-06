<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	overflow-x: hidden;
}

#create_chatroom {
	position: absolute;
	top: 0 !important;
	left: 0 !important;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, .95);
	vertical-align: middle;
	align-items: center;
	justify-content: center;
	z-index: 9999;
}

#make {
	background-color: #F5F5F5;
	width: 450px;
	position: absolute;
	left: 40%;
	top: 30%;
	padding: 15px;
	border: 1px solid black;
	border-radius: 0.5em;
}

#make h2 {
	text-align: center;
	font-size: 35px;
	margin: 10px;
	padding-bottom: 5px;
}

#make p {
	font-size: 18px;
	font-weight: bold;
	margin: 5px auto;
}

#chat_make input[type="text"] {
	width: 440px;
	height: 18px;
}

#send{ margin-top: 15px; text-align: right;}

#send input{
	width: 80px;
	border-radius: 0.3em;  
	border: none;
	height: 25px;  
	background-color: lightgray; 
}

#send input:hover {
	background-color: black;
	color: white;
	text-decoration: underline;
}
</style> 
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function create(f) {
		f.action = "create_chatroom_ok.do";
		f.submit();
	}
	
	function cancle(f) {
		f.action = "main.do";
		f.submit();
	}
</script>
</head>
<body>
	<%@ include file="main.jsp"%>
	<div id="create_chatroom">
		<form method="post" enctype="multipart/form-data" >
			<div id="make">
				<h2>채팅방 개설</h2>
				<div id="chat_make">
					<p>채팅방 이름</p>
					<input type="text" name="room_name">
					<p>채팅방 로고</p>
					<input type="file" name="r_logo">
				</div>
				<div id="send">
					<input type="button" value="만들기" onclick="create(this.form)">
					<input type="button" value="취소" onclick="cancle(this.form)">
				</div>
			</div>
		</form>
	</div>
</body>
</html>