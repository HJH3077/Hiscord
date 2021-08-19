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

#make input {
	width: 440px;
	height: 25px;
}

#make button{
	margin-top: 10px;
	margin-right: 2px;
	float: right; 
	width: 70px;
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
	}
</script>
</head>
<body>
	<%@ include file="main.jsp"%>
	<div id="create_chatroom">
		<form method="post" enctype="multipart/form-data" >
			<div id="make">
				<h2>채팅방 개설</h2>
				<p>채팅방 이름</p>
				<input type="text" name="room_name">
				<p>채팅방 이미지</p>
				<input type="file" name="r_logo">
				<button class="create" onclick="cancle(this.form)">취소</button>
				<button class="create" onclick="create(this.form)">만들기</button>
			</div>
		</form>
	</div>
</body>
</html>