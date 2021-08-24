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
	overflow: hidden;
}

#Wrap{
	margin-left: 70px;
	width: 1200px;  
	background-color: #fff;
	height: 100vh;
	border-left: 1px solid #ddd;
	border-right: 1px solid #ddd;
	display: flex;
}

#container{
	width: 750px;
	margin-left: 10%;
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

#outBtn:hover{ background-color: #00FFFF; text-decoration: underline; color: white;}

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
    border-radius: 5px;
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
    border-radius: 5px;
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

#memberWrap{
    width: 150px;
    margin-top: 105px;
    height: 80%;
}

#memberList {
    border: 1px solid #ddd;
    border-radius: 5px;
    height: 100%;   
    overflow: auto; 
}

#memberHeader {
    height: 30px;
    font-size: 18px;
    border-bottom: 1px solid #f0f0f0;
    font-weight: 600;
    text-align: center;
}

.memberSelect{
	border-bottom: 1px solid #f0f0f0;
    padding: 12px 20px;
    font-size: 15px;
    text-align: center;
    overflow: auto;
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
			var nickname = "${nickname}";
			ws.send("a" + " : " + nickname);
		}	
		
		ws.onmessage = function(data) {
			var msg = data.data;
			var m = msg.split(":"); 
			var m0 = m[0];
			var m1 = m[1];
			if(m0.trim() == "a"){
				$("#chatLog").append("<p>" + m1 + "님이 입장하셨습니다." + "</p>").css('text-align', 'center');
			} else if(m0.trim() == "z"){
				$("#chatLog").append("<p>" + m1 + "님이 퇴장하셨습니다." + "</p>").css('text-align', 'center');
			} else{
				if (msg != null && msg.trim() != '') {
					if(m0.trim() == "${nickname}"){
						$("#chatLog").append("<div id='myChat'><span class='msg'>" + msg + "</span></div>")
					} else {
						$("#chatLog").append("<div id='yourChat'><span class='msg'>" + msg + "</span></div>")
					}
				}
				$("#chatLog").scrollTop($("#chatLog")[0].scrollHeight - $("#chatLog")[0].clientHeight);
			}
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
	
	$(document).ready(function() {
		var font = "${font}";
		console.log(font);
		if (font == "mini") {  
			$("#chatLog").css("font-size", "8px");
		} else if (font == "small") {
			$("#chatLog").css("font-size", "12px");
		} else if (font == "middle") {
			$("#chatLog").css("font-size", "16px");
		} else if (font == "large") {
			$("#chatLog").css("font-size", "25px");
		} else if (font == "big") {
			$("#chatLog").css("font-size", "40px");
		}
	});
	
	function exit() {
		var nickname = "${nickname}";
		ws.send("z" + " : " + nickname);
		ws.close();
		location.href = 'main.do';
	}
	
	function send() {
		var nickname = "${nickname}";
		var msg = $("#chatting").val();
		$.ajax({
			url : "chat_check.do",
			method : "post",
			dataType : "json",
			success : function(data) {
				$.each(data, function() {
					msg = msg.replaceAll(this["word"], "**");
				});
				ws.send(nickname + " : " + msg);
				$('#chatting').val("");
			},
			error : function() { alert("읽기실패");	}
		});
	}
</script>
<body>
	<%@ include file="head.jsp"%>
	<div id="Wrap">
		<div id="container">
		    <nav>
		        <div id="outBtn" onclick="exit()">나가기</div>
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
		    </div>
		</div>
		<div id="memberWrap">
			<div id="memberList">
				<div id="memberHeader">참가자</div>
			</div>
		</div>
	</div>
</body>
</html>
