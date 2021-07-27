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
	background-color: #fafafa;
}

#join_container {
	width: 100%;
	width: 1500px;
	margin: auto;
}

#join_head {
	text-align: center;
	font-size: 50px;
	line-height: 40px;
}

.join {
	margin: auto;
	padding: 20px;
}

.join_row {
	background-color: #fff;
	width: 800px;
	margin: auto;
	padding: 20px;
	border: 1px solid #ebeced;
	border-radius: 0.5em;
}

.join_row h3 {  
	width: 400px;
	margin: auto;
	padding: 4px;
}

.join_row p {
	width: 400px;
	margin: auto;
	padding: 3px;
}

.join_row input {
	width: 300px;
	height: 23px;
}

#join_btn {
	float: right;
	margin-right: 35%;
	margin-top: 20px;
}

#join_btn input {
	width: 400px;
	height: 40px;
	background-color: #32CD32;
	margin-bottom: 30px;
}

</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function pw_chk() {
		var pw = $("#pw").val();
		var re_pw = $("#re_pw").val();
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		
		// 비밀번호 유효성 검사
		if(pw.length < 6 || pw.length > 16){
			alert("비밀번호는 6자리 ~ 16자리 이내로 입력해주세요.");
			$("#pw").focus();
			return false;
		}else if(pw.search(/\s/) != -1){
			alert("비밀번호는 공백 없이 입력해주세요.");
			$("#pw").focus();
			return false;
		}else if(num < 0 || eng < 0){
			alert("영문, 숫자를 혼합하여 입력해주세요.");
			$("#pw").focus();
			return false;
		}
		
		if(pw != re_pw){
			$("#pw").val('');
			$("#re_pw").val('');
			$("#pw").focus();
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
	}
	
	function id_chk() {
		var id = $("#id").val();
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		
		//아이디 유효성 검사
		var id = $("#id").val();
		if(pw.length < 6 || pw.length > 16){
			alert("아이디는 4자리 ~ 12자리 이내로 입력해주세요.");
			$("#id").focus();
			return false;
		}else if(pw.search(/\s/) != -1){
			alert("비밀번호는 공백 없이 입력해주세요.");
			$("#id").focus();
			return false;
		}else if(num < 0 || eng < 0){
			alert("영문, 숫자를 혼합하여 입력해주세요.");
			$("#id").focus();
			return false;
		}
		
		if(!id_okchk){
			alert("아이디 중복확인을 해주세요");
			return false;
		}
	}
	
	function join_ok(f) {
		id_chk();
		pw_chk();
		f.action = "join_ok.do";
		f.submit();
	}
</script>
</head>
<body>
	<div id="join_container">
		<form method="post">
			<h1 id="join_head">회원가입</h1>
			<div class="join">
				<div class="join_row">
					<h3>아이디</h3>
					<p>
						<input type="text" id="id" name="id" placeholder="4~12자 영문 대/소문자, 숫자 조합" required>
						<button style="height: 23px;" id="id_chk">중복확인</button>
					</p>
				</div>
				<script type="text/javascript">
					// id 중복체크
					function id_okchk() {
						$("#id_chk").click(function() {
							if ($("#id").val() == "") {
								alert("아이디를 입력하세요.");
								$("#id").focus();
								return false;
							}
							$.ajax({
								url : "idchk.do",
								method : "post",
								data : "id=" + $("#id").val(),
								dataType : "text",
								success : function(data) {
									if (data == '1') {
										alert("중복된 아이디 입니다.");
										$("#id").val('');
										$("#id").focus();
									} else {
										alert("사용가능한 아이디 입니다.");
									}
									return true;
								},
								error : function() {
									alert("읽기실패");
								}
							});
							return false;
						});
					}
				</script>
				<div class="join_row">
					<h3>닉네임</h3>
					<p>
						<input type="text" name="nickname" placeholder="사용할 닉네임을 입력해주세요" required>
					</p>
				</div>
				<div class="join_row">
					<h3>비밀번호</h3>
					<p>
						<input type="password" id="pw" name="pw" placeholder="6~16자 영문 대/소문자, 숫자 조합" required>
					</p>
					<font id="pw_chk" size="1.5"></font>
					<p>
						<input type="password" id="re_pw" name="re_pw" placeholder="비밀번호를 재확인해주세요" required> 
						<font id="chkNotice" size="1.5"></font>
					</p>
				</div>
				<script type="text/javascript">
					$('#pw').keyup(function() {
						$('#chkNotice').html('');
					});
	
					// 비밀번호 재확인
					$('#re_pw').keyup(function() {
						if ($('#pw').val() != $('#re_pw').val()) {
							$('#chkNotice').html('비밀번호 불일치<br>');
							$('#chkNotice').attr('color', '#f82a2aa3');
						} else {
							$('#chkNotice').html('비밀번호 일치<br>');
							$('#chkNotice').attr('color', '#199894b3');
						}
	
					});
				</script>
				<div class="join_row">
					<h3>이름</h3>
					<p>
						<input type="text" name="name" placeholder="이름을 입력해주세요" required>
					</p>
				</div>
				<div class="join_row">
					<h3>이메일</h3>
					<p>
						<input type="text" id="email" name="email" placeholder="이메일 아이디를 입력해주세요" required> @ 
						<input type="text" id="email_domain" name="email_domain" placeholder="이메일 선택" style="margin-top: 10px;" required>
						<select class="select" style="height: 26px; margin-top: 5px;">
							<option value="etc">-직접입력-</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
						</select>
					</p>
				</div>
				<script type="text/javascript">
				// 이메일 도메인 선택
					$("select").change(function() {
						if ($(this).val() == "etc") { //직접입력일때
							$("#email_domain").val('');
							$("#email_domain").attr('readonly', false); //직접입력 가능하도록 readonly막기
						} else {
							$("#email_domain").val($(this).val());
							$("#email_domain").attr('readonly', true); //readonly로 직접입력 막기.
						}
					});
				</script>
				<div id="join_btn">
					<input type="submit" id="join_now" value="가입하기"	onclick="join_ok(this.form)">
				</div>
			</div>
		</form>
	</div>
</body>
</html>