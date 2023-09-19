package Seller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/seller")
public class GoodsSellerServlet extends HttpServlet{

@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	resp.setContentType("text/html;charset=UTF-8");
	resp.setCharacterEncoding("UTF-8");

	sellerService s = new sellerService();
	
	String p = req.getParameter("p");
	int currentPage = 1;	// PageHandler에 넘겨주는 값
	if( p != null) {
		currentPage = Integer.parseInt(p);		// PageHandler에 넘겨주는 값
	}
	
	int totRecords = s.getTotalCnt();
	int pageSize = 4;
	int grpSize = 3;

	PageHandler handler = new PageHandler(currentPage, totRecords, pageSize, grpSize);
	ArrayList<Goods> list = s.getListPage(currentPage, pageSize);
	
	req.setAttribute("list", list);
	req.setAttribute("handler", handler);
	
	req.getRequestDispatcher("/WEB-INF/views/seller.jsp").forward(req, resp);
	}
}
