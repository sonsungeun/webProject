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
	margin: 0px auto;
	position: relative;
	width: 1000px;
	position: relative;
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

table {
	width: 100%;
	margin-top: 50px;
	border-collapse: collapse;
	margin-bottom: 50px;
}

table, th, td {
	border: 1px solid black;
}
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
		<table>
			<thead>
				<tr>
					<th colspan="5"><span style="color: green">${res}</span></th>
				</tr>
				<tr>
					<th>순위</th>
					<th>금리</th>
					<th>은행이름</th>
					<th>상품이름</th>
					<th>자세한정보는?</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="k" items="${result}" varStatus="vs">
					<tr>
						<td>${vs.count}</td>
						<td>${k.intr_rate2}</td>
						<td>${k.kor_co_nm}</td>
						<td>${k.fin_prdt_nm}</td>
						<td><c:choose>
								<c:when test="${k.kor_co_nm=='수협은행'}">
									<a href="https://suhyup-bank.com/">상세정보보기</a>
								</c:when>
								<c:when test="${k.kor_co_nm=='중소기업은행'}">
									<a href="https://www.ibk.co.kr/">상세정보보기</a>
								</c:when>
								<c:when test="${k.kor_co_nm=='부산은행'}">
									<a href="https://www.busanbank.co.kr/ib20/mnu/BHP00001">상세정보보기</a>
								</c:when>
								<c:when test="${k.kor_co_nm=='대구은행'}">
									<a href="https://www.dgb.co.kr/dgb_ebz_main.jsp">상세정보보기</a>
								</c:when>
								<c:when test="${k.kor_co_nm=='전북은행'}">
									<a href="https://www.jbbank.co.kr/">상세정보보기</a>
								</c:when>
								<c:when test="${k.kor_co_nm=='경남은행'}">
									<a href="https://www.knbank.co.kr/ib20/mnu/BHP000000000001">상세정보보기</a>
								</c:when>
								<c:when test="${k.kor_co_nm=='우리은행'}">
									<a href="https://www.wooribank.com/">상세정보보기</a>
								</c:when>
								<c:when test="${k.kor_co_nm=='국민은행'}">
									<a href="https://www.kbstar.com/">상세정보보기</a>
								</c:when>
								<c:when test="${k.kor_co_nm=='신한은행'}">
									<a href="https://www.shinhan.com/index.jsp">상세정보보기</a>
								</c:when>
								<c:when test="${k.kor_co_nm=='하나은행'}">
									<a href="https://www.kebhana.com/">상세정보보기</a>
								</c:when>
								<c:when test="${k.kor_co_nm=='광주은행'}">
									<a href="https://pib.kjbank.com/ib20/mnu/BPB0000000001">상세정보보기</a>
								</c:when>
								<c:when test="${k.kor_co_nm=='농협은행주식회사'}">
									<a href="https://banking.nonghyup.com/nhbank.html">상세정보보기</a>
								</c:when>
								<c:when test="${k.kor_co_nm=='한국씨티은행'}">
									<a href="https://www.citibank.co.kr/ComMainCnts0100.act">상세정보보기</a>
								</c:when>
								<c:when test="${k.kor_co_nm=='한국산업은행'}">
									<a href="https://www.kdb.co.kr/index.jsp">상세정보보기</a>
								</c:when>
								<c:when test="${k.kor_co_nm=='제주은행'}">
									<a href="https://www.e-jejubank.com/JeJuBankInfo.do">상세정보보기</a>
								</c:when>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>