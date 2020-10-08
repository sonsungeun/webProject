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
	background-color: #6CBCF5;
	color: white;
	border-radius: 1px;
}

.color {
	color: #6CBCF5;
}

a {
	text-decoration: none;
}

img {
	border: 0px;
}

body {
	margin: 0 auto;
	background-color: #efefef;
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
	margin: 0 auto;
	padding: 60px 0px 0px 0px;
	width: 1000px;
	position: relative;
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

div .selection_container, .opener {
	background-color: white;
	margin-top: 10px;
	margin-right: 30px;
	box-sizing: border-box;
	padding: 15px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

div .contentsmargin {
	margin-top: 5px;
	margin-bottom: 20px;
}

div #result {
	float: right;
	margin-top: 10px; box-sizing : border-box;
	position: relative;
	box-sizing: border-box;
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

.btn2 {
	border: none;
	width: 550px;
	background-color: #ddd;
}

.hr_1 {
	margin: 5px 0px;
	border-style: solid none none none;
	border-top: 3px solid #6CBCF5;
}

.input_font {
	font-size: 15pt;
	color: #6CBCF5;
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

div .edit1 {
	background-color: white;
	margin-top: 5px;
	margin-right: 30px;
	box-sizing: border-box;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.w_div {
	width: 180px;
	display: inline-block;
	padding: 1.5px;
	box-sizing: border-box;
}

.w_1 {
	float: left;
}

.w_2 {
	left: 180px;
	float: left;
}

.w_3 {
	left: 360px;
	float: left;
}

.name_style {
	margin-top: 10px;
	margin-bottom: 5px;
	display: inline-block;
	font-size: 11pt;
	width: 100%;
	text-align: center;
	width: 100%;
}

.click_result {
	width: 150px;
	display: inline-block;
	margin: 0px 10px;
	box-sizing: border-box;
	background-color: orange;
	color: white;
	font-size: 11pt;
	font-weight: bold;
	text-align: center;
	padding: 5px 0px;
	margin: 0px 10px;
}

/* 팝업창 */
</style>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('div.beforeMouseOver').hover(function() {
			$(this).children('.afterMouseOver').fadeIn();
		}, function() {
			$(this).children('.afterMouseOver').fadeOut();
		});
	});
</script>
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
				<div class="selection_container">
					<span style="color: #6CBCF5; font: 15pt">*</span><span class="one">어떤카드를
						찾으세요</span><br>
					<div class="contentsmargin">
						<input type="checkbox" name="" value=""><span>신용</span>&nbsp;&nbsp;
						<input type="checkbox" name="" value=""><span>체크</span>
						&nbsp;&nbsp;<input type="checkbox" name="" value=""><span>하이브리드</span>
						&nbsp;&nbsp;
					</div>
					<span style="color: #6CBCF5; font: 15pt">*</span><span class="one">어떤
						혜택 원하세요</span><br>
					<div class="contentsmargin">
						<input type="radio" name="benefits" value=""><span>할인/적립</span>&nbsp;&nbsp;
						<input type="radio" name="benefits" value=""><span>항공마일리지</span>
					</div>
					<span style="color: #6CBCF5; font: 15pt">*</span><span class="one">월
						평균 카드 사용금액 </span><br>
					<div class="contentsmargin">
						<table>
							<tr>
								<td width="90%" style="text-align: right;"><input
									type="number" class="input_font" value="0" name=""></td>
								<td width="5%" style="text-align: right;"><span class="one">원</span></td>
								<td width="5%"><input type="button" value="X"></td>
							</tr>
						</table>
						<hr class="hr_1">
					</div>
				</div>
			</form>
		</div>
		<div id="select">
			<span class="btn one">개인화</span> <span class="color one">정확한
				추천을 위한 소비패턴 입력항목입니다.</span><br>
			<div style="margin-top: 30px">
				<span class="one"> 대중교통</span>
			</div>
			<div class="edit1">
				<div style="width: 100%">
					<div class="w_div w_1">
						<span class="name_style">버스</span><br>
						<div class="beforeMouseOver">
							<span class="click_result" id="r_bus">월 200,000원</span><br>
							<img alt=""
								src="https://dummyimage.com/180x100/ffb300/000000.jpg">
						</div>
						<div class="aftereMouseOver" style="opacity: 0;"></div>

					</div>
					<div class="w_div w_2">
						<span class="name_style">지하철</span><br>
					</div>
					<div class="w_div w_3">
						<span class="name_style">택시</span><br>
					</div>
				</div>
				<button class="opener btn2">
					<span class="color one"> + 가맹점 더보기</span>
				</button>
			</div>

		</div>


	</div>
</body>
</html>