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

#btn_container {
	display: inline-block;
	position: relative;
	width: 100%;
	margin-bottom: 10px;
}

#right_area {
	float: right;
}

#btn_container button {
	background-color: #f1f1f1;
	padding: 10px;
	border: none;
	border-radius: 5px;
	border: none;
	font-weight: bold;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	text-align: center;
	padding: 5px 0px;
}

.line {
	border-bottom: 2px solid #f1f1f1;
}

thead th {
	background-color: orange;
	font-size: 15px;
	font-weight: bold;
	padding: 10px 0px;
}

tfoot td {
	background-color: #f1f1f1;
	padding: 20px;
}
</style>
<script type="text/javascript">
	function write_go() {
		location.href = "board_write.jsp";
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
	<div id="wrapper_this">
		<div id="btn_container">
			<div id="right_area">
				<button onclick="write_go()">글쓰기</button>
			</div>
		</div>
		<hr>
		<br>
		<div id="list_container">
			<table summary="커뮤니티 게시판의 게시글 전체 목록을 가져옴">
				<thead>
					<tr>
						<th style="width: 10%">번호</th>
						<th style="width: 50%">제목</th>
						<th style="width: 15%">작성자</th>
						<th style="width: 15%">작성일</th>
						<th style="width: 10%">조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="line" style="width: 10%">1</td>
						<td class="line" style="width: 50%"><a
							href="board_onelist.jsp">안녕하세요</a></td>
						<td class="line" style="width: 15%">관리자</td>
						<td class="line" style="width: 15%">2020-09-22</td>
						<td class="line" style="width: 10%">0</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5">이곳은 페이징 기법이 적용될 곳</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</body>
</html>