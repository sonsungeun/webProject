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
.check_t, .check_t td {
	border-collapse: collapse;
	border: 1px solid #ccc;
}

.btn3 {
	border: none;
	width: 100%;
	background-color: #efefef;
	color: black;
}

.onclick {
	background-color: green;
	color: white;
	border: none;
	width: 100%;
}
</style>
<script type="text/javascript">
   var list = ["1만원","2만원","3만원","5만원","10만원","15만원","20만원","30만원"];
   var id_list = ["chk_0","chk_1","chk_2","chk_3","chk_4","chk_5","chk_6","chk_7"];
	
</script>
</head>
<body>
	<table class="check_t">
		<tbody>
			<tr>
				<td><button class="btn3" id="chk_0">1만원</button></td>
				<td><button class="btn3" id="chk_1">2만원</button></td>
				<td><button class="btn3" id="chk_2">3만원</button></td>
			</tr>
			<tr>
				<td><button class="btn3" id="chk_3">5만원</button></td>
				<td><button class="btn3" id="chk_4">10만원</button></td>
				<td><button class="btn3" id="chk_5">15만원</button></td>
			</tr>
			<tr>
				<td><button class="btn3" id="chk_6">20만원</button></td>
				<td><button class="btn3" id="chk_7">30만원</button></td>
			</tr>
		</tbody>
</body>
</html>