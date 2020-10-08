<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* span태그 스타일 속성 */
.one {
	font-size: 13pt;
	padding: 3px 5px;
	font-weight: bolder;
}

.btn {
	border: none;
	background-color: green;
	color: white;
	border-radius: 1px;
}

.color {
	color: green;
}

a {
	text-decoration: none;
}

img {
	border: 0px;
}

body {
	margin: 0 auto;
	background-color: #eee;
}
.mystyle {
	display: inline-block;
	width: 100%;
	padding-left: 10px;
}
/* 헤더영역  */
.head {
	height: 30px;
	padding: 40px 0px 0px 0px;
	background-color: white;
}

.nav {
	padding-top: 10px;
	background-color: white;
}

#wrapper_mainsec {
	padding: 60px 0px;
	width: 1000px;
	position: relative;
	margin: 0 auto;
}

footer {
	background-color: #f1f1f1;
	padding: 20px 0px;
	text-align: center;
}

div #select {
	width: 60%;
	display: inline-block;
	padding: 10px;
	margin-bottom: 30px;
	box-sizing: border-box;
}

div #gibon_container, .opener {
	background-color: white;
	margin-top: 10px;
	margin-right: 30px;
	box-sizing: border-box;
	padding: 15px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	padding: 15px;
}

div .contentsmargin {
	margin-top: 5px;
	margin-bottom: 20px;
}

div #result {
	float: right;
	margin-top:10px;
	box-sizing: border-box;
	position: relative;
}

table {
	width: 100%;
	margin-top: 5px;
}

td, th {
	padding: 3px;
}

.btn1 {
	border: none;
	width: 550px;
}

.hr_1 {
	margin: 5px 0px;
	border-style: solid none none none;
	border-top: 3px solid green;
}

.input_font {
	font-size: 15pt;
	color: green;
	font-weight: bold;
	border: none;
	text-align: right;
}

input[type=number]::-webkit-outer-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

input[type=number]::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}
/* 팝업창 */
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
		<div class="mystyle">
			<span class="btn one">기본</span> <span class="color one">필수 입력
				항목입니다</span>
		</div>
		<div id="result">
			<c:import url="result_show.jsp"></c:import>
		</div>
		<div id="select">
			<form action="">
				<div id="gibon_container">
					<span style="color: green; font: 15pt">*</span><span class="one">가입기간</span><br>
					<div class="contentsmargin">
						<table>
							<tr>
								<td width="90%" style="text-align: right;"><input
									type="number" class="input_font" value="0" name=""></td>
								<td width="10%" style="text-align: right;"><span
									class="one">개월</span></td>
							</tr>
						</table>
						<hr class="hr_1">
					</div>
					<span style="color: green; font: 15pt">*</span><span class="one">예치금</span><br>
					<div class="contentsmargin">
						<table>
							<tr>
								<td width="90%" style="text-align: right;"><input
									type="number" class="input_font" value="0" name=""></td>
								<td width="10%" style="text-align: right;"><span
									class="one">원</span></td>
							</tr>
						</table>
						<hr class="hr_1">
					</div>
					<span style="color: green; font: 15pt">*</span><span class="one">원하는
						가입경로</span><br>
					<div class="contentsmargin">
						<input type="checkbox" name="" value=""><span>모바일뱅킹</span>&nbsp;&nbsp;
						<input type="checkbox" name="" value=""><span>영업점</span>
						&nbsp;&nbsp;<input type="checkbox" name="" value=""><span>인터넷뱅킹</span>
						&nbsp;&nbsp;<input type="checkbox" name="" value=""><span>콜센터</span>
					</div>
					<span style="color: green; font: 15pt">*</span><span class="one">성별</span><br>
					<div class="contentsmargin">
						<input type="radio" name="gender" value=""><span>남자</span>&nbsp;&nbsp;
						<input type="radio" name="gender" value=""><span>여자</span>
					</div>
					<span style="color: green; font: 15pt">*</span><span class="one">생년월일</span><br>
					<div class="contentsmargin">
						<input type="text">
					</div>
					<span style="color: green; font: 15pt">*</span><span class="one">은행에
						방문할 수 있는지역</span><br>
					<div class="contentsmargin">
						<table>
							<tbody>
								<tr>
									<td><input type="checkbox" name="" value=""><span>서울</span></td>
									<td><input type="checkbox" name="" value=""><span>부산</span></td>
									<td><input type="checkbox" name="" value=""><span>대구</span></td>
									<td><input type="checkbox" name="" value=""><span>인천</span></td>
									<td><input type="checkbox" name="" value=""><span>광주</span></td>
								</tr>
								<tr>
									<td><input type="checkbox" name="" value=""><span>대전</span>
									</td>
									<td><input type="checkbox" name="" value=""><span>울산</span></td>
									<td><input type="checkbox" name="" value=""><span>경기</span></td>
									<td><input type="checkbox" name="" value=""><span>강원</span></td>
									<td><input type="checkbox" name="" value=""><span>충북</span></td>
								</tr>
								<tr>
									<td><input type="checkbox" name="" value=""><span>충남</span></td>
									<td><input type="checkbox" name="" value=""><span>전북</span>
									</td>
									<td><input type="checkbox" name="" value=""><span>전남</span></td>
									<td><input type="checkbox" name="" value=""><span>경북</span></td>
									<td><input type="checkbox" name="" value=""><span>경남</span></td>
								</tr>
								<tr>
									<td><input type="checkbox" name="" value=""><span>제주</span></td>
								</tr>
							</tbody>
						</table>

					</div>
					<span class="one">가입우대조건</span><br>
					<div class="contentsmargin">
						<span>(본인이 해당되는 우대조건을 선택하세요)</span><br>
						<table>
							<tbody>
								<tr>
									<th colspan="5"><span>#우대금리가능대상#</span></th>
								</tr>
								<tr>
									<td><input type="checkbox" name="" value=""><span>사회초년생</span>
									</td>
									<td><input type="checkbox" name="" value=""><span>입대예정자</span>
									</td>
									<td><input type="checkbox" name="" value=""><span>직업군인</span></td>
									<td><input type="checkbox" name="" value=""><span>군
											대체복무자</span></td>

								</tr>
								<tr>
									<td><input type="checkbox" name="" value=""><span>군
											의무복무병</span></td>
									<td><input type="checkbox" name="" value=""><span>임산부</span></td>
									<td><input type="checkbox" name="" value=""><span>대학생</span></td>
									<td><input type="checkbox" name="" value=""><span>고등학생</span></td>
								</tr>
								<tr>
									<td><input type="checkbox" name="" value=""><span>중학생</span></td>
									<td><input type="checkbox" name="" value=""><span>초등학생</span></td>
									<td><input type="checkbox" name="" value=""><span>미취학아동</span></td>
									<td><input type="checkbox" name="" value=""><span>세대주</span></td>
								</tr>
								<tr>
									<td><input type="checkbox" name="" value=""><span>외국인</span></td>
									<td><input type="checkbox" name="" value=""><span>결혼이민자</span></td>
									<td><input type="checkbox" name="" value=""><span>반려동물을
											키우는 자</span></td>
									<td><input type="checkbox" name="" value=""><span>다문화가정
											구성원</span></td>
								</tr>
								<tr>
									<td><input type="checkbox" name="" value=""><span>한
											부모 가족 보호 대상자</span></td>
									<td><input type="checkbox" name="" value=""><span>3대
											이상 가정 구성원</span></td>
									<td><input type="checkbox" name="" value=""><span>부모
											봉양자</span></td>
									<td><input type="checkbox" name="" value=""><span>소년소녀가장</span></td>

								</tr>
								<tr>
									<td><input type="checkbox" name="" value=""><span>우선돌봄
											차상위 대상자</span></td>
									<td><input type="checkbox" name="" value=""><span>차상위
											장애수당 대상자</span></td>
									<td><input type="checkbox" name="" value=""><span>차상위
											본인부담 경감 대상자</span></td>
									<td><input type="checkbox" name="" value=""><span>차상위
											자활 근로자</span></td>
								</tr>
								<tr>
									<td><input type="checkbox" name="" value=""><span>기초생활수급자</span></td>
									<td><input type="checkbox" name="" value=""><span>장애인</span></td>
									<td><input type="checkbox" name="" value=""><span>근로
											장려금 수급자</span></td>
									<td><input type="checkbox" name="" value=""><span>북한이탈주민</span></td>
								</tr>
								<tr>
									<td><input type="checkbox" name="" value=""><span>이북실향민</span><br></td>
								</tr>
								<tr>
									<td colspan="4"></td>
								</tr>
								<tr>
									<th colspan="4"><span>#비과세대상#</span></th>
								</tr>
								<tr>
									<td><input type="checkbox" name="" value=""><span>독립유공자(유가족포함)</span></td>
									<td><input type="checkbox" name="" value=""><span>국가유공상이자</span></td>
									<td><input type="checkbox" name="" value=""><span>고엽제후유증환자</span></td>
									<td><input type="checkbox" name="" value=""><span>5.18민주화운동부상자</span></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</form>
		</div>
		<div id="select">
			<span class="btn one">+α 은행</span> <span class="color one">주거래
				은행을 추가하고 우대금리 혜택을 받으세요</span>
			<button class="opener btn1">
				<span class="color one"> + 거래 중인 은행을 추가합니다.</span>
			</button>
		</div>
		<div id="select">
			<span class="btn one">+α 카드</span> <span class="color one">현재
				사용중인 카드 정보를 입력하고 혜택을 받으세요</span>
			<button class="opener btn1">
				<span class="color one"> + 사용중인 신용/체크카드를 추가합니다.</span>
			</button>
		</div>
		<div id="select">
			<span class="btn one">+α </span> <span class="color one">가입
				가능한 상품을 선택하고 우대금리 혜택을 받으세요</span>
			<button class="opener btn1">
				<span class="color one"> + 거래 중인 은행을 추가합니다.</span>
			</button>
		</div>

	</div>
</body>
</html>