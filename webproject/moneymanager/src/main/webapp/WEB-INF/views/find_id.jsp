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

div .r_in{
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
	<nav>
	</nav>
	<div id="wrapper_mainsec">
		<div class="border_1">
			<div class="text_contain">
				<span style="font-size: 17px;">아이디와 비밀번호 찾기</span>
			</div>
		</div>
		<span class="my_style1">찾는 방법을 선택해 주세요</span><br>
		<form action="">
			<div class="result_contain">
				<input type="radio" name="selected_a" value="0"><span
					class="my_style2">회원정보에 등록한 휴대전화로 인증</span><br>
				<div class="r_in" id="r_in01" style="display: none;">
					<span class="my_style1">회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야,
						인증번호를 받을 수 있습니다.</span><br><br><br>
						<table>
						<tbody>
							<tr>
								<th>이름</th>
								<td><input type="text"></td>
								<td></td>
							</tr>
							<tr>
								<th>휴대전화</th>
								<td><input type="text" placeholder="휴대전화번호"></td>
								<td><input type="button" value="인증번호 받기"></td>
							</tr>
							<tr>
								<th></th>
								<td><input type="number" placeholder="인증번호 6자리 숫자 입력" disabled></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				<hr
					style="border-style: solid none none none; color: #eee; margin: 15px 0px;">
				<input type="radio" name="selected_a" value="1"><span
					class="mystyle2">전화번호와 찾기 답변으로 인증</span><br>
				<div class="r_in" id="r_in02" style="display: none;">
					<span class="my_style1">회원정보에 등록한 휴대전화 번호와 비밀번호 찾기용 답안을 입력해주세요.</span><br><br><br>
						<table>
						<tbody>
							<tr>
								<th>휴대전화</th>
								<td><input type="text" placeholder="휴대전화번호"></td>
							</tr>
							<tr>
								<th>비밀번호 찾기용 답안</th>
								<td><input type="text"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div align="center"><input type="button" value="찾기" style="padding: 10px 30px; background-color: #efefef; border-radius: 2px;"></div>
		</form>
	</div>
</body>
</html>