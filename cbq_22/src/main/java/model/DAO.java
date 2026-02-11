package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	
	public Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","track2_17","12345");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	public int insert(DTO dto)throws Exception{
		int row=0;
		String sql="insert into tbl_resv_202301 (resv_no,cust_no,resv_date,court_no) values(?,?,?,?)";
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getResv_no());
			pstmt.setString(2, dto.getCust_no());
			pstmt.setString(3, dto.getResv_date());
			pstmt.setString(4, dto.getCourt_no());
			
		row=pstmt.executeUpdate();
		return row;
	}
	public List<DTO>c_list(String cust_no)throws Exception{
		List<DTO>list=new ArrayList<DTO>();
		String sql="select a.cust_no, a.cust_name,b.resv_date,b.court_no\r\n"
				+ "from tbl_cust_202301 a \r\n"
				+ "join tbl_resv_202301 b on a.cust_no=b.cust_no\r\n"
				+ "where a.cust_no=?";
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, cust_no);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			DTO dto=new DTO();
			dto.setCust_no(rs.getString("cust_no"));
			dto.setCust_name(rs.getString("cust_name"));
			dto.setResv_date(rs.getString("resv_date"));
			dto.setCourt_no(rs.getString("court_no"));
			
			list.add(dto);
		}
		return list;
	}
	public List<DTO>use_list()throws Exception{
		List<DTO>list=new ArrayList<DTO>();
		String sql="select a.cust_no,a.cust_name,count(b.resv_date) as use_days\r\n"
				+ "from tbl_cust_202301 a\r\n"
				+ "join tbl_resv_202301 b on a.cust_no=b.cust_no\r\n"
				+ "group by a.cust_no,a.cust_name\r\n"
				+ "order by cust_no asc";
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
	
		rs=pstmt.executeQuery();
		while(rs.next()) {
			DTO dto=new DTO();
			dto.setCust_no(rs.getString("cust_no"));
			dto.setCust_name(rs.getString("cust_name"));
			dto.setUse_days(rs.getString("use_days"));
			
			
			list.add(dto);
		}
		return list;
	}
}
