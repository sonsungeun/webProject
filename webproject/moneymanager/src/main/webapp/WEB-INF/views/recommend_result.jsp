<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
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
					<td></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>