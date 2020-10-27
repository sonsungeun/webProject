<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수입 입력</title>
<script type="text/javascript">
	function send_In(f) {
		f.action = "";
		f.submit();
	}
</script>
</head>
<body>
	<form action="">
		<span>날짜 : </span><input type="date" id=""><br> 
		<span>수입원 : </span><input type="text"><br> 
		<span>금액 : </span><input type="number"><span>원</span><br> 
		<input type="button"onclick="send_In(this.form)" value="저장">
		<input hidden="${mvo.mnickname}"> 
		<input hidden="${mvo.mid}"> 	
	</form>
</body>
</html>