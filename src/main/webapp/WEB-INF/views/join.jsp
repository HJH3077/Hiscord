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
<script type="text/javascript">
	function id_check() {
	     var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
	    
	      // id 유효성 검사
	      if(!getCheck.test($("#id").val())){
	        alert("id를 형식에 맞게 입력해주세요");
	        $("#id").val("");
	        $("#id").focus();
	        return false;
	      }
	      return true;
	}
	
	function check() {
	     var getCheck= RegExp(/^[a-zA-Z0-9]{6,16}$/);
	     var getName= RegExp(/^[가-힣]+$/);
	     var getNickname= RegExp(/^[a-zA-Z0-9가-힣]{2,8}$/);
	     // 비밀번호 유효성 검사
	     if(!getCheck.test($("#pw").val())) {
		     alert("pw를 형식에 맞게 입력해주세요");
		     $("#pw").val("");
		     $("#re_pw").val("");
		     $("#pw").focus();
		     return false;
	     }
	 
	     // 비밀번호와 비밀번호 재확인이 일치하는지
	     if($("#pw").val() != ($("#re_pw").val())){ 
		     alert("비밀번호와 비밀번호 재확인이 일치하지 않습니다.");
		     $("#pw").val("");
		     $("#re_pw").val("");
		     $("#pw").focus();
		     return false;
	     }
	     
	   	// 닉네임 공백 확인
	    if($("#nickname").val() == ""){
		    alert("닉네임을 입력해주세요");
		    $("#nickname").focus();
		    return false;
	    }
	   	
	  	// 닉네임 유효성 검사
	    if (!getNickname.test($("#nickname").val())) {
	    	alert("닉네임은 2~8글자로 써주세요");
	        $("#nickname").val("");
	        $("#nickname").focus();
	        return false;
	    }
	   	
	   	// 이름 공백 확인
	    if($("#name").val() == ""){
		    alert("이름을 입력해주세요");
		    $("#name").focus();
		    return false;
	    }
	   	
	  	// 이름 유효성 검사
	    if (!getName.test($("#name").val())) {
	    	alert("이름을 제대로 써주세요");
	        $("#name").val("");
	        $("#name").focus();
	        return false;
	    }
	   	
	   	// 이메일 공백 확인
	    if($("#email").val() == ""){
		    alert("이메일을 입력해주세요");
		    $("#email").focus();
		    return false;
	    }
	   	// 이메일도메인 공백 확인
	    if($("#email_domain").val() == ""){
		    alert("이메일 도메인을 입력/선택해주세요");
		    $("#email_domain").focus();
		    return false;
	    }
	    return true;
	}

	function join_ok(f) {
		if(check()){
			f.action = "join_ok.do";
			f.submit();
		}
	}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
   $(function() {
	 	//id 중복체크
		$("#id_chk").click(function() {
			if ($("#id").val() == "") {
				alert("아이디를 입력해주세요."); 
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
						if(id_check()){
							alert("사용가능한 아이디 입니다.");
						}
					}
				},
				error : function() {
					alert("읽기실패");
				}
			});
			return false;
		});
	 	
		// 비밀번호 재확인
		$('#pw').keyup(function() {
			$('#chkNotice').html('');
		});
		$('#re_pw').keyup(function() {
			if ($('#pw').val() != $('#re_pw').val()) {
				$('#chkNotice').html('비밀번호 불일치<br>');
				$('#chkNotice').attr('color', '#f82a2aa3');
			} else {
				$('#chkNotice').html('비밀번호 일치<br>');
				$('#chkNotice').attr('color', '#199894b3');
			}

		});
		
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
   });
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
				<div class="join_row">
					<h3>닉네임</h3>
					<p>
						<input type="text" id="nickname" name="nickname" placeholder="사용할 닉네임을 입력해주세요(2~6자)" required>
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
				<div class="join_row">
					<h3>이름</h3>
					<p>
						<input type="text" id="name" name="name" placeholder="이름을 입력해주세요" required>
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
				<div id="join_btn">
					<input type="submit" id="join_now" value="가입하기"	onclick="join_ok(this.form)">
				</div>
			</div>
		</form>
	</div>
</body>
</html>