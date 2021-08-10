<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 수정</title>
<style type="text/css">
body {
	padding: 0;
	margin: 0;
}

a{text-decoration: none;}

#onelist {
	width: 1500px;
	background-color: #fff;
	margin: auto;
}

#admin_head {
	border-bottom: 1px solid #f1f3f5;
	box-sizing: border-box;
	width: 1500px;
}

#admin_logo {
	text-align: center;
	color: black;
	font-weight: bold;
	font-size: 45px;
	padding: 10px;
	margin: auto; 
}

#logout{
	color: black;
	background-color: #fff;
	font-size: 15px; 
	border-radius: 0.5em;
	margin-left: 83%; 
}

#nav { 
	box-sizing: border-box;
	background-color: #fff;
	width: 1200px;  
	padding: 20px;
	display: flex;
	margin: auto;
}

#nav .nav_bar a:link { color: white; text-decoration: none;}
#nav .nav_bar a:visited { color: white; text-decoration: none;}
#nav .nav_bar a:hover { color: red; text-decoration: underline;}

#nav .nav_bar {
	border: 1px solid black;
	text-align: center;
	width: 650px;
	background-color: #9370DB;
	line-height: 1.5;
}

#onelist #onelist_logo {
	text-align: center;
	padding: 3px;
}

#onelist_info {
	border: 1px solid black;
	border-radius: 0.4em;
	margin: 50px auto;
	width: 800px;
}

table {
	border-collapse: collapse;
	text-align: center;
	margin: auto;
}

th {
	padding: 18px;
	margin: auto;
	font-size: 26px;
	text-align: right;
	width: 20%;
}

td input {
	width: 460px;
	height: 27px;
	margin-left: 7px;
}

#onelist_button {
	text-align: center;
	margin: 15px;
}

#onelist_button input {
	width: 80px;
	height: 25px;
	background-color: #9370DB;
	color: white;
	border-radius: 0.5em;
}
</style>
<script type="text/javascript">
	function update_go(f) {
		f.action = "user_update.do";
		f.submit();
	}
</script>
</head>
<body>
	<div id="onelist">
		<div id="admin_head">
			<h1 id="admin_logo">회원정보 관리</h1>
			<button id="logout">로그아웃</button> 
			<div id="nav">
				<div class="nav_bar">
					<a href="user_mng.do?cPage=${cPage}">회원정보 관리</a>
				</div>
				<div class="nav_bar">
					<a href="prohibited_word.do?pPage=${1}">금지어 관리</a>
				</div>
			</div>
		</div>
		<div id="onelist_info">
			<h2 id="onelist_logo">회원정보 - 상세</h2>
			<form method="post" id="onelist_table">
				<table>
					<tbody>
						<tr>
							<th>이름 :</th>
							<td align="left"><input type="text" value="${mvo.name}" readonly></td>
						</tr>
						<tr>
							<th>ID :</th>
							<td align="left"><input type="text" name="id" value="${mvo.id}" readonly></td>
						</tr>
						<tr>
							<th>닉네임 :</th>
							<td align="left"><input type="text" name="nickname" value="${mvo.nickname}"></td>
						</tr>
						<tr>
							<th>이메일 :</th>
							<td align="left"><input type="text" name="email" value="${mvo.email}"></td>
						</tr>
						<tr>
							<th>가입일 :</th>
							<td align="left"><input type="text" value="${mvo.reg.substring(0,10)}" readonly></td>
						</tr>
					</tbody>
				</table>
				<div id="onelist_button">
					<input type="button" value="수정" onclick="update_go(this.form)" />
					<input type="button" value="취소" onclick="history.go(-1)" /> 
				</div>
			</form>
		</div>
	</div>
</body>
</html>