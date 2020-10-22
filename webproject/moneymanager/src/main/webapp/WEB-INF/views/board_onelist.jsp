<%@page import="com.ict.db.BVO"%>
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
	font-size: 24px;
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
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function boarddelete_go(f) {
		var chk = confirm("이 게시글을 정말 삭제할까요?");
		if (chk == true) {
			f.action = "boarddelete_ok.do";
			f.submit();
		}
	}

	function comment_ok(f) {
		f.action = "commentinsert.do?cPage=${cPage}&b_idx=${bvo.b_idx}";
		f.submit();
	}

	function go_cmt_del(f) {
		var chk = confirm("댓글을 정말 삭제할까요?");
		if (chk==true) {
			f.action = "commentdelete.do?cPage=${cPage}&b_idx=${bvo.b_idx}";
			f.submit();
		}
	}
	
	function boardwrite_go() {
		var login = '${mvo}';
		if(login == null){
			alert("로그인 후에 작성이 가능합니다.");
			javascript:location.href='login.do';
		}else {
			javascript:location.href='goboardwrite.do';
		}
	}
</script>
<script type="text/javascript">
	$(function() {
		$("#textarea").keyup(function() {
			var mytext = $(this).val();
			$("#textscan").html("(" + mytext.length + " /200)");
			if (mytext.length > 200) {
				alert("댓글의 내용은 최대 200자 까지만 입력할 수 있습니다.");
				$(this).val(mytext.substring(0, 200));
				$("#textscan").html("(200 / 200)");
			}
		});
		$("#textarea_nologin").click(function() {
			alert("로그인 후에 작성이 가능합니다.")
			location.href = "login.do";
		})
	});
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
				<button onclick="">▲이전글</button>
				<button onclick="">▼다음글</button>
				<button
					onclick="javascript:location.href='goboard.do?cPage=${cPage}'">목록</button>
				<button onclick="boardwrite_go()">글쓰기</button>
			</div>
		</div>
		<div id="table_container">
			<!-- 원글  -->
			<div id="onesboard">
				<form method="get">
					<table>
						<thead>
							<tr>
								<th id="title" style="text-align: left;" colspan="3">${bvo.title}</th>
							</tr>
							<tr>
								<th style="text-align: left;" colspan="3">글쓴이 :
									${bvo.mnickname}</th>
							</tr>
							<tr>
								<td id="date" style="width: 90%">${bvo.regdate}</td>
								<c:choose>
									<c:when test="${mvo.mnickname==bvo.mnickname}">
										<td style="width: 5%"><input type="button" value="수정"
											onclick="javascript:location.href='goboardupdate.do'"
											style="border: none; background-color: #f1f1f1; border-radius: 3px; padding: 3px 6px;"></td>
										<td style="width: 5%"><input type="button" value="삭제"
											onclick="boarddelete_go(this.form)"
											style="border: none; background-color: #f1f1f1; border-radius: 3px; padding: 3px 6px;">
											<input type="hidden" value="${bvo.b_idx}" name="b_idx">
											<input type="hidden" value="${cPage}" name="cPage"></td>
									</c:when>
									<c:otherwise>
										<td style="width: 5%"></td>
										<td style="width: 5%"></td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr>
								<th class="line" colspan="3"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<!-- ckeditor 써서 보이는게 예쁜지 아니면 그냥 아무것도 없는게 예쁜지 잘 모르겠음 -->
								<td colspan="3"><script
										src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
									<textarea name="content" readonly><pre>${bvo.content}</pre></textarea>
									<script>
										CKEDITOR.replace('content');
									</script></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<!-- 저장된 댓글 불러오기  -->
			<div id="comment">

				<table>
					<thead>
						<tr>
							<th class="line" colspan="3" style="text-align: left;">댓글&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" checked="checked" onclick="comment_desc()"
								id="desc" name="comment" value="">등록순&nbsp;&nbsp;<input
								type="radio" onclick="comment_asc()" id="asc" name="comment"
								value="">최신순
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="k" items="${c_list}">
							<form method="post">
							<tr>
								<td class="line" style="color: blue; width: 10%;">${k.writer}</td>
								<td class="line" style="width: 85%;">${k.write_date}</td>
								<td class="line" style="width: 5%;"></td>
							</tr>
							<tr>
								<td style="width: 95%; padding-left: 20px;" colspan="2">${k.contents}</td>
								<td style="width: 5%"><c:if
										test="${k.writer==mvo.mnickname}">
										<input type="button" value="삭제"
											style="border: none; background-color: #f1f1f1; border-radius: 3px; padding: 3px 6px;"
											onclick="go_cmt_del(this.form)">
									</c:if> <input type="hidden" value="${k.c_idx}" name="c_idx">
									<input type="hidden" value="${k.b_idx}" name="b_idx"> <input
									type="hidden" value="${cPage}" name="cPage"></td>
							</tr>
							</form>
						</c:forEach>
					</tbody>
				</table>

			</div>
			<!-- 댓글작성  -->
			<div id="comment_writer">
				<form method="post">
					<table>
						<tbody>
							<tr>
								<td>${mvo.mnickname}</td>
							</tr>
							<tr>
								<c:choose>
									<c:when test="${empty mvo}">
										<td style="width: 85%"><input type="text"
											style="border: none;" size="120"
											placeholder="로그인 후 댓글을 남겨보세요" id="textarea_nologin"
											name="contents"></td>
										<td style="text-align: right; width: 10%"><span
											id="textscan">(0 / 200)</span></td>
										<td style="width: 5%"><input type="button" value="등록"
											onclick="comment_ok(this.form)"
											style="border: none; background-color: #f1f1f1; border-radius: 3px; padding: 3px 6px;">
											<input type="hidden" name="writer" value="${mvo.mnickname}"></td>
									</c:when>
									<c:otherwise>
										<td style="width: 85%"><input type="text"
											style="border: none;" size="120" placeholder="댓글을 남겨보세요"
											id="textarea" name="contents"></td>
										<td style="text-align: right; width: 10%"><span
											id="textscan">(0 / 200)</span></td>
										<td style="width: 5%"><input type="button" value="등록"
											onclick="comment_ok(this.form)"
											style="border: none; background-color: #f1f1f1; border-radius: 3px; padding: 3px 6px;">
											<input type="hidden" name="writer" value="${mvo.mnickname}"></td>
									</c:otherwise>
								</c:choose>
							</tr>
					</table>
				</form>
			</div>
		</div>
		<!-- <footer> E-mail:euni060795@naver.com </footer> -->
</body>
</html>