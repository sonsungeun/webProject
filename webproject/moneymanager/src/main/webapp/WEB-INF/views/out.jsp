<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지출 입력</title>
<script type="text/javascript">
	function send_Out(f) {
		f.action="";
		f.submit();
		window.close();
	}
</script>
</head>
<body>
	<form method="post">
		<span>날짜 : </span><input type="date" name=""><br>
		<span>사용내역 : </span><input type="text"><br>
		<span>금액 : </span><input type="number"><span>원</span><br>
		<input type="button" onclick="send_Out(this.form)" value="저장">
		<input hidden="${mvo.mnickname}"> 
		<input hidden="${mvo.mid}"> 
	</form>
</body>
</html>