<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
	height:150px;
	overflow: scroll;
	overflow-x:hidden; 
}
div .r3 {
	border: 1px solid #ccc;
	padding: 3px;
}
.r4{
	width:100%;
	border: none;
	background-color: #555;
	padding: 15px;
}
</style>
</head>
<body>
			<div class="result_container">
				<div class="r1">
					<font size="12" style="font-weight: bold;">나의 입력현황</font>
				</div>
				<div class="r2">
					<font size="12" style="font-weight: bold;">아직 입력된 결과가 없습니다.</font>
				</div>
				<div class="r3">
					<br>
				</div>
				<button class="r4" onclick=""><span class="two">결과보기</span></button>
			</div>
</body>
</html>