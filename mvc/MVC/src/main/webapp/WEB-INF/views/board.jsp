<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Board.boardDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Board.Question"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판( •̀ ω •́ )✧</title>
<link href="<%=request.getContextPath()%>/css/board.css"
	rel="stylesheet" />
	<style >
	body {
	margin: 0;
	padding: 0;
}

.header {
	height: 100px;
	background-color: blue;
	color: white;
	text-align: center;
	line-height: 50px;
	padding: 10px;
}

.navbar {
	height: 40px;
	background-color: gray;
	color: white;
	line-height: 20px;
}

.navbar ul {
	list-style-type: none;
	padding: 0;
	display: flex;
	justify-content: space-between;
}

.navbar .left {
	
}

.navbar .right {
	
}

.navbar li {
	display: inline;
	margin-right: 10px;
}

.body {
	height: 500px;
	background-color: bluesky;
	text-align: center;
	padding-top: 50px;
}

.boardZone {
	
}

.tableStripedTop {
	text-align: center;
	border: 1px solid darkgray;
}

.tr1 {
	background-color: gray;	
	text-align: center;	
	width: 99%;
}

.tdTitle {
	text-decoration-line: none;
}
.tdId{
	text-decoration: none;
}

.footer {
	height: 200px;
	background-color: yellowgreen;
	color: black;
	text-align: center;
}
	
	</style>
	
</head>
<body>

	<div class="header">
		<h1>핸드폰창고</h1>
	</div>
	<div class="navbar">
		<ul>
			<div class="left">
				<li>삼성</li>
				<li>애플</li>
				<li><a href="<%=request.getContextPath()%>/board">게시판</a></li>
				<li><a href="<%=request.getContextPath()%>/home">전체</a></li>
			</div>
			<div class="right">
				      <%
            String inputId = (String) session.getAttribute("Id"); %>
        <%    if (inputId == null) {
            %>
            <a href="<%=request.getContextPath()%>/login">로그인</a>
            <%
            } else {
            %>
            <a href="<%=request.getContextPath()%>/logout">로그아웃</a>
            <%
            }
            %>
            <a href="<%=request.getContextPath() %>/signup">회원가입</a>
			</div>
		</ul>
	</div>

	<div class="container">
		<div class="row">
			<table class="table tableStriped"
				style="text-align: center; border: 1px solid darkgray">
				<thead>
					<tr>
						<th style="background-color: gray; text-align: center;">번호</th>
						<th style="background-color: gray; text-align: center;">제목</th>
						<th style="background-color: gray; text-align: center;">작성자</th>
						<th style="background-color: gray; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
					ArrayList<Question> list = (ArrayList<Question>) request.getAttribute("list");
					%>
					<%
					for (Question b : list) {
					%>

					<tr>
						<td><%=b.getQuestionCode()%></td>
						<form action="<%=request.getContextPath()%>/readServlet"
							method="post">
							<input type="hidden" name="" id="" value="">
							<td class="tdTitle"><a type="questionCode" href="<%=request.getContextPath()%>/read?questionCode =<%=b.getQuestionCode()%>"><%=b.getTitle()%></a></td>
							<td class="tdId"><a href="<%=request.getContextPath()%>/myPage"><%=b.getBuyerId()%></a></td>
						</form>
						<td><%=b.getWriteDate()%></td>
					</tr>
					<%
					}
					%>

				</tbody>
			</table>
			<a href="<%=request.getContextPath()%>/write"
				class="btn btnPrimary pullRight">글쓰기</a>
		</div>
	</div>

	<div class="footer">
		<p>핸드폰판매 고객센터 이용약관 쇼핑몰 이용약관 개인정보 처리방침 회사정보 회사명에이콘통신 대표 조은경</p>
		<p>사업자번호181-22-01015 주소 서울특별시 마포구 양화로 122 4층 개인정보관리책임자 박태민 이메일</p>
		<p>ekzzang@naver.com 판매제휴업체 SKT - 밀수 / KT - 밀수 / LGU+ - 밀수 대표
			김병진,김민규</p>
		<p>사업자번호845-82-01440 통신판매업신고번호 : 제2023-서울마포-0015호</p>
	</div>
</body>
</html>

