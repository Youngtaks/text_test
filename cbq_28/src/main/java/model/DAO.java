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
	
	public Connection getcConnection() {
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
		String sql="insert into tbl_vote_202005(v_jumin,v_name,m_no,v_time,v_area,v_confirm)\r\n"
				+ "values(?,?,?,?,?,?)";
		conn=getcConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, dto.getV_jumin());
		pstmt.setString(2, dto.getV_name());
		pstmt.setString(3, dto.getM_no());
		pstmt.setString(4, dto.getV_time());
		pstmt.setString(5, dto.getV_area());
		pstmt.setString(6, dto.getV_confirm());
	row=pstmt.executeUpdate();
	return row;
	}
	public List<DTO>c_list()throws Exception{
		List<DTO>list=new ArrayList<DTO>();
		String sql="select a.m_no,a.m_name,b.p_name,a.p_school,a.m_jumin,a.m_city,b.p_tel\r\n"
				+ "from tbl_member a\r\n"
				+ "join tbl_party b on a.p_code=b.p_code";
		conn=getcConnection();
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			DTO dto=new DTO();
		dto.setM_no(rs.getString("m_no"));
		dto.setM_name(rs.getString("m_name"));
		dto.setP_name(rs.getString("p_name"));
		dto.setP_school(rs.getString("p_school"));
		dto.setM_jumin(rs.getString("m_jumin"));
		dto.setM_city(rs.getString("m_city"));
		dto.setP_tel(rs.getString("p_tel"));
		
		list.add(dto);
		}
		return list;
	}
	public List<DTO>v_list()throws Exception{
		List<DTO>list=new ArrayList<DTO>();
		String sql="select v_name,v_jumin,m_no,v_time,v_confirm from tbl_vote_202005";
		conn=getcConnection();
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			DTO dto=new DTO();
		dto.setV_name(rs.getString("v_name"));
		dto.setV_jumin(rs.getString("v_jumin"));
		dto.setM_no(rs.getString("m_no"));
		dto.setV_time(rs.getString("v_time"));
		dto.setV_confirm(rs.getString("v_confirm"));
		
		list.add(dto);
		}
		return list;
	}
	public List<DTO>s_list()throws Exception{
		List<DTO>list=new ArrayList<DTO>();
		String sql="select a.m_no,a.m_name,count(b.v_confirm) as vote\r\n"
				+ "from tbl_member a\r\n"
				+ "left join tbl_vote_202005 b on a.m_no=b.m_no\r\n"
				+ "group by a.m_no,a.m_name\r\n"
				+ "order by vote desc";
		conn=getcConnection();
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			DTO dto=new DTO();
		dto.setM_no(rs.getString("m_no"));
		dto.setM_name(rs.getString("m_name"));
		dto.setVote(rs.getString("vote"));
		
		list.add(dto);
		}
		return list;
	}
}
