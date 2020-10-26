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
	background-color: orange;
	color: white;
	border-radius: 1px;
}

.color {
	color: orange;
}

a {
	text-decoration: none;
}

img {
	border: 0px;
}

body {
	background: #efefef;
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
	padding-top: 50px;
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
	margin-top: 10px;
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
	border-top: 3px solid orange;
}

.input_font {
	font-size: 15pt;
	color: orange;
	font-weight: bold;
	border: none;
	text-align: right;
}

.two {
	color: white;
	font-size: 15pt;
	font-weight: bold;
}

div .result_container {
	background-color: white;
	margin-top: 10px;
	margin-right: 30px;
	box-sizing: border-box;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	overflow-x: hidden;
	z-index: 1;
}

div .r1 {
	width: 300px;
	border: 1px solid #ccc;
	padding: 15px;
}

div .r2 {
	border: 1px solid #ccc;
	padding: 15px;
	height: 150px;
	overflow: scroll;
	overflow-x: hidden;
}

div .r3 {
	border: 1px solid #ccc;
	padding: 3px;
}

.r4 {
	width: 100%;
	border: none;
	background-color: #555;
	padding: 15px;
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
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	var month;
	var depositemoney;
	var channel;
	var gender;
	var birth;
	var area;
	var prefential;

	$(document)
			.ready(
					function() {
						var r2 = document.querySelector(".r2");
						var mydiv1, mydiv2, mydiv3, mydiv4, mydiv5, mydiv6, mydiv7;

						// 가입기간 결과출력
						$("input[name='month']")
								.change(
										function() {
											$("#result_f").empty();
											mydiv1 = document
													.createElement("div");
											mydiv1.setAttribute("id", "mydiv1");
											r2.appendChild(mydiv1);
											month = $(this).val();
											var table = "<table style='width: 100%'><tbody><tr><th>가입기간 :</th><td>"
													+ month
													+ "개월</td><td><input type='button' id='delbtn' value=' X '/></td></tr></tbody></table>";
											$("#mydiv1").html(table);
										});

						//  결과출력
						$("input[name='depositemoney']")
								.change(
										function() {
											$("#result_f").empty();
											mydiv2 = document
													.createElement("div");
											mydiv2.setAttribute("id", "mydiv2");
											r2.appendChild(mydiv2);
											depositemoney = $(this).val();
											// 금액에 , 붙이기
											var money = comma(depositemoney);
											var table = "<table style='width: 100%'><tbody><tr><th>예치금 :</th><td>"
													+ money
													+ "원</td><td><input type='button' id='delbtn' value=' X '/></td></tr></tbody></table>";
											$("#mydiv2").html(table);

										});

						// 가입경로 결과출력
						function update_channel() {
							$('input[name=channel]:checked').each(function() {
								channel += $(this).val() + ",";
							});
							channel = channel.substring(0, channel.length - 1);
							mydiv3 = document.createElement("div");
							mydiv3.setAttribute("id", "mydiv3");
							r2.appendChild(mydiv3);
							var table = "<table><tbody><tr><th>가입경로 :</th><td>"
									+ channel
									+ "</td><td><input type='button' id='delbtn' value=' X '/></td></tr></tbody></table>";
							$("#mydiv3").html(table);
						}
						$('input[name=channel]').change(function() {
							$("#result_f").empty();
							channel = "";
							update_channel();
						});

						// 성별 결과출력
						$("input[name='gender']")
								.change(
										function() {
											$("#result_f").empty();
											mydiv4 = document
													.createElement("div");
											mydiv4.setAttribute("id", "mydiv4");
											r2.appendChild(mydiv4);
											gender = $(this).val();
											var table = "<table style='width: 100%'><tbody><tr><th>성별 :</th><td>"
													+ gender
													+ "</td><td><input type='button' id='delbtn' value=' X '/></td></tr></tbody></table>";
											$("#mydiv4").html(table);
										});

						// 생년월일 결과출력
						$("input[name='birth']")
								.change(
										function() {
											$("#result_f").empty();
											mydiv5 = document
													.createElement("div");
											mydiv5.setAttribute("id", "mydiv5");
											r2.appendChild(mydiv5);
											birth = $(this).val();
											var table = "<table style='width: 100%'><tbody><tr><th>생년월일 :</th><td>"
													+ birth
													+ "(만 "
													+ 00
													+ "세)</td><td><input type='button' id='delbtn' value=' X '/></td></tr></tbody></table>";
											$("#mydiv5").html(table);
										});
						// 방문가능지역 결과출력
						function update_area() {
							$('input[name=area]:checked').each(function() {
								area += $(this).val() + ",";
							});
							mydiv6 = document.createElement("div");
							mydiv6.setAttribute("id", "mydiv6");
							area = area.substring(0, area.length - 1);
							r2.appendChild(mydiv6);
							var table = "<table style='width: 100%'><tbody><tr><th>방문가능지역 :</th><td>"
									+ area
									+ "</td><td><input type='button' id='delbtn' value=' X '/></td></tr></tbody></table>";
							$("#mydiv6").html(table);
						}
						$('input[name=area]').change(function() {
							$("#result_f").empty();
							area = "";
							update_area();
						});

						// 우대조건 결과출력
						function update_prefential() {
							$('input[name=prefential]:checked').each(
									function() {
										prefential += $(this).val() + ",";
									});
							mydiv7 = document.createElement("div");
							mydiv7.setAttribute("id", "mydiv7");
							$("#mydiv7").css("overflow", "hidden");
							prefential = prefential.substring(0,
									prefential.length - 1);
							r2.appendChild(mydiv7);
							var table = "<table style='width: 100%'><tbody><tr><th>가입우대조건 :</th><td>"
									+ prefential
									+ "</td><td><input type='button' id='delbtn' value=' X '/></td></tr></tbody></table>";
							$("#mydiv7").html(table);
							$("#mydiv7").css("overflow-x", "hidden");
						}
						$('input[name=prefential]').change(function() {
							$("#result_f").empty();
							prefential = "";
							update_prefential();
						});
					});

	function recommand_start() {
		/* if (month!=null && depositemoney!=null && channel!=null && prefential!=null && area!=null && gender!=null && birth!=null ) { */
		$.ajax({
			url : "recommend_depos.do?month=" + month + "&depositemoney="
					+ depositemoney + "&channel=" + channel + "&gender="
					+ gender + "&birth=" + birth + "&area=" + area
					+ "&prefential=" + prefential,
			method : "get",
			dataType : "text",
			success : function(data) {

				location.href = "recommend_depos_res.do";
			},
			error : function() {
				alert("읽기실패");
			}
		});
		/* 		}else {
		 alert("필수 입력사항을 입력해주세요");
		 } */
	}

	// 화폐 단위 , 삽입
	function comma(num) {
		var len, point, str;
		num = num + ""; // 숫자형 to 문자형
		point = num.length % 3; // 3자리씩 띄고 남은 나머지, 맨 앞자리 계산용
		len = num.length; // num의 총 길이
		str = num.substring(0, point); // 맨 앞자리 뺀  나머지 숫자열에 , 붙이기 위함
		while (point < len) {
			if (str != "")
				str += ","; // 나머지 0일때만 ,안붙임 이외의 경우에는 str(맨앞자리)뒤에 ,삽입
			str += num.substring(point, point + 3); // 이다음 세자리 숫자 붙임
			point += 3; // ,를 붙이기 위해서 똑같은 나머지로 다시 만듦;
		}
		return str;
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

	<div id="wrapper_mainsec">
		<div class="mystyle">
			<span class="btn one">기본</span> <span class="color one">필수 입력
				항목입니다</span>
		</div>
		<div id="result">
			<div class="result_container">
				<div class="r1">
					<font size="12" style="font-weight: bold;">나의 입력현황</font>
				</div>
				<div class="r2">
					<font size="12" style="font-weight: bold;" id="result_f">아직
						입력된 결과가 없습니다.</font>
				</div>
				<div class="r3">
					<br>
				</div>
				<button class="r4" onclick="recommand_start()">
					<span class="two">결과보기</span>
				</button>
			</div>
		</div>
		<div id="select">
			<form action="">
				<div id="gibon_container">
					<span style="color: orange; font: 15pt">*</span><span class="one">가입기간</span><br>
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
					<span style="color: orange; font: 15pt">*</span><span class="one">월
						납입금액</span><br>
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
					<span style="color: orange; font: 15pt">*</span><span class="one">원하는
						가입경로</span><br>
					<div class="contentsmargin">
						<input type="checkbox" name="" value=""><span>모바일뱅킹</span>&nbsp;&nbsp;
						<input type="checkbox" name="" value=""><span>영업점</span>
						&nbsp;&nbsp;<input type="checkbox" name="" value=""><span>인터넷뱅킹</span>
						&nbsp;&nbsp;<input type="checkbox" name="" value=""><span>콜센터</span>
					</div>
					<span style="color: orange; font: 15pt">*</span><span class="one">성별</span><br>
					<div class="contentsmargin">
						<input type="radio" name="gender" value=""><span>남자</span>&nbsp;&nbsp;
						<input type="radio" name="gender" value=""><span>여자</span>
					</div>
					<span style="color: orange; font: 15pt">*</span><span class="one">생년월일</span><br>
					<div class="contentsmargin">
						<input type="text">
					</div>
					<span style="color: orange; font: 15pt">*</span><span class="one">은행에
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