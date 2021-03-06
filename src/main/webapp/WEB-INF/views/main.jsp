
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
	background: #fafafa;
	overflow: auto;
}

.main_container {
	margin-left: 70px;
	width: 1200px;
	background-color: #fff;
	min-width: 1200px;
	height: 100vh;
	border-left: 1px solid #ebeced;
	border-right: 1px solid #ebeced;
}
.main_container .main_intro {
	text-align: center;
	font-size: 18px;
	height: 150px;
	padding: auto;
	border-bottom: 1px solid #fafafa;
}
.main_container .main_content {
	padding-left: 45px;
	padding-top: 20px;
	text-align: center;
}

* a:link, a:visited {
	color: black;
}
</style>
</head>
<body>
	<%@ include file="head.jsp"%>
	<div class="main_container">
		<div class="main_intro">
			<h1>이런 장소가 있다면 어떨까요?</h1>
			<h4>
				학교 , 게임 그룹, 세계 예술 감상 커뮤니티에 소속되어 서로와 공감하며 유대감을 느낄 수 있는 장소.<br>
				친한 친구들과 어울릴 수 있는 우리들의 공간. 간편하게, 매일 웃고 떠들고 이야기할 수 있는 그런 공간 말이에요.
			</h4>
		</div>
		<div class="main_content">
			<img src="resources/images/main.gif" style="height: 550px; width: 90%">   
		</div>
	</div>
</body>
</html>