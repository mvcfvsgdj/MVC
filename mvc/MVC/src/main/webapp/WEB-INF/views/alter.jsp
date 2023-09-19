<%@page import="Seller.Goods"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <style>
    a {
    	color : black;
  		text-decoration-line : none;
}
    </style>
</head>
<body>

    <form action="/TeamProject/seller"><button>판매자페이지로</button></form>
    <form action="/TeamProject/goodsRegister"><button>등록 페이지로</button></form>
    <form action="/TeamProject/goodsAlter" method="post">
        <!-- 상품코드 입력란에 id 추가 -->
        상품코드<input type="text" name="goodsCode" id="code" readonly="readonly"><br>
        브랜드 <select name="goodsBrand">
            <option value="0">0:삼성</option>
            <option value="1">1:애플</option>
        </select><br>
        상품명<input type="text" name="goodsName" id="name"><br>
        가격<input type="text" name="goodsPrice" id="price"><br>
        재고<input type="text" name="goodsStock" id="stock"><br>
        <button>변경</button>
    </form>
    
    <!-- 클릭 시 데이터 자동 입력 -->
    <script>
        // 클릭 이벤트를 처리할 JavaScript 함수
        function fillData(code, name, price, stock) {
            // 클릭된 데이터를 각각의 input 요소에 설정
            document.getElementById("code").value = code;
            document.getElementById("name").value = name;
            document.getElementById("price").value = price;
            document.getElementById("stock").value = stock;
        }
    </script>
    
    <%
    ArrayList<Goods> list = (ArrayList<Goods>)request.getAttribute("list");
    %>
    
    <table border="1">
        <tr>
            <th>상품 코드</th>
            <th>브랜드</th>
            <th>상품명</th>
            <th>가격</th>
            <th>재고</th>
        </tr>
        
        <!-- 각 데이터를 클릭하면 JavaScript 함수를 호출하도록 설정 -->
        <%
        for (Goods g : list) {
        %>
        <tr>
            <td>
                <a href="javascript:void(0);" onclick="fillData('<%= g.getGoodsCode() %>', '<%= g.getGoodsName() %>', '<%= g.getGoodsPrice() %>', '<%= g.getGoodsStock() %>')">
                    <%= g.getGoodsCode() %>
                </a>
            </td>
            <td>
                <a href="javascript:void(0);" onclick="fillData('<%= g.getGoodsCode() %>', '<%= g.getGoodsName() %>', '<%= g.getGoodsPrice() %>', '<%= g.getGoodsStock() %>')">
                    <%= g.getGoodsBrand() %>
                </a>
            </td>
            <td>
                <a href="javascript:void(0);" onclick="fillData('<%= g.getGoodsCode() %>', '<%= g.getGoodsName() %>', '<%= g.getGoodsPrice() %>', '<%= g.getGoodsStock() %>')">
                    <%= g.getGoodsName() %>
                </a>
            </td>
            <td>
                <a href="javascript:void(0);" onclick="fillData('<%= g.getGoodsCode() %>', '<%= g.getGoodsName() %>', '<%= g.getGoodsPrice() %>', '<%= g.getGoodsStock() %>')">
                    <%= g.getGoodsPrice() %>
                </a>
            </td>
            <td>
                <a href="javascript:void(0);" onclick="fillData('<%= g.getGoodsCode() %>', '<%= g.getGoodsName() %>', '<%= g.getGoodsPrice() %>', '<%= g.getGoodsStock() %>')">
                    <%= g.getGoodsStock() %>
                </a>
            </td>
        </tr>
        <%
        }
        %>
    </table>
</body>
</html>