<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 관리</title>
<style type="text/css">
@import
	"//netdna.bootstrapcdn.com/font-awesome/3.0/css/font-awesome.css";

body {
	padding: 0;
	margin: 0;
}
  
a{text-decoration: none;} 

#user_info {
	width: 1500px;
	background-color: #fff;
	text-align: center;
	margin: auto;
}
  
#admin_head {
	border-bottom: 1px solid #f1f3f5;
	box-sizing: border-box;
	width: 1500px;
	margin-top: 20px;
}
 
#admin_logo {
	text-align: center;
	width: 1300px;   
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
	margin-left: 79%; 
}

#nav {
	box-sizing: border-box;
	background-color: #fff;
	width: 1300px;
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

#searchbar {
	height: 100px;
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}

#search::-webkit-input-placeholder {
	font-family: FontAwesome;
	font-weight: normal;
	overflow: visible;
	vertical-align: top;
	display: inline-block !important;
	padding-left: 5px;
	padding-top: 2px;
	color: hsl(9, 40%, 60%);
}

#searchbar #search {
	margin-left: 20px;
	height: 35px;
	width: 500px;
	border-radius: 7px;
	font-family: 'fontAwesome';
}

#user_title {color: white;}

table {
	border-collapse: collapse;
	text-align: center;
	width: 1200px;
}

table, tr, td, th {
	padding: 2px;
	margin: auto;
	font-size: 18px;
	border: 1px solid black;
}

tr {font-size: 20px; line-height: 2.5;}

/* 페이징 */
#paging {
	margin: 45px auto;
	font-size: 25px;
	width: 1300px;
	text-align: center;
}

#page a {margin-left: 25px;}

#page img {	width: 30px; height: 20px;}

#paging #del_btn {
	height: 41px;
	width: 80px;
	float: right;
	background-color: #9370DB;
	color: white;
	font-size: 15px;
	border-radius: 0.5em;
	margin-right: 50px;
} 

#page_now:hover {font-weight: bold;	text-decoration: underline;}
 
#now {color: red; text-decoration: underline;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	// 체크박스 전체 활성화
	function chk_all() {
		if (chk_form.chkall.checked == true) {
			for (i = 0; i < chk_form.chk.length; i++) {
				chk_form.chk[i].checked = true;
			}
		} else {
			for (i = 0; i < chk_form.chk.length; i++) {
				chk_form.chk[i].checked = false;
			}
		}
	}
	
	$(function() {
		$("#del_btn").click(function() {
			var chk = [] ;
			var id = [] ;
			$("input[name='chk']:checked").each(function() {
				chk.push($(this).val());
				id.push($(this).attr("id"));
			});
			
			if(chk.length == 0){
				alert("삭제할 유저를 선택 후 눌러 주세요");
				return false;
			}
			
			$.ajax({
				url : "chkbox_user_delete.do",
				method : "post",
				data :{"id": id},
				dataType : "text",
				success : function(data) {
					if(data == '1'){
					   alert("삭제 성공");
					   location.href = "user_mng.do?cPage=" + 1;
					}
				},
				error: function() {
					alert("삭제 실패");
				}
			});
		});
	});
</script>
</head>
<body>
	<div id="user_info">
		<div id="admin_head">
			<h1 id="admin_logo">회원정보관리</h1>  
			<button id="logout">로그아웃</button> 
			<div id="nav">
				<div class="nav_bar">
					<a href="#">회원정보 관리</a>
				</div>
				<div class="nav_bar">
					<a href="prohibited_word.do?pPage=${1}">금지어 관리</a>
				</div>
			</div>
		</div>
		<div id="searchbar">
			<input id="search" type="search" name="input" placeholder="&#61442;" onclick="search_go()">
		</div>
		<div id="user">
			<div>
				<form method="post" name="chk_form">
					<table>
						<thead style="background-color: #9370DB">
							<tr id="user_title">
								<th style="width: 5%"><input type="checkbox" name="chkall"
									onclick="chk_all()"></th>
								<th style="width: 10%">번호</th>
								<th style="width: 15%">아이디</th>
								<th style="width: 15%">닉네임</th>
								<th style="width: 35%">이메일</th>
								<th style="width: 20%">가입날짜</th>
							</tr>
						</thead>
						<tbody id="tbody">
							<c:choose>
								<c:when test="${empty list}">
									<tr>
										<td colspan="6"><h3>원하시는 자료가 존재하지 않습니다.</h3></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="k" items="${list}" varStatus="vs">
										<tr>
											<td><input type="checkbox" name="chk" class="chk" id="${k.id}"></td>
											<td>${pvo.totalRecord-((pvo.nowPage-1)*pvo.numPerPage+vs.index)}</td>
											<td><a href="user_onelist.do?id=${k.id}&cPage=${cPage}">${k.id}</a></td>
											<td>${k.nickname }</td>
											<td>${k.email }</td>
											<td>${k.reg.substring(0,10) }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</form>
				<div id="paging">
					<div id="page">
						<!-- 이전 페이지 -->
						<c:choose>
							<c:when test="${pvo.beginBlock <= pvo.pagePerBlock }">
								<a><img alt="이전" src="resources/images/previous.png" style="opacity: 0.1;"></a>
							</c:when>
							<c:otherwise>
								<a href="user_mng.do?cPage=${pvo.beginBlock-pvo.pagePerBlock}">
									<img alt="이전" src="resources/images/previous.png">
								</a>
							</c:otherwise>
						</c:choose>
						<!-- 번호 -->
						<c:forEach begin="${pvo.beginBlock }" end="${pvo.endBlock }"
							step="1" var="k">
							<c:choose>
								<c:when test="${k==pvo.nowPage}">
									<a id="now">${k}</a>
								</c:when>
								<c:otherwise>
									<a id="page_now"  href="user_mng.do?cPage=${k}">${k}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<!-- 다음 페이지 -->
						<c:choose>
							<c:when test="${pvo.endBlock >= pvo.totalPage }">
								<a><img alt="다음" src="resources/images/next.png" style="opacity: 0.1;"></a>
							</c:when>
							<c:otherwise>
								<a href="user_mng.do?cPage=${pvo.beginBlock+pvo.pagePerBlock}">
									<img alt="다음" src="resources/images/next.png">
								</a>
							</c:otherwise>
						</c:choose>
					</div>
					<div>
						<input type="button" id="del_btn" value="삭제하기">
						<input type="hidden" value="cPage" name="cPage">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>