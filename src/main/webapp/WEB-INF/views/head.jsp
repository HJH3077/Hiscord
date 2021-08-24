<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* { 
	text-decoration: none;
}
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans:ital@1&display=swap'); 

/* 스크롤바 기능은 살리고 안보이게 하기 */
::-webkit-scrollbar {
	display: none;
}

body {
	margin: 0;
	padding: 0;
	background: #fafafa;
	display: flex;
	-ms-overflow-style: none;
	font-weight: 400;
}

* a:visited, a:link {
	color: black;
}

#main_head {
	box-sizing: border-box;
	width: 370px;
	min-width: 370px;
	margin-left: 7%;
	max-height: 100%;
}

.container {
	height: 100vh;
	position: sticky;
	background: #fff;
	border-left: 1px solid #ebeced;
	border-right: 1px solid #ebeced;
	overflow: hidden auto;
}

.container .logo {
	padding: 0 16px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	height: 60px;
	z-index: 9000;
	border-bottom: 1px solid #f1f3f5;
}

.container .logo a:first-of-type{
	font-family: 'Noto Sans', sans-serif;
	font-style: italic;
}

.visible_menu {
	position: absolute;
	cursor: auto;
	display: none;
	background: #fff;
	font-size: 1em;
	text-align: left;
	border: 1px solid rgba(34, 36, 38, .15);
	border-radius: 0.4rem;
	left: 60% !important;
	right: 3% !important;
}

.menu_list {
	white-space: nowrap;
	border-bottom: 1px solid #f1f3f5 !important;
	border-top: none !important;
	padding: 16px !important;
	cursor: pointer;
}

.menu_list {
	position: relative;
	cursor: pointer;
	display: block;
	text-align: left;
	line-height: 1em;
	color: rgba(0, 0, 0, .87);
	padding: 0.8rem 1rem !important;
	font-size: 1rem;
	font-weight: 400;
	z-index: 9999;
}

.menu_list:hover {
	opacity: 0.5;
	background-color: silver;
}

.logo a:visited, a:active {
	color: black;
} 

.list, #open_list {
	padding: auto;
	height: 80px;
	border-bottom: 1px solid #f1f3f5;
	font-size: 20px;
}

.list .room {
	padding: 13px;
	margin-top: 7px;
}

#open_list #open_room {
	padding: 13px;
	margin-top: 7px;
}

.chat_room_add {
	padding: auto;
	height: 60px;
	border-bottom: 1px solid #f1f3f5;
}

.chat_room_add .room_add {
	padding: 13px;
	text-align: center;
	font-size: 20px;
}

#pesonal:hover { cursor: pointer;}
#open_room div:hover { cursor: pointer;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		function chatList() {
			$("#listWrap").empty();
			$.ajax({
				url : "chatList.do",
				method : "post",
				dataType : "json",
				success : function(data) {
					var rooms = "";
					$.each(data, function() {
						rooms += "<div class='list'>";
						rooms += "<div class='room'>";
						rooms += "<div id='pesonal' room_id='" + this["room_id"] + "'>"
						rooms += "<img alt='dis' src='resources/images/" + this["room_logo"] + "' style='width: 40px;'>";
						console.log(this["room_logo"]);
						rooms += "<span style='margin-left: 10px;'>" + this["room_name"] + "</span>";
						rooms += "</div>";
						rooms += "</div>";
						rooms += "</div>";   
					});
					$("#listWrap").append(rooms);
				},
				error : function() { alert("읽기실패");	}
			});
		}
		
		var login = '<%=(String)session.getAttribute("login")%>';
		if(login == 1){
			chatList();
		}
		
		$("#listWrap").on("click","#pesonal",function() {
			location.href="personal_chat.do?room_id="+$(this).attr("room_id");
		});
	});
	
	function open_chat() {
		location.href = "open_chat.do";
	}
	
	function login_page() {
		location.href = "login.do";
	}
</script>
</head>
<body>
	<div id="main_head">
		<div class="container">
			<div class="logo">
				<a href="main.do"> <img alt="logo" src="resources/images/logo.png" width="100"> </a>
				<c:choose>
			  		<c:when test="${login=='1'}">
						<div class="listbox">
							<div class="option_img">
								<img alt="옵션" src="resources/images/option.png" width="45">
							</div>
							<div class="visible_menu">
								<a href="friend.do">
									<div role="option" class="menu_list" style="pointer-events: all;">
										친구
									</div>
								</a>
								<a href="setting.do">
									<div role="option" class="menu_list">
										설정
									</div>
								</a>
								<a href="suggestion.do">
									<div role="option" class="menu_list">
									건의사항
									</div>
								</a>
								<a href="logout.do">
									<div role="option" class="menu_list">
										로그아웃
									</div>
								</a>
							</div>
						</div>
			  		</c:when>
			  		<c:otherwise>
			  			<a href="login.do">로그인</a>
			  		</c:otherwise>
		  		</c:choose>
			</div>
			<script type="text/javascript">
				$(".option_img").click(function() {
					if ($(".visible_menu").is(":visible")) {
						$(".visible_menu").css("display", "none");
					} else {
						$(".visible_menu").css("display", "block");
					}
				});
			</script>
			<div id="open_list">
				<div id="open_room">
					<c:choose>
						<c:when test="${login=='1'}">
							<div onclick="open_chat()"> 
								<img alt="디스코드" src="resources/images/discord.png" style="width: 40px;">
								<span style="margin-left: 10px;">공용 채팅방</span>
							</div>
						</c:when>
						<c:otherwise>
							<div onclick="login_page()"> 
								<img alt="디스코드" src="resources/images/discord.png" style="width: 40px;">
								<span style="margin-left: 10px;">공용 채팅방</span>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div id="listWrap">
			</div>
			<div class="chat_room_add">
				<div class="room_add">
					<c:choose>
						<c:when test="${login=='1'}">
							<a href="create_chatroom.do">
								<span>채팅방 추가</span>
								<img alt="추가" src="resources/images/plus.png"	style="width: 30px; height: 20px;">
							</a>
						</c:when>
						<c:otherwise>
							<a href="login.do">
								<span>채팅방 추가</span>
								<img alt="추가" src="resources/images/plus.png"	style="width: 30px; height: 20px;">
							</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</body>
</html>