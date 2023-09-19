<%@ page import="Seller.Goods"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
    
    <%
    ArrayList<Goods> list = (ArrayList<Goods>)request.getAttribute("list");
    %>
    <form action = "/MVC/seller"><button>판매자페이지로</button></form>
    <form action="/MVC/goodsAlter"><button>수정 페이지로</button></form>
    <form action = "/MVC/goodsRegister" method = "post">
    상품코드<input type="text" name="goodsCode"><br>
    브랜드 <select name="goodsBrand">
        <option value="0">0:삼성</option>
        <option value="1">1:애플</option>
    </select><br>
    상품명<input type="text" name="goodsName"><br>
    가격<input type="text" name="goodsPrice"><br>
    재고<input type="text" name="goodsStock"><br>
    <button>등록</button>
    </form>
    
    <table border="1">
        <tr>
            <th>상품 코드</th>
            <th>브랜드</th>
            <th>상품명</th>
            <th>가격</th>
            <th>재고</th>
        </tr>
        
        <% for (Goods g : list) { %>
            <tr>
                <td><%= g.getGoodsCode() %></td>
                <td><%= g.getGoodsBrand() %></td>
                <td><%= g.getGoodsName() %></td>
                <td><%= g.getGoodsPrice() %></td>
                <td><%= g.getGoodsStock() %></td>
            </tr>
        <% } %>
    </table>
  
</body>
</html>