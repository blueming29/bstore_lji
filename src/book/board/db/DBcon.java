package book.board.db;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBcon {
	public static Connection getConnection() throws Exception {
		Context context = new InitialContext();
		DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/noticeOrcl"); 
		Connection conn = dataSource.getConnection();
		return conn;
	}
}
