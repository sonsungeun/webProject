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
	margin-bottom: 30px;
}

#wrapper_this {
	margin: 0 auto;
	padding: 50px;
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

#btn_container {
	display: inline-block;
	position: relative;
	width: 1000px;
	padding-bottom: 10px;
}

#right_area {
	float: right;
}

#btn_container button {
	background-color: #f1f1f1;
	padding: 6px;
	border: none;
	border-radius: 5px;
	border: none;
}

#table_container {
	display: inline-block;
	box-sizing: border-box;
	padding: 30px;
	border: 1px solid #f1f1f1;
	border-radius: 5px;
	width: 1000px;
}

#onesboard {
	margin-bottom: 20px;
}

table {
	width: 100%;
}

th, td {
	padding: 3px;
}

#title {
	font-size: 26px;
}

#date {
	color: grey;
}

.line {
	padding: 3px 20px;
	border-top: 1px solid #f1f1f1;
}

#comment {
	padding: 0px 10px;
}

#comment_writer {
	border: 3px solid #ccc;
	border-radius: 5px;
	padding: 10px;
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
	<div id="wrapper_this">
		<div id="btn_container">
			<div id="right_area">
				<button onclick="">▲이전글</button>
				<button onclick="">▼다음글</button>
				<button onclick="javascript:location.href='board_list.jsp'">목록</button>
				<button onclick="javascript:location.href='board_write.jsp'">글쓰기</button>
			</div>
		</div>
		<div id="table_container">
			<!-- 원글  -->
			<div id="onesboard">
				<form method="get">
					<table>
						<thead>
							<tr>
								<th id="title" style="text-align: left;" colspan="3">제목구역</th>
							</tr>
							<tr>
								<th style="text-align: left;" colspan="3">아이디구역</th>
							</tr>
							<tr>
								<td id="date" style="width: 90%">작성일자 구역</td>
								<td style="width: 5%"><input type="button" value="수정"
									onclick="javascript:location.href='board_update.jsp'"
									style="border: none; background-color: #f1f1f1; border-radius: 3px; padding: 3px 6px;"></td>
								<td style="width: 5%"><input type="button" value="삭제"
									onclick=""
									style="border: none; background-color: #f1f1f1; border-radius: 3px; padding: 3px 6px;"></td>
							</tr>
							<tr>
								<th class="line" colspan="3"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="3"><pre>내용구역</pre></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<!-- 저장된 댓글 불러오기  -->
			<div id="comment">
				<form method="get">
					<table>
						<thead>
							<tr>
								<th class="line" colspan="2" style="text-align: left;">댓글&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" checked="checked" onclick="comment_desc()"
									id="desc" name="comment" value="">등록순&nbsp;&nbsp;<input
									type="radio" onclick="comment_asc()" id="asc" name="comment"
									value="">최신순
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="line" style="color: blue;" colspan="2">댓글작성자</td>
							</tr>
							<tr>
								<td style="width: 95%; padding-left: 20px;">댓글내용</td>
								<td style="width: 5%"><input type="button" value="삭제"
									style="border: none; background-color: #f1f1f1; border-radius: 3px; padding: 3px 6px;"></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<!-- 댓글작성  -->
			<div id="comment_writer">
				<form method="get">
					<table>
						<tbody>
							<tr>
								<td>로그인한 아이디</td>
							</tr>
							<tr>
								<td style="width: 85%"><input type="text"
									style="border: none;" size="120" placeholder="댓글을 남겨보세요"></td>
								<td style="text-align: right; width: 10%">0/500</td>
								<td style="width: 5%"><input type="button" value="등록"
									onclick=""
									style="border: none; background-color: #f1f1f1; border-radius: 3px; padding: 3px 6px;"></td>
							</tr>
					</table>
				</form>
			</div>
		</div>
		<!-- <footer> E-mail:euni060795@naver.com </footer> -->
</body>
</html>