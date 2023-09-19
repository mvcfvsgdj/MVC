package Board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board")
public class BoardServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		BoardService bs = new BoardService();

		ArrayList<Question> list = bs.board();
		System.out.println(list);
		req.setAttribute("list", list);
		req.getRequestDispatcher("WEB-INF/views/board.jsp").forward(req, resp);

	}

}
