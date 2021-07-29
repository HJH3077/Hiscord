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

#suggestion {
	position: absolute;
	top: 0 !important;
	left: 0 !important;
	width: 100%;
	height: 100%;
	text-align: center;
	vertical-align: middle;
	background-color: rgba(0, 0, 0, .95);
	align-items: center;
	justify-content: center;
	z-index: 9999;
}

#sg_box {
	background-color: white;
	width: 460px;
	position: absolute;
	left: 40%;
	top: 30%;
	padding: 10px;
	border-radius: 0.5em;
}

#sg_box legend h3  {
	font-size: 25px;
	margin: 10px;
}

#sg_box #msg_send{
	margin-top: 5px;
	width: 80px;
	font-size: 15px;
	line-height: 1.3;
}

#sg_box #msg_cancle{
	margin-top: 5px;
	width: 80px;
	font-size: 15px;
	line-height: 1.3;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function suggestion_go(f) {
		if(check()){
			f.action = "suggestion_ok.do";
			f.submit();
		}
	}
	
	function check() {
		if($("#content").val() == "") {
		     alert("건의사항을 입력해주세요");
		     $("#content").focus();
		     return false;
	     }
		return true;
	}
</script>
</head>
<body>
	<%@ include file="login_main.jsp"%>
	<div id="suggestion">
		<form method="post">
			<div id="sg_box">
				<fieldset style="border-radius: 0.3em;">
					<legend><h3>건의사항을 알려주세요!</h3></legend>
					<div>
						<textarea id="content" name="content" rows="15" cols="55"></textarea>
					</div>
					<div>
						<input type="submit" id="msg_send" value="보내기" onclick="suggestion_go(this.form)">
					</div>
				</fieldset>
			</div>
		</form>
	</div>
</body>
</html>