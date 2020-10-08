<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	width: 1000px;
	margin: 0 auto;
	background-color: #f5f6f7;
}

header {
	position: relative;
	height: 30px;
	background-color: #555;
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

#wrapper {
	position: absolute;
	left: 50%;
	margin-left: -200px;
}

fieldset {
	padding: 10px;
	margin-top: 20px;
	margin-bottom: 30px;
	border: none;
}

legend {
	text-align: center;
	font-size: 27px;
}

.title {
	margin: 19px 0px 8px;
}

label {
	font-size: 14px;
}

.inbox {
	display: inline-block;
	box-sizing: border-box;
	width: 400px;
	height: 50px;
	background-color: white;
	border: 1px solid grey;
}

#inbox_p, #inbox_p_answer {
	width: 275px;
}

.inbox input {
	width: 250px;
	height: 34px;
	margin: 8px 0px 8px 15px;
	font-size: 14px;
	border: none;
}

.inbox2 {
	display: inline-block;
	box-sizing: border-box;
	width: 70px;
	height: 50px;
	background-color: orange;
	border: 1px solid orange;
}

.msgbox_error {
	display: inline-block;
	margin-top: 3px;
	color: red;
	font-size: 11px;
}

.btn {
	border: 1px solid orange;
	width: 123px;
	height: 50px;
	background-color: orange;
}

#joinbtn {
	border: 1px solid orange;
	width: 400px;
	height: 50px;
	background-color: orange;
	margin-top: 15px;
}
</style>
</head>
<body>
	<header>
		<div id="logo">
			<a href="mainpage.jsp"><span>moneymanager</span></a>
		</div>
		<div id="login_position">
			<button id="login" onclick="javascript:location.href='login.jsp'">Login</button>
		</div>
	</header>
	<div id="page">
		<form method="post">
			<div id="wrapper">
				<fieldset>
					<legend>회원가입</legend>
					<div id="in_must">
						<h3 class="title">
							<label>아이디</label>
						</h3>
						<span class="inbox"><input type="text"
							placeholder="아이디를 입력" name=""></span> <br> <span
							class="msgbox_error">이곳은 오류 메세지 구역</span>
						<h3 class="title">
							<label>비밀번호</label>
						</h3>
						<span class="inbox"><input type="password"
							placeholder="비밀번호를 입력" name=""></span> <br> <span
							class="msgbox_error">이곳은 오류 메세지 구역</span>
						<h3 class="title">
							<label>비밀번호 재확인</label>
						</h3>
						<span class="inbox"><input type="password"
							placeholder="비밀번호를 다시 한번 입력"></span> <br> <span
							class="msgbox_error">이곳은 오류 메세지 구역</span>
					</div>
					<div id="in_sub">
						<h3 class="title">
							<label>이름</label>
						</h3>
						<span class="inbox"><input type="text" name=""></span>
						<h3 class="title">
							<label>닉네임(게시판용)</label>
						</h3>
						<span class="inbox"><input type="text" name=""></span>
						<h3 class="title">
							<label>비밀번호 찾기용 답</label>
						</h3>
						<span class="inbox"><input type="text"
							placeholder="비밀번호 찾을때 필요" name=""></span>
					</div>
					<div id="in_phone">
						<h3 class="title">
							<label>휴대전화</label>
						</h3>
						<span class="inbox" id="inbox_p"><input type="text"
							placeholder="-을 제외한 휴대전화 번호를 입력" name=""></span> <input
							class="btn" type="button" value="인증번호 받기">
						<hr style="margin: 5px; border-style: none;">
						<span class="inbox" id="inbox_p_answer"><input type="text"
							disabled></span> <input type="button" class="btn"
							placeholder="인증번호 입력" value="인증번호 확인" disabled> <br>
						<span class="msgbox_error">이곳은 인증번호 오류 메세지 구역</span>
					</div>
					<input id="joinbtn" type="button" value="가입하기"
						onclick="join_go(this)">
				</fieldset>
			</div>
		</form>
	</div>
</body>
</html>