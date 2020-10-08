<%@ page language="java" contentType="text/html; charset=UTF-8"
	 pageEncoding="UTF-8"%>
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

.nav{
	position: relative;
}

ul {
	margin: 0;
	padding: 0;
	overflow: hidden;
	list-style-type: none;
	background-color: #555;
}

li {
	float: left;
	
}

li a, .dropbutt {
	display: inline-block;
	color: white;
	text-align: center;
	padding: 16px 20px;
	text-decoration: none;
}

li a:hover, .dropdown:hover .dropbutt{
	background-color: orange;
}

.dropdown-content {
	display:none;
	background-color: #f9f9f9;
	position: absolute;
	left:0px;
	width:100%;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 16px 20px;
	text-decoration: none;
	display: block;
	text-align: left;
}



.dropdown-content a:hover {
	background-color: #f1f1f1;
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>
</head>
<body>
		<nav class="nav">
		<ul>
			<li style="color: orange"><a href="gomain.do">mainpage로</a></li>
			<li class="dropdown">
				<a class="dropbutt">moneymanager</a>
				<div class="dropdown-content">
						<a href="">App 소개</a>
						<hr style="border: solid 1px grey; width: 100%; border-style: solid none none none;" >
						<a href="">가계부</a>
						<hr style="border: solid 1px grey; width: 100%; border-style: solid none none none;" >
						<p style="padding-left: 16px; padding-top: 10px; padding-bottom: 5px; "><b>&nbsp;-&nbsp;소비생활 리포트</b></p>
						<a href="">주별리포트</a>
						<a href="">월별리포트</a>
						<hr style="border: solid 1px grey; width: 100%; border-style: solid none none none;">
						<a href="">내자산</a>
				</div></li>
			<li class="dropdown">
				<a class="dropbutt">내돈아끼기</a>
				<div class="dropdown-content">
						<p style="padding-left: 16px; padding-top: 10px; padding-bottom: 5px; "><b>&nbsp;-&nbsp;목돈만들기</b></p>
						<a href="godeposite.do">예금추천</a>
						<a href="gosavings.do">적금추천</a>
						<hr style="border: solid 1px grey; width: 100%; border-style: solid none none none;">
						<a href="gocard.do">카드추천</a>
						<hr style="border: solid 1px grey; width: 100%; border-style: solid none none none;">
						<a href="golending.do">대출추천</a>
				</div></li>
			<li class="dropdown">
				<a class="dropbutt">즐겨찾기</a>
				<div class="dropdown-content">
						<a href="goboard.do">게시판(커뮤니티)</a>
				</div></li>
		</ul>
		</nav>
</body>
</html>