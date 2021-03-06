<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	text-decoration: none;
}

body {
	margin: 0;
	padding: 0;
	background: #fafafa;
	box-sizing: border-box;
	width: 100%;
	overflow: auto;
}

#login_container{
	margin-left: 70px;
	width: 1200px;
	min-width: 1200px;
	height: 100vh;
	background-color: #fff;
	border-left: 1px solid #ebeced;
	border-right: 1px solid #ebeced;
}

#login_title {
	text-align: center;
	font-size: 70px;
	line-height: 50px;
	margin-top: 10%;
}

#login_title a:active, a:visited {
	color: black;
}

#login {
	width: 960px;  
	text-align: center;
	margin: auto;
	padding: 25px;
	font-size: 20px;
}

#login input {
	padding: 8px;
	margin-top: 40px;
}

.log input{
	width: 450px;
}

.log_go input{
	width: 200px;
	height: 40px;
	background-color: #ebeced;
	border: 1px solid silver;
}

.find{
	margin-top: 20px;
}

* a:link, a:visited {
	color: black;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function login_ok(f) {
		if(f.id.value=="" || f.pw.value==""){
			alert("아이디/패스워드를 입력하세요");
			f.id.value="";
			f.pw.value="";
			f.id.focus();
			return;
		}
		f.action="login_ok.do";
		f.submit();
	}
</script>
</head>
<body>
	<%@ include file="head.jsp"%>
	<div id="login_container">  
		<h1 id="login_title">
			<a href="main.do"><img src="resources/images/logo.png" width="350" height="130"></a>
		</h1>
		<form method="post">
			<div id="login">
				<fieldset>
					<legend>Login</legend>
					<div class="log">
						ID <input type="text" name="id" required>
					</div>
					<div class="log">
						PW <input type="password" name="pw" required>
					</div>
					<div class="log_go">
						<input type="submit" value="로그인" onclick="login_ok(this.form)">
					</div>
				</fieldset>
				<div class="find">
					<a href="id_find.do">아이디 찾기</a>
					<span>|</span>
					<a href="pw_find.do">비밀번호 찾기</a>
					<span>|</span>
					<a href="join.do">회원가입</a>
				</div>
			</div>
			<input type="hidden" value="1" name="cPage">
		</form>
	</div>
</body>
</html>