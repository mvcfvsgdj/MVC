package Seller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/goodsAlter")
public class GoodsAlterServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		sellerService s = new sellerService();
		
		ArrayList<Goods> list = s.selectAll();
		
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("WEB-INF/views/alter.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        
        int goodsBrand = Integer.parseInt(req.getParameter("goodsBrand"));
        String goodsName = req.getParameter("goodsName");
        int goodsPrice = Integer.parseInt(req.getParameter("goodsPrice"));
        int goodsStock = Integer.parseInt(req.getParameter("goodsStock"));
		String goodsCode = req.getParameter("goodsCode");
        
		sellerService s = new sellerService();
		
		s.alterGoods(new Goods(goodsBrand, goodsName, goodsPrice, goodsStock, goodsCode));
		
		resp.sendRedirect("/MVC/goodsAlter");
	}
	
}
