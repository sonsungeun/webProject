<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		if (${newmember}=="1") {
			alert("반갑습니다. 회원가입을 축하드립니다.");
		}
	});
</script>
<style type="text/css">
/* 초기화 */
* {
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
	margin: 40px 0px 0px 0px;
}

.nav {
	position: relative;
	margin-top: 10px;
}

#wrapper_mainsec {
	margin: 120px 0px 120px 0px;
	position: relative;
}

section {
	background-color: #ffa50099;
	height: 370px;
}

footer {
	background-color: #f1f1f1;
	padding: 20px 0px;
	text-align: center;
}

div #b1 {
	position: absolute;
	top: 40%;
	left: 30%;
}

div #b2 {
	position: absolute;
	top: 50%;
	left: 30%;
}
</style>
</head>
<body>
	<header id="header">
		<c:import url="header_down_log.jsp"></c:import>
	</header>
	<nav id="nav">
		<c:import url="nav.jsp"></c:import>
	</nav>
	<div id="wrapper_mainsec">
		<section>
			<div>
				<button id="b1" onclick="javascript:location.href='#'">앱 소개
					보기</button>
				<button id="b2" onclick="javascript:location.href='#'">앱
					다운로드</button>
			</div>
		</section>
	</div>
	<footer> E-mail:euni060795@naver.com </footer>
</body>
</html>