<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	/* 라디오 버튼 누르면 해당 영역만 나타나게 만들기 */
	$(document).ready(function() {
		$("input:radio[name=selected_a]").click(function() {

			if ($("input[name=selected_a]:checked").val() == "0") {
				$("#r_in01").fadeIn();
				$("#r_in02").fadeOut();
			} else if ($("input[name=selected_a]:checked").val() == "1") {
				$("#r_in02").fadeIn();
				$("#r_in01").fadeOut();
			}
		});
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

/* li a {
	font-size: 20px;
	font-weight: 900;
}

img {
	border: 0px;
}

ul {
	position: absolute;
	list-style: none;
	top: 50%;
	margin-top: -15px;
	left: 50%;
	margin-left: -450px;
}

li {
	float: left;
	width: 200px;
	font-size: 25px;
	font-weight: 900;
	text-align: center;
	font-weight: 900;
} */
body {
	margin: 0 auto;
}

header {
	position: relative;
	height: 30px;
	background-color: #555;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 2;
}

#logo {
	position: absolute;
	left: 10px;
	top: 7px;
}

#logo span {
	font-weight: 900;
	color: orange;
}

#login_position {
	position: absolute;
	right: 10px;
	top: 5px;
}

#login {
	color: white;
	background-color: #111;
	height: 20px;
}

nav {
	position: relative;
	background-color: orange;
	height: 70px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

#wrapper_mainsec {
	padding-top: 40px;
	margin: 0 auto;
	width: 800px;
	position: relative;
}

div .border_1 {
	border: none;
	border-bottom: 2px solid #eee;
	margin-bottom: 8px;
}

div .border_2 {
	border: 1px solid #eee;
}

div .text_contain {
	border: none;
	border-bottom: 2px solid black;
	display: inline-block;
	font-weight: bold;
}

div .result_contain {
	border: 1px solid #eee;
	display: inline-block;
	margin: 25px 0px 35px;
	padding: 30px;
	box-sizing: border-box;
	width: 100%;
}

div .r_in {
	margin-left: 10px;
	padding: 7px;
	margin-bottom: 20px;
}

/* span태그 클래스 */
.my_style1 {
	margin: 5px 0px;
}
</style>
</head>
<body>
	<header>
		<div id="logo">
			<a href="mainpage.jsp"><span>moneymanager</span></a>
		</div>
		<div id="login_position">
			<button id="login" onclick="login_go()">Login</button>
		</div>
	</header>
	<nav></nav>
	<div id="wrapper_mainsec">
		<div class="border_1">
			<div class="text_contain">
				<span style="font-size: 17px;">아이디와 비밀번호를 알려드립니다.</span>
			</div>
		</div>
		<form action="">
			<div class="result_contain">
				<div class="r_in" >
					<table style="margin-left: auto;margin-right: auto;">
						<tbody>
							<tr>
								<th>아이디</th>
								<td><input type="text"></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="text" ></td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>
			<div align="center">
				<input type="button" value="로그인" onclick="javascript:location.href='login.jsp'"
					style="padding: 10px 30px; background-color: #efefef; border-radius: 2px;">
			</div>
		</form>
	</div>
</body>
</html>