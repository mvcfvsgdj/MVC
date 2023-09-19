<%@page import="goods.Goods"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹 페이지</title>

<style>
body {
	margin: 0;
	padding: 0;
}

.header {
	height: 150px;
	background-color: pink;
	color: white;
	text-align: center;
	line-height: 50px;
	padding: 10px;
}

.navbar {
	height: 70px;
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

.boardZone{

}
.tableStripedTop{
	text-align: center;
	border: 1px solid darkgray;
	
}

.tr1{
	background-color: gray; 
	text-align: center;
}

.footer {
	height: 200px;
	background-color: yellowgreen;
	color: black;
	text-align: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
	
	function send(code){
		
		$.ajax({
			type : "get",
			dataType : "json",
			url: "/MVC/goods.do",
			data: "code=" + code,
			success: function(data){
				
				$("#result").empty(); // 화면 전체 지우기
				
				let str1 = `<thead>
								<tr>
									<th colspan="6">
									<button>장바구니</button>
									</th>
								</tr>
								<tr>
									<th>상품번호</th>
									<th>상품브랜드</th>
									<th>상품명</th>
									<th>상품가격</th>
									<th>상품재고</th>
									<th></th>
								</tr>
						   </thead>			 
						   <tbody>`;
				
				for( let i=0; i< data.length ; i++){
					let item = data[i];
			
			             str1 += "<tr>";
			             str1  +=   "<td>"+item.goodsCode+"</td>" ;
			             str1  +=   "<td>"+item.goodsBrand+"</td>" ;
			             str1  +=   "<td>"+item.goodsName+"</td>" ;
			             str1  +=   "<td>"+item.goodsPrice+"</td>";
			             str1  +=   "<td>"+item.goodsStock+"</td>" ;
			             str1  +=   "<td><button>담기</button><button>주문</button></td>" ;
			             str1  += "</tr>";
				}	 
				
				str1  += "</tbody>";	
				
				$("#result").append(str1);
			},
			error:function(){
				alert("요청 실패");
			}
		});
	}	
	
</script>
</head>


<body>


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
	
	<nav>
		<button value="0" onclick="send(0)">삼성</button>
		<button value="1" onclick="send(1)">애플</button>
		<button value="3" onclick="send(2)">전체</button>
		<button value="4" >게시판</button>
	</nav>

	<section>
		<form>
			<table id = "result">
				
			</table>
		 </form>
	</section>



	







	<footer class="footer">
		<p>핸드폰판매 고객센터 이용약관 쇼핑몰 이용약관 개인정보 처리방침 회사정보 회사명에이콘통신 대표조은경</p>
		<p>사업자번호181-22-01015 주소 서울특별시 마포구 양화로 122 4층 개인정보관리책임자 조은경 이메일</p>
		<p>ekzzang@naver.com 판매제휴업체 SKT - 밀수 / KT - 밀수 / LGU+ - 밀수 대표
			김병진,김민규</p>
		<p>사업자번호845-82-01440 통신판매업신고번호 : 제2023-서울마포-0015호</p>
	</footer>
</body>
</html>

