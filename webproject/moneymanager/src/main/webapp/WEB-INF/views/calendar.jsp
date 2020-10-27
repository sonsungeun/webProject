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
}

#wrapper_mainsec {
	margin: 0 auto;
	position: relative;
}

section{
	display:inline-block;
	float: left;
}
footer {
	background-color: #f1f1f1;
	padding: 20px 0px;
	text-align: center;
}

.btn{
	margin: 3px 20px;
	padding:10px 30px;
	background: orange;
}


table {
	border: 1px solid black;
}

td, th {
	border: 1px solid skyblue;
}

td {
	width: 100px;
	height: 70px;
}

#m_in {
	color: red;
}

#m_out {
	color: green;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	var today = null;
	var year = null;
	var month = null;
	var date = null;
	var firstday = null;
	var lastday = null;
	var $tdDay = null;
	var $tdMoney = null;
	$(function() {
		initDate();
		drawDays();
		$("#move_PrevMonth").click(function() {
			movePrevMonth();
		});
		$("#move_NextMonth").click(function() {
			moveNextMonth();
		});
	});
	// 날짜 초기화
	function initDate() {
		$tdDay = $(".cal_day")
		$tdMoney = $(".cal_money")
		dayCount = 0;
		today = new Date();
		year = today.getFullYear();
		month = today.getMonth() + 1;
		firstDay = new Date(year, month - 1, 1);
		lastDay = new Date(year, month, 0);
	}

	//calendar 날짜 표시+오늘날짜 하이라이트
	function drawDays() {
		$("#cal_top_year").html(year + "년 ");
		$("#cal_top_month").html(month + "월");
		for (var i = firstDay.getDay(); i < firstDay.getDay()
				+ lastDay.getDate(); i++) {
			++dayCount;
			$tdDay.eq(i).html(dayCount);
			/*오늘날짜 하이라이트 			var j = i;
			 if (dayCount==today.getDate()) {
			 $("#today").eq(j).css("border","2px solid red");
			 }  */
		}
		for (var i = 0; i < 42; i += 7) {
			$tdDay.eq(i).css("color", "red");
		}
		for (var i = 6; i < 42; i += 7) {
			$tdDay.eq(i).css("color", "blue");
		}
	}
	// 정보 갱신
	function getNewInfo() {
		for (var i = 0; i < 42; i++) {
			$tdDay.eq(i).html("");
		}
		dayCount = 0;
		firstDay = new Date(year, month - 1, 1);
		lastDay = new Date(year, month, 0);
		drawDays();
	}
	// calendar 월 이동
	function movePrevMonth() {
		month--;
		if (month <= 0) {
			month = 12;
			year--;
		}
		getNewInfo();
	}
	function moveNextMonth() {
		month++;
		if (month > 12) {
			month = 1;
			year++;
		}
		getNewInfo();
	}
	
	// 지출 입력창 열기
	function openOut() {
		 // window.open("open할 window", "자식창 이름", "팝업창 옵션");
		window.open("goout.do","inputO","width=350, height=550, resizable = no, scrollbars = no");
	}
	// 수입 입력창 열기
	function openIn() {
		window.open("goin.do","inputI","width=350, height=550, resizable = no, scrollbars = no");
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
		<section id="calsec">
			<table>
				<thead>
					<tr>
						<th colspan="7">
							<div class="cal_top">
								<a href="#" id="move_PrevMonth"><span>&lt;</span></a> <span
									id="cal_top_year"></span> <span id="cal_top_month"></span> <a
									href="#" id="move_NextMonth"><span>&gt;</span></a>
							</div>
						</th>
					</tr>
					<tr>
						<th style="color: red;">Sunday</th>
						<th>Monday</th>
						<th>Tuesday</th>
						<th>Wednesday</th>
						<th>Thursday</th>
						<th>Friday</th>
						<th style="color: blue;">Saturday</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach begin="1" end="6" step="1">
						<tr>
							<c:forEach begin="1" end="7" step="1">
								<td id="today">
									<div class="cal_day"></div>
									<div class="cal_money">
										<span id="m_in"></span><span id="m_out"></span>
									</div>
								</td>
							</c:forEach>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
		<section id="clksec" style="background-color: yellow">
		<button onclick="openOut()" class="btn">지출</button>
		<button onclick="openIn()" class="btn">수입</button>
		</section>
	</div>
</body>
</html>