<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>금지어 관리</title>
<style type="text/css">
@import
	"//netdna.bootstrapcdn.com/font-awesome/3.0/css/font-awesome.css";
	
body {
	padding: 0;
	margin: 0;
}
#ban_info {
	width: 1500px;
	text-align: center;
	margin: auto;
	background-color: #fff;
}
#admin_head {
	border-bottom: 1px solid #f1f3f5;
	box-sizing: border-box;
	width: 1500px;
}
#admin_logo {
	text-align: center;
	color: black;
	font-weight: bold;
	font-size: 45px;
	padding: 10px;
	margin: auto;
}
#nav {
	box-sizing: border-box;
	background-color: #fff;
	width: 1300px;
	padding: 20px;
	display: flex;
	margin: auto;
}
.nav_bar a{
	color: white;
}
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
#ban_title {
	color: white;
}
table {
	border-collapse: collapse;
	text-align: center;
	width: 1300px;
}
table, tr, td, th {
	margin: auto;
	font-size: 18px;
	border: 1px solid black;
}

tr {
	font-size: 20px;
	line-height: 2.5;
}

/* 페이징 */
#paging {
	margin: 45px auto;
	font-size: 25px;
	width: 1300px;
	text-align: center;
}
#page a {
	color: #000080;
	margin-left: 25px;
}
#page img {
	width: 30px;
	height: 20px;
}
#de_btn {
	height: 41px;
	width: 80px;
	float: right;
	background-color: #9370DB;
	color: white;
	font-size: 15px;
	border-radius: 0.5em;
}
</style>
<script type="text/javascript">
	function delete_go() {
		location.href = "";
	}
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
</script>
</head>
<body>
	<div id="ban_info">
		<div id="admin_head">
			<h1 id="admin_logo">금지어관리</h1>
			<div id="nav">
				<div class="nav_bar">
					<a href="user_mng.do">회원정보 관리</a>
				</div>
				<div class="nav_bar">
					<a href="prohibited_word.do">금지어 관리</a>
				</div>
			</div>
		</div>
		<div id="searchbar">
			<input id="search" type="search" name="input" placeholder="&#61442;">
		</div>
		<div id="ban">
			<div>
				<form method="post" name="chk_form">
					<table>
						<thead style="background-color: #9370DB">
							<tr id="ban_title">
								<th style="width: 5%"><input type="checkbox" name="chkall"
									onclick="chk_all()"></th>
								<th colspan="7">금지어</th>  
							</tr> 
						</thead>
						<tbody>
							<tr>
								<td style="width: 5%"><input type="checkbox" name="chk" value=""></td>
								<td>kim</td>
								<td style="width: 5%"><input type="checkbox" name="chk" value=""></td>
								<td>kim</td>
								<td style="width: 5%"><input type="checkbox" name="chk" value=""></td>
								<td>kim</td>
								<td style="width: 5%"><input type="checkbox" name="chk" value=""></td>
								<td>kim</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="chk" value=""></td>
								<td>kim</td>
								<td><input type="checkbox" name="chk" value=""></td>
								<td>kim</td>
								<td><input type="checkbox" name="chk" value=""></td>
								<td>kim</td>
								<td><input type="checkbox" name="chk" value=""></td>
								<td>kim</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div id="paging">
					<div id="page">
						<!-- 이전 페이지 -->
						<c:choose>
							<c:when test="${pvo.beginBlock <= pvo.pagePerBlock }">
								<a><img alt="이전" src="resources/images/previous.png"></a>
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
									<a id="page_now" a href="user_mng.do?cPage=${k}">${k}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<!-- 다음 페이지 -->
						<c:choose>
							<c:when test="${pvo.endBlock >= pvo.totalPage }">
								<a><img alt="다음" src="resources/images/next.png"></a>
							</c:when>
							<c:otherwise>
								<a href="user_mng.do?cPage=${pvo.beginBlock+pvo.pagePerBlock}">
									<img alt="다음" src="resources/images/next.png">
								</a>  
							</c:otherwise>
						</c:choose>
					</div>
					<div>
						<input type="button" id="de_btn" value="삭제하기" onclick="delete_go()">
					</div>
				</div>
		</div>
	</div>
</body>
</html>