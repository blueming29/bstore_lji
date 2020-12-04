package book.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import book.board.db.DBcon;
import book.board.vo.BookBoard;

public class BookBoardDao {
	public int getCount(String field, String query) throws Exception {
		Connection conn = DBcon.getConnection();
		String sql = "select count(*) cnt from bookstore where " + field + " like ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, "%" + query + "%");
		
		ResultSet rs = ps.executeQuery();
		rs.next();
		int cnt = rs.getInt("cnt");
		
		ps.close();
		rs.close();
		conn.close();
		return cnt;
	}
	
	public List<BookBoard> getBookBoard(int page, String field, String query) throws Exception{
		int srow = 1 + (page - 1) * 5;
		int erow = 5 + (page - 1) * 5;
		
		Connection conn = DBcon.getConnection();
		String sql = "select * from "
				+ "(select rownum num, b.* from(select * from bookstore where "+ field +" like ? "
				+ "order by jibdate desc) b) "
				+ "where num between ? and ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, "%" + query + "%");
		ps.setInt(2, srow);
		ps.setInt(3, erow);
		
		
		ResultSet rs = ps.executeQuery();
		
		List<BookBoard> list = new ArrayList<BookBoard>();
		while(rs.next()) {
			BookBoard b = new BookBoard();
			b.setJibno(rs.getInt("jibno"));
			b.setJibtitle(rs.getString("jibtitle"));
			b.setJibwriter(rs.getString("jibwriter"));
			b.setJibdate(rs.getDate("jibdate"));
			b.setJibhit(rs.getInt("jibhit"));
			
			list.add(b);
		}
		rs.close();
		ps.close();
		conn.close();
		
		return list;
	}
	
	public void hit(int jibno) throws Exception {
		Connection conn = DBcon.getConnection();
		Statement st = conn.createStatement();
		String sql = "update bookstore set jibhit = jibhit + 1 where jibno = " + jibno;
		st.executeUpdate(sql);

		
		st.close();
		conn.close();
	}
	
	public void delete(int jibno) throws Exception {
		Connection conn = DBcon.getConnection();
		Statement st = conn.createStatement();
		String sql = "delete from bookstore where jibno = " + jibno;
		st.executeQuery(sql);
	
		
		String sql2 = "update bookstore set jibno = jibno-1 where jibno > " + jibno;
		st.executeUpdate(sql2);
		
		st.close();
		conn.close();
	}
	
	public int write(BookBoard b) throws Exception {
		Connection conn = DBcon.getConnection();
		Statement st = conn.createStatement();
		String sql = "select * from bookstore";
		ResultSet rs = st.executeQuery(sql);
		String jibno = "";
		if(rs.next()) {
			jibno = "(select max(jibno) from bookstore)+1";
		} else {
			jibno = "'1'";
		}
		
		String sql2 = "insert into bookstore values(" + jibno +" , ?, '이정인', ?, sysdate, 0)";
		PreparedStatement ps = conn.prepareStatement(sql2);
		ps.setString(1, b.getJibtitle());
		ps.setString(2, b.getJibcontent());
		int af = ps.executeUpdate();
		
		rs.close();
		st.close();
		ps.close();
		conn.close();
		return af;
		
	}
	
	public int modify(BookBoard b) throws Exception {
		Connection conn = DBcon.getConnection();
		String sql = "update bookstore set jibtitle = ?, jibcontent = ? where jibno = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, b.getJibtitle());
		ps.setString(2, b.getJibcontent());
		ps.setInt(3, b.getJibno());
		int af = ps.executeUpdate();
		
		ps.close();
		conn.close();
		
		return af;
	}
	
	public BookBoard getBookBoard(int jibno) throws Exception {
		Connection conn = DBcon.getConnection();
		Statement st = conn.createStatement();
		String sql = "select jibno, jibtitle, jibwriter, jibcontent, jibdate, jibhit from bookstore where jibno = " + jibno;
		ResultSet rs = st.executeQuery(sql);
		rs.next();
		
		BookBoard b = new BookBoard();
		b.setJibno(rs.getInt("jibno"));
		b.setJibtitle(rs.getString("jibtitle"));
		b.setJibwriter(rs.getString("jibwriter"));
		b.setJibcontent(rs.getString("jibcontent"));
		b.setJibdate(rs.getDate("jibdate"));
		b.setJibhit(rs.getInt("jibhit"));
		
		rs.close();
		st.close();
		conn.close();
		return b;
	}
}
