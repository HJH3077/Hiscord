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

#info_update {
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

#profile {
	background-color: #F5F5F5;
	width: 450px;
	position: absolute;
	left: 40%;
	top: 20%;
	border: 1px solid black;
	border-radius: 0.5em;
	padding: 0 15px;
}

#profile_update>img {
	width: 400px;
	height: 40px;
}

#p_avatar img {
	width: 60px;
	height: 60px;
	border-radius: 30px;
}

#p_nickname input {
	width: 150px;
	height: 18px;
}

#p_email input {
	width: 400px;
	height: 20px;
	margin: 4px auto;
}

#adjust, #cancle {
	cursor: pointer;
	border-radius: 0.3rem;
	border: none;
	padding: 0.7em 1.5em 0.7em;
	line-height: 1em;
	font-style: normal;
	text-align: center;
	background-color: #f2711c;
	color: #fff;
	float: right;
	margin: 20px 5px;
	border-radius: 0.3rem;
	border: none;
	padding: 0.7em 1.5em 0.7em;
	line-height: 1em;
	font-style: normal;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function check() {
		var getCheck = RegExp(/^[a-zA-Z0-9]{6,16}$/);
		var getName = RegExp(/^[가-힣]+$/);
		var getNickname = RegExp(/^[a-zA-Z0-9가-힣]{2,8}$/);
		// 닉네임 공백 확인
		if ($("#nickname").val() == "") {
			alert("닉네임을 입력해주세요");
			$("#nickname").focus();
			return false;
		}

		// 닉네임 유효성 검사
		if (!getNickname.test($("#next_nickname").val())) {
			alert("닉네임은 2~8글자로 써주세요");
			$("#next_nickname").val("");
			$("#next_nickname").focus();
			return false;
		}

		// 이메일 공백 확인
		if ($("#next_email").val() == "") {
			alert("이메일을 입력해주세요");
			$("#next_email").focus();
			return false;
		}
		return true;
	}

	function cancle_go(f) {
		f.action = "setting.do";
	}

	function adjust_go(f) {
		if (check()) {
			f.action = "adjust.do";
			f.submit();
		}
	}
</script>
</head>
<body>
	<%@ include file="main.jsp"%>
	<div id="info_update">
		<form method="post">
			<div id="profile">
				<div id="profile_update">
					<div id="p_avatar">
						<h4>프로필 수정</h4>
						<img alt="avatar" src="resources/images/discord.png" /> <input
							type="file" name="file_name" id="img_change"
							style="margin-left: 15px;">
					</div>
					<div id="p_nickname">
						<h4>닉네임 수정</h4>
						<p>
							&nbsp;&nbsp;현재 닉네임 &nbsp;: <input type="text" name="before_name"
								value="${nickname}" readonly style="background-color: #02E7FC;">
						</p>
						<p>
							변경할 닉네임 : <input type="text" name="next_nickname"
								id="next_nickname" value="${nickname}">
						</p>
					</div>
					<div id="p_email">
						<h4>이메일 수정</h4>
						<p style="font-size: 7px; margin: 0;">현재 이메일</p>
						<input type="text" name="before_email" value="${email}" readonly
							style="background-color: #02E7FC;">
						<p style="font-size: 7px; margin: 0;">변경할 이메일</p>
						<input type="text" name="next_email" id="next_email"
							value="${email}">
					</div>
					<button id="cancle" onclick="cancle_go(this.form)">취소</button>
					<button id="adjust" onclick="adjust_go(this.form)">적용</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>