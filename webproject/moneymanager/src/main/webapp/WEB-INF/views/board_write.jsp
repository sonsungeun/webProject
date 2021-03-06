<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	margin-bottom: 30px;
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

#wrapper_this {
	margin: 0 auto;
	padding: 50px;
	width: 1000px;
	position: relative;
}

#container {
	display: inline-block;
	position: relative;
	width: 1000px;
}

#right_area {
	float: right;
}

#ok_btn {
	background-color: #f1f1f1;
	padding: 6px 10px;
	border: none;
	border-radius: 5px;
	border: none;
	color: orange;
	font-weight: bold;
}

#hr_1 {
	margin: 5px 0px;
	border-style: solid none none none;
	border-top: 3px solid #c1c1c1;
}

#onesboard {
	margin-bottom: 20px;
}

#title {
	margin: 5px 0px 10px;
	padding: 5px;
	border: 1px solid #c1c1c1;
	width: 988px;
}
</style>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	function write_ok(f) {
		f.action="boardwrite.do"
		f.submit();
	}
</script>
</head>
<body>
	<header id="header">
		<c:import url="header_down_log.jsp"></c:import>
	</header>
	<nav id="nav">
		<c:import url="nav.jsp"></c:import>
	</nav>
	<div id="wrapper_this">
		<div id="container">
			<form method="post">
				<span style="font-size: 20px; font-weight: bold;">게시판 글쓰기</span>
				<div id="right_area">
					<input id="ok_btn" type="button" value="등록"
						onclick="write_ok(this.form)">
					<input type="hidden" value="${mvo.mnickname}" name="mnickname">
				</div>
				<hr id="hr_1">
				<input type="text" placeholder="제목을 입력해 주세요" name="title" id="title">
				<textarea id="content" name="content"></textarea>
				<script type="text/javascript">
					CKEDITOR.replace('content');
				</script>
			</form>
		</div>
	</div>

</body>
</html>