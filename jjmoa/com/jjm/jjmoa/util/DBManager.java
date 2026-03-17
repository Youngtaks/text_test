package com.jjm.jjmoa.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBManager {

	public static Connection getConnection() {
	    Connection conn = null;
	    try {
	        // 드라이버 로딩
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        
	       String db_ip = "218.239.222.74";
	       String db_username = "team";
	       String db_password = "1234";
	       String port = "3306";
	       String db_name = "jjmoa";
	        
	        // 커넥션 연결
	        conn = DriverManager.getConnection("jdbc:mysql://"+db_ip+":"+port+"/"+db_name, db_username, db_password);
//	       conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database", "username", "password");
	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	    return conn;
	}
	
	//select을 수행후 리소스 해제 메소드
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//insert, update, delete을 수행후 리소스 해제 메소드
	public static void close(Connection conn, PreparedStatement pstmt) {
		try {
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
