package Board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/read")
public class readServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		readService rs = new readService();

		Question q = rs.board("24");

		req.setAttribute("list", q);

		req.getRequestDispatcher("WEB-INF/views/read.jsp").forward(req, resp);

	}

//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
//		String questionCode = req.getParameter("code");
//		String buyerId = req.getParameter("id");
//		String title = req.getParameter("title");
//		String questionContents = req.getParameter("contents");
//		String writeDate = req.getParameter("date");
//		
//		
//		if(?.equals(code)) {
//			
//			HttpSession session = req.getSession();
//			session.setAttribute("id", id);
//			
//			resp.sendRedirect("/acorntblPrj230905/home");
//		
//		}else {
//			resp.sendRedirect("/acorntblPrj230905/login");
//		}
//		
//		
//	}
}
