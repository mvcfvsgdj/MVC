<%@ page import="Seller.Goods"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="Seller.PageHandler" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
    
    <%
    PageHandler handler = (PageHandler)request.getAttribute("handler"); 
    ArrayList<Goods> list = (ArrayList<Goods>)request.getAttribute("list");
    %>
    
    <form action="/TeamProject/goodsRegister"><button> </button></form>
    <form action="/TeamProject/goodsAlter"><button>수정</button></form>
    <h1>판매자 메인 페이지</h1>
    <table border="1">
        <tr>
        	<th>번호</th>
            <th>상품 코드</th>
            <th>브랜드</th>
            <th>상품명</th>
            <th>가격</th>
            <th>재고</th>
            <th>관리</th>
        </tr>
        
        <% for (Goods g : list) { %>
            <tr>
            	<td><%= g.getNum() %>
                <td><%= g.getGoodsCode() %></td>
                <td><%= g.getGoodsBrand() %></td>
                <td><%= g.getGoodsName() %></td>
                <td><%= g.getGoodsPrice() %></td>
                <td><%= g.getGoodsStock() %></td>
                <td>
                <a href="/TeamProject/goodsDelete?goodsCode=<%= g.getGoodsCode()%>"><button>삭제</button></a>
                </td>
            </tr>
        <% } %>
    </table>
    
<% 
int index = handler.getGrpStartPage();

if(handler.getCurrentGrp()>1){ %>
<a href="/TeamProject/seller?p=<%=index-1%>">[이전]</a>
	<%
}
while(index <= handler.getGrpEndPage()){
	%>
	<a href="/TeamProject/seller?p=<%=index %>">[<%=index %>]</a>
	<%index++;
 }
 if(handler.getGrpEndPage()<handler.getTotalPage()){
	 %>
	<a href="/TeamProject/seller?p=<%=handler.getGrpEndPage()+1 %>">[다음]</a>
 <%}
 %>
</body>
</html>