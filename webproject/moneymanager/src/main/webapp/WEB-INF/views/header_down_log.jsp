<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<style type="text/css">
/* 초기화 */
* {
	font-size: 13px;
	margin: 0;
	padding: 0;
	font-size: 12px;
}

a {
	text-decoration: none;
}

img {
	border: 0px;
}

body {
	margin: 0 auto;
}
/* 헤더영역  */
.head {
	position: relative;
	height: 30px;
	padding: 40px 0px 0px 0px;
}

.head>#down {
	z-index: 2;
	position: absolute;
	display: block;
	left: 5px;
}

.head>#login_position {
	position: absolute;
	display: block;
	right: 5px;
}

.head>#down>#down_container {
	margin-top: 2px;
	padding: 30px;
	border: 5px solid orange;
	background-color: #f9f9f9;
	border-radius: 15px;
	display: none;
	box-shadow: 0px 8px 10px 0px rgba(0, 0, 0, 0.2);
}
/*로그인 버튼*/
#login, #butt1 {
	height: 30px;
	border-radius: 15px;
	border: 1px solid orange;
	color: white;
	font-size: 13px;
	font-weight: bold;
	background-color: orange;
	padding: 0px 10px;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#butt1").click(function() {
			$("#down_container").toggle();
		});
	});

	function login_go() {
		location.href = "login.do";
	}
	function logout_go() {
		var chk=confirm('정말 로그아웃 하시겠어요?')
		if (chk==true) {
			location.href = "logout.do";
			
		}
	}
</script>
</head>
<body>
	<header class="head">
		<div id="down">
			<b>앱다운로드</b>
			<button id="butt1">>></button>
			<div id="down_container">
				<dl>
					<dt>
						<b>안드로이드</b>
					</dt>
					<dd>
						<a href="#">누르면 다운로드 페이지로 이동</a>
					</dd>
					<br>
					<dt>
						<b>iOS</b>
					</dt>
					<dd>
						<a href="#">누르면 다운로드 페이지로 이동</a>
					</dd>
				</dl>
			</div>
		</div>
		<div id="login_position">
			<c:choose>
				<c:when test="${login=='ok'}">
					<div><p><a href="">${mvo.mnickname}</a>님환영합니다.</p></div>
					<button id="login" onclick="logout_go()">Logout</button>
				</c:when>
				<c:otherwise>
					<button id="login" onclick="login_go()">Login</button>
				</c:otherwise>
			</c:choose>
		</div>
	</header>
</body>
</html>