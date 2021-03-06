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

#nav{display: flex;}   

#Wrap{
	margin-left: 70px;
	width: 1200px;  
	min-width: 1200px;
	background-color: #fff;
	height: 100vh;
	border-left: 1px solid #ddd;
	border-right: 1px solid #ddd;
	display: flex;
}

#container{
	width: 750px;
	min-width: 750px;
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
	width: 570px;
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
    min-width: 750px;
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
    min-width: 748px;
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
    min-width: 150px;
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

#option{font-size: 17px; font-weight: 600; font-style: inherit; margin-top: 25px;}        
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	var ws;
	var room_id = "${room_id}";
	var room_name = "${room_name}";
	
	function wsOpen() {
		ws = new WebSocket("ws://" + location.host + "/echo.do");
		wsEvt();
	}

	function wsEvt() {
		ws.onmessage = function(data) {
			var msg = data.data;
			var m = msg.split(":"); 
			var m0 = m[0];
			var m1 = m[1];
			if(m0.trim() == "z"){
				$("#chatLog").append("<p>" + m1 + "?????? ??????????????????." + "</p>").css('text-align', 'center');
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
			
			$.ajax({
				url : "msg_save.do",
				method : "post",
				data : "msg="+ msg + "&room_name=" + room_name,
				dataType : "text",
				success : function(data) { 
					console.log("??????");
				},
				error : function() { alert("????????????");	}
			});
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
		$.ajax({
			url : "msg_list.do",
			method : "post",
			dataType : "json",
			data : "room_name=" + room_name,
			success : function(data) {
				$("#chatLog").empty();
				$.each(data, function(i) {
					var nickname = "${nickname}";
					console.log(nickname);
					var msg = this["msg"];
					var m = msg.split(":"); 
					var m0 = m[0];
					var m1 = m[1];
					if(i%2 == 0){
						if (msg != null && msg.trim() != '') {
							if(m0.trim() == "${nickname}"){
								$("#chatLog").append("<div id='myChat'><span class='msg'>" + msg + "</span></div>")
							} else {
								$("#chatLog").append("<div id='yourChat'><span class='msg'>" + msg + "</span></div>")
							}
						}
					}
				});
			},
			error : function() { alert("????????????");	}
		});
	});
	
	$(document).ready(function() {
		var font = "${font}";   
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
			error : function() { alert("????????????");	}
		});
	}
	
	function out_room() {
		$.ajax({
			url : "user_exit.do",
			method : "post",
			data : "room_id="+$(this).attr("room_id"),
			dataType : "text",
			success : function(data) {
				if(data == '1'){
					if (confirm("?????? ???????????? ???????????????????????") == true){  
						alert("???????????? ???????????????.");
						location.href = "main.do";
					} else {   
					    return;
					}
				}
			},
			error: function() {
				alert("????????????");
			}
		});
	}
	
	$(function() {
		var room_id = "${room_id}";
		
		function userList() {
			$("#memberList").empty();
			$("#memberList").append('<div id="memberHeader">?????????</div>');
			$.ajax({
				url : "user_list.do",
				method : "post",
				dataType : "json",
				data : "room_id="+$(this).attr("room_id"),
				success : function(data) {
					var list = "";
					$.each(data, function() {
						list += "<div class='memberSelect'>" + this["chat_user"] + "</div>"
					});
					$("#memberList").append(list);
					console.log(data);
				},
				error : function() { alert("????????????");	}
			});
		}
		
		userList();
	});
	
	function invite() {
		location.href = "invite.do?room_id=${room_id}&room_name=${room_name}";
	}
</script>
<body>
	<%@ include file="head.jsp"%>
	<div id="Wrap">
		<div id="container">
		    <nav id="nav">
		   		<h1 id="nav-header">?????????</h1>
		   		<div id="option">
			   		<a href='javascript:void(0);' onclick="invite();">????????????</a> /  
			  		<a href='javascript:void(0);' onclick="out_room();">?????????</a>
		   		</div>
		    </nav>   
		    <div id="contentCover">
		        <div id="chatWrap">
		            <div id="chatLog">
		                <div id="yourChat"></div>
		                <div id="myChat"></div>
		            </div>
			        <div id="chat_input">
			        	<input type="text" size="30" id="chatting" placeholder="???????????? ???????????????">
			            <button onclick="send()">?????????</button>
			        </div>
		        </div> 
		    </div>
		</div>
		<div id="memberWrap">
			<div id="memberList">
				<div id="memberHeader">?????????</div>
			</div>
		</div>
	</div>
</body>
</html>
