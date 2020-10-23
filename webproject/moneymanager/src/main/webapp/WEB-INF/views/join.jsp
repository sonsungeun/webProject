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
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function send_msg() {
		var phonenum = $("#phone").val();
		/* 인증번호 입력창, 버튼 on */
		$("#inputnum").attr("disabled", false);
		$("#chkbtn").attr("disabled", false);
		$.ajax({
			url : "sendmsg.do",
			type : "get",
			dataType : "text",
			data : "phone=" + phonenum,
			success : function(data) {
				var inputnum = $("#inputnum").val();
				if (inputnum==data) {
					$("#error4").css("color","blue");
					$("#error4").html("인증 성공!");
					$("#joinbtn").attr("disabled",false);
				}else {
					("#error4").css("color","red");
					$("#error4").html("인증 실패")
				}
			},
			error : function() {
				alert("실패");
			}
		});
	}
	
	function join_go(f) {
		f.action="join_ok.do";
		f.submit();
	}
</script>
<script type="text/javascript">
	$(function() {
		$("#myid").keyup(function() {
			$.ajax({
				url : "getmemlist.do",
				type : "get",
				dataType : "text",
				data : "mid=" + $("#myid").val(),
				success : function(data) {
					$("#error1").html(data);
				},
				error : function name() {
					alert("실패");
				}
			});
		});
		var mypw = "";
		var mypwchk = "";
		$("#mypw").keyup(function() {
			mypw = $(this).val();
			if (mypw.length < 9) {
				$("#error2").html("9글자 이상의 비밀번호를 입력해주세요");
			} else {
				$("#error2").html("");
			}
		});

		$("#mypwchk").keyup(function() {
			mypwchk = $(this).val();
			if (mypw != mypwchk) {
				$("#error3").html("입력하신 비밀번호가 일치하지 않습니다.");
			} else {
				$("#error3").html("");
			}
		});

	});
</script>

</head>
<body>
	<header>
		<div id="logo">
			<a href="gomain.do"><span>moneymanager</span></a>
		</div>
		<div id="login_position">
			<button id="login" onclick="javascript:location.href='login.do'">Login</button>
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
							placeholder="아이디를 입력" id="myid" name="mid"></span> <br> <span
							class="msgbox_error" id="error1"></span>
						<h3 class="title">
							<label>비밀번호</label>
						</h3>
						<span class="inbox"><input type="password"
							placeholder="비밀번호를 입력" id="mypw" name="mpw"></span> <br> <span
							class="msgbox_error" id="error2"></span>
						<h3 class="title">
							<label>비밀번호 재확인</label>
						</h3>
						<span class="inbox"><input type="password"
							placeholder="비밀번호를 다시 한번 입력" id="mypwchk"></span> <br> <span
							class="msgbox_error" id="error3"></span>
					</div>
					<div id="in_sub">
						<h3 class="title">
							<label>이름</label>
						</h3>
						<span class="inbox"><input type="text" name="mname"></span>
						<h3 class="title">
							<label>닉네임(게시판용)</label>
						</h3>
						<span class="inbox"><input type="text" name="mnickname"></span>
						<h3 class="title">
							<label>비밀번호 찾기용 답</label>
						</h3>
						<span class="inbox"><input type="text"
							placeholder="비밀번호 찾을때 필요" name="mfindpw"></span>
					</div>
					<div id="in_phone">
						<h3 class="title">
							<label>휴대전화</label>
						</h3>
						<span class="inbox" id="inbox_p"><input id="phone"
							type="text" placeholder="-을 제외한 휴대전화 번호를 입력" name="mphone"></span>
						<input class="btn" type="button" value="인증번호 받기"
							onclick="send_msg()">
						<hr style="margin: 5px; border-style: none;">
						<span class="inbox" id="inbox_p_answer"><input type="text"
							id="inputnum" disabled></span> <input type="button" class="btn" id="chkbtn"
							placeholder="인증번호 입력" value="인증번호 확인" disabled> <br>
						<span class="msgbox_error" id="error4">이곳은 인증번호 오류 메세지 구역</span>
					</div>
					<input id="joinbtn" type="button" value="가입하기"
						onclick="join_go(this.form)">
				</fieldset>
			</div>
		</form>
	</div>
</body>
</html>