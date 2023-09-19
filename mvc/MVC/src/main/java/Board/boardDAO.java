package Board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class boardDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:testdb";
	String user = "scott";
	String password = "tiger";

	public Connection dbcon() {
		Connection con = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			if (con != null)
				System.out.println("ok");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	public void close(AutoCloseable... a) {
		for (AutoCloseable item : a) {
			try {
				item.close();
			} catch (Exception e) {

				e.printStackTrace();
			}
		}
	}

	public ArrayList<Question> getList() {
		Connection con = dbcon();
		String sql = "select * from questionTbl";
		PreparedStatement pst = null;
		ResultSet rs = null;

		ArrayList<Question> list = new ArrayList<>();
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();

			while (rs.next()) {
				Question bd = new Question();
				bd.setQuestionCode(rs.getInt(1));
				bd.setBuyerId(rs.getString(2));
				bd.setTitle(rs.getString(3));
				bd.setQuestionContents(rs.getString(4));
				bd.setWriteDate(rs.getString(5));
				// bd.setBbsAvailable(rs.getInt(6));
				list.add(bd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs, pst, con);
		return list;
	}

	public Question getOne(String code) {
		Connection con = dbcon();
		String sql = "select * from questionTbl where questionCode=?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		Question bd = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, code);
			rs = pst.executeQuery();

			while (rs.next()) {
				bd = new Question();
				bd.setQuestionCode(rs.getInt(1));
				bd.setBuyerId(rs.getString(2));
				bd.setTitle(rs.getString(3));
				bd.setQuestionContents(rs.getString(4));
				bd.setWriteDate(rs.getString(5));
				// bd.setBbsAvailable(rs.getInt(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs, pst, con);
		return bd;
	}

//	public void insertContents(Question b) {
//		Connection con = dbcon();
//		String sql = "insert into questiontbl values(?,?,?,?,?,?)";
//		PreparedStatement pst = null;
//		try {
//			pst = con.prepareStatement(sql);
//			pst.setInt(1, b.getQuestionCode()); // table의 스키마를 확인하고 해야됨
//			pst.setString(2, b.getBuyerId());
//			pst.setString(3, b.getTitle());
//			pst.setString(4, b.getQuestionContents());
//			pst.setString(5, b.getWriteDate());
//			pst.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		close(pst, con);
//	}
//
//	public void insertContents2(Question b) {
//		Connection con = null;
//		PreparedStatement pst = null;
//		try {
//			con = getConnection();
//
//			String sql = "INSERT INTO questionTbl (QuestionCode, buyerId, title, questionContents, writeDate) VALUES ('4',?,?,?,sysdate)";
//			pst = con.prepareStatement(sql);
//
//			pst.setString(1, b.getBuyerId());
//			pst.setString(2, b.getTitle());
//			pst.setString(3, b.getQuestionContents());
//
//			pst.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		close(con, pst);
//	}

	public void insertContents(Question b) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = dbcon();
			String sql = "insert into questionTbl (questionCode, buyerId, title, questionContents, writeDate) values (questionseq.nextval, ?, ?, ?, sysdate)";

			System.out.println(sql);
			pst = con.prepareStatement(sql);

			pst.setString(1, b.getBuyerId());
			pst.setString(2, b.getTitle());
			pst.setString(3, b.getQuestionContents());
			

			int rowsAffected = pst.executeUpdate();
			if (rowsAffected == 1) {

				rs = pst.getGeneratedKeys();
				if (rs.next()) {
					int generatedQuestionCode = rs.getInt(1);
					b.setQuestionCode(generatedQuestionCode);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pst, con);
		}
	}

	private Connection getConnection() {

		return null;
	}

	public void insertBoard(Question b) {

	}

	public static void main(String[] args) {

		boardDAO dao = new boardDAO();

		Question b = new Question();
		
		b.setBuyerId("kbj");
		b.setTitle("test02");
		b.setQuestionContents("test 답변?");
//		b.setWriteDate(null);

		dao.insertContents(b);
		System.out.println(b);

		

	

//		dao.insertContents3(b);
//		ArrayList<Question> list = dao.getList();
//		for(Question q : list) {
//			System.out.println(q +"<br>");
//		}
//		Question q = dao.getOne("24");
//		System.out.println(q);
	}
}
