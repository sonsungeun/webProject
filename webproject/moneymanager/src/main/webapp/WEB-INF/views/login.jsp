<%@ page language="java" contentType="text/html; charset=UTF-8"
	 pageEncoding="UTF-8"%>
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
	margin: 0;
	padding: 0;
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
	position: relative; //
	background-color: #ddd;
}

h1 {
	text-align: center;
	color: orange;
	margin: 20px;
}

.login {
	box-sizing: border-box;
	width: 300px;
	height: 40px;
	border: 1px solid #cfc3c3;
	background: white;
	padding: 10px 0px 10px 10px;
	margin: 10px;
}

input {
	border: none;
	width: 250px;
	font-size: 15px;
}

#logbtn {
	padding: 0px;
	width: 300px;
	height: 45px;
	color: white;
	background-color: orange;
	margin: 10px;
}

#content {
	margin-top: 120px;
	position: absolute;
	left: 50%;
	margin-left: -150px;
}

#content_1, .content_2 {
	margin-top: 30px;
	margin-left: 10px;
}

#img_kakao {
	margin: 10px;
}

#content_3 {
	text-align: center;
	margin: 10px;
}

#content_3>hr {
	border: 1px solid #cfc3c3;
	width: 1px;
	height: 25px;
	border-style: none solid none none;
	display: inline-block;
	margin-left: 5px;
	margin-right: 5px;
	position: relative;
	top: 5px;
}
</style>
<script type="text/javascript">
	function send_go(f) {
		f.action = "login_ok.do";
		f.submit();
	}
	function kakao_log_go() {
		location.href = "login_kakao.do";
	}
</script>
<script type="text/javascript">
	$(function() {
		$("#mid").click(function() {
			$("#pw_div").css("border", "1px solid #cfc3c3");
			$("#id_div").css("border", "2px solid orange");
		});

		$("#mpw").click(function() {
			$("#id_div").css("border", "1px solid #cfc3c3");
			$("#pw_div").css("border", "2px solid orange");
		});

	});
</script>
</head>
<body>
	<div id="content">
		<div onclick="javascript:location.href='gomain.do'"><h1>MoneyManager</h1></div>
		<div id="content_1">
			<h4>회원로그인</h4>
			<hr
				style="width: 300px; border: 2px solid black; border-style: solid none none none; margin-top: 5px;">
		</div>
		<form method="post">
			<div class="login" id="id_div">
				<input type="text" id="mid" name="mid" placeholder="아이디">
			</div>
			<div class="login" id="pw_div">
				<input type="password" id="mpw" name="mpw" placeholder="비밀번호">
			</div>
			<input type="button" id="logbtn" onclick="send_go(this.form)" value="로그인">
		</form>
		<div class="content_2">
			<h4>간편로그인</h4>
			<hr
				style="width: 300px; border: 1px solid black; border-style: solid none none none; margin-top: 5px;">
		</div>
		<img id="img_kakao" src="resource/kakao_login.png" onclick="kakao_log_go()">
		<div class="content_2">
			<hr
				style="width: 300px; border: 1px solid #cfc3c3; border-style: solid none none none; margin-top: 5px;">
		</div>
		<div id="content_3">
			<a href="join.do">회원가입</a>
			<hr>
			<a href="find.do">아이디/비밀번호 찾기</a>
		</div>

	</div>
</body>
</html>