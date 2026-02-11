package model;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","track2_17","12345");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
}
		public int insert(DTO dto)throws Exception{
			int row=0;
			String sql="insert into tbl_inout (t_no, p_code, t_type, t_cnt, t_date, c_code) \r\n"
					+ "					values (?,?,?,?,?,?)";
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getT_no());
			pstmt.setString(2, dto.getP_code());
			pstmt.setString(3, dto.getT_type());
			pstmt.setInt(4, dto.getT_cnt());
			pstmt.setString(5, dto.getT_date());
			pstmt.setString(6, dto.getC_code());
			row=pstmt.executeUpdate();
			return row;
		}
}
