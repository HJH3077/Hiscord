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

#invite_chatroom {
	position: absolute;
	top: 0 !important;
	left: 0 !important;
	width: 100%;
	height: 100%;
	background-color: rgba(255, 255, 255, 0.5);
	vertical-align: middle;
	align-items: center;
	justify-content: center;
	z-index: 9999;
}

#invite_user {
	background-color: #F5F5F5;
	width: 450px;
	position: absolute;
	left: 40%;
	top: 30%;
	padding: 15px;
	border: 1px solid black;
	border-radius: 0.5em;
}

#invite_user h2 {
	text-align: center;
	font-size: 31px;
	margin: 10px;
	padding-bottom: 5px;
}

#invite_user input[type="text"] {
	width: 440px;
	height: 20px;
}

#invite{ margin-top: 15px; text-align: right;}

#invite input{
	width: 80px;
	border-radius: 0.3em;  
	border: none;
	height: 25px;  
	background-color: lightgray; 
}

#invite input:hover {
	background-color: black;
	color: white;
	text-decoration: underline;
}
</style> 
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function invite(f) {
		f.action = "invite_ok.do";
		f.submit();
	}
	
	function cancle(f) {
		f.action = "personal_chat.do";
		f.submit();
	}
</script>
</head>
<body>
	<%@ include file="chatroom.jsp"%>
	<div id="invite_chatroom">
		<form method="post">
			<div id="invite_user">
				<h2>초대하기</h2>
				<input type="text" name="invited_user" placeholder="초대할 유저의 닉네임을 입력해주세요">
				<div id="invite">
					<input type="button" value="초대하기" onclick="invite(this.form)">
					<input type="button" value="취소" onclick="cancle(this.form)">
				</div>
			</div>
		</form>
	</div>
</body>
</html>