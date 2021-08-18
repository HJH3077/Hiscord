<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	margin: 0;
	padding: 0;
	background: #fafafa;
	overflow: auto;
}

#Wrap{
	margin-left: 70px;
	width: 1200px;
	background-color: #fff;
	height: 100vh;
	border-left: 1px solid #ddd;
	border-right: 1px solid #ddd;
}

#container{
	width: 750px;
	margin: 0 auto;
	padding: 25px;
	height: 93%;
}

#container #nav-header{
	text-align: left;
	padding: 5px 5px 5px 15px;
	color: #00FFFF;     
	border-left: 3px solid #00FFFF;
	margin-bottom: 20px;
}

#outBtn{
	float: right;
	font-size: 18px;  
	margin-top: 5px;
}

#contentCover{ height: 90%;}

#chatWrap {
    width: 750px;
    height: 97%;
}

#chatLog {
	border: 1px solid #ddd;
    overflow: auto;
    padding: 10px;
    height: 87%;
}

#chatLog span {	color: #fff;}

#myChat{ text-align: right;}

#yourChat{
	text-align: left;
	margin-bottom: 5px;
}

.msg {
    display: inline-block;
    border-radius: 15px;
    padding: 7px 15px;
    margin-bottom: 10px;
    margin-top: 5px;
    text-align: left;
}

#yourChat > .msg {
    background-color: #f1f0f0;
    color: #000;
}

#myChat > .msg {
    background-color: #00BFFF;
    color: #fff;
}

#chat_input {
    display: block;
    width: 748px;
    height: 50px;
    border: 1px solid #ddd;
}

#chatting {
    width: 85%;
    height: calc(100% - 1px);
    border: none;     
    font-size: 20px;
    padding-bottom: 0;
}

#chatting:focus {
    outline: none;
}

#chat_input button {
    border: none;
    height: 50px;
    background: none;
    color: #0084FF;
    font-size: 17px;
}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	var ws;

	function wsOpen() {
		ws = new WebSocket("ws://" + location.host + "/echo.do");
		wsEvt();
	}

	function wsEvt() {
		ws.onopen = function(data) {
			var id = "${id}";
			$("#chatLog").append(id + "님이 입장하셨습니다.").css('text-align', 'center');
		}

		ws.onmessage = function(data) {
			var msg = data.data;
			var m = msg.split(":"); 
			var m0 = m[0];
			var m1 = m[1];
			if (msg != null && msg.trim() != '') {
				if(m0.trim() == "${id}"){
					$("#chatLog").append("<div id='myChat'><span class='msg'>" + msg + "</span></div>")
				} else {
					$("#chatLog").append("<div id='yourChat'><span class='msg'>" + msg + "</span></div>")
				}
			}
			$("#chatLog").scrollTop($("#chatLog")[0].scrollHeight - $("#chatLog")[0].clientHeight);
		}

		document.addEventListener("keypress", function(e) {
			if (e.keyCode == 13) { //enter press
				send();
			}
		});
	}

	$(document).ready(function() {
		wsOpen();
	});

	function send() {
		var id = "${id}";
		var msg = $("#chatting").val();
		ws.send(id + " : " + msg);
		$('#chatting').val("");
	}
</script>
<body>
<%@ include file="head.jsp"%>
<div id="Wrap">
	<div id="container">
	    <nav>
	        <div id="outBtn">나가기</div>
			<h1 id="nav-header">
	            공용 채팅방
	        </h1>
	    </nav>
	    <div id="contentCover">
	        <div id="chatWrap">
	            <div id="chatLog">
	                <div id="yourChat"></div>
	                <div id="myChat"></div>
	            </div>
		        <div id="chat_input">
		        	<input type="text" size="30" id="chatting" placeholder="메시지를 입력하세요">
		            <button onclick="send()">보내기</button>
		        </div>
	        </div> 
	        <!-- <div id="memberWrap">
	            <div id="memberList">
	                <div id="memberHeader">사람</div>
	                <div id="memberSelect"></div>
	            </div>
	        </div> -->
	    </div>
	</div>
</div>
</body>
</html>
