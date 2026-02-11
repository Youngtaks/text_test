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
		String sql="insert into tbl_artist_201905(artist_id,artist_name,artist_birth,artist_gender,talent,agency) values(?,?,?,?,?,?)";
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, dto.getArtist_id());
		pstmt.setString(2, dto.getArtist_name());
		pstmt.setString(3, dto.getArtist_birth());
		pstmt.setString(4, dto.getArtist_gender());
		pstmt.setString(5, dto.getTalent());
		pstmt.setString(6, dto.getAgency());
		row=pstmt.executeUpdate();
		return row;
	}
	public List<DTO>p_list()throws Exception{
		List<DTO>list=new ArrayList<DTO>();
		String sql="select artist_id,artist_name,artist_birth,artist_gender,talent,agency\r\n"
				+ "from tbl_artist_201905";
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			DTO dto=new DTO();
			dto.setArtist_id(rs.getString("artist_id"));
			dto.setArtist_name(rs.getString("artist_name"));
			dto.setArtist_birth(rs.getString("artist_birth"));
			dto.setArtist_gender(rs.getString("artist_gender"));
			dto.setTalent(rs.getString("talent"));
			dto.setAgency(rs.getString("agency"));
			list.add(dto);
		}
		return list;
	}
	public List<DTO>m_list()throws Exception{
		List<DTO>list=new ArrayList<DTO>();
		String sql="select b.serial_no,a.artist_id,a.artist_name,a.artist_birth,b.point,c.mento_name\r\n"
				+ "from tbl_artist_201905 a\r\n"
				+ "join tbl_point_201905 b on a.artist_id=b.artist_id\r\n"
				+ "join tbl_mento_201905 c on b.mento_id=c.mento_id order by serial_no asc";
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			DTO dto=new DTO();
			dto.setSerial_no(rs.getInt("serial_no"));
			dto.setArtist_id(rs.getString("artist_id"));
			dto.setArtist_name(rs.getString("artist_name"));
			dto.setArtist_birth(rs.getString("artist_birth"));
			dto.setPoint(rs.getInt("point"));
			dto.setMento_name(rs.getString("mento_name"));
			list.add(dto);
		}
		return list;
	}
	public List<DTO>g_list()throws Exception{
		List<DTO>list=new ArrayList<DTO>();
		String sql="select a.artist_id,a.artist_name,a.artist_gender,sum(b.point)as t_point,avg(b.point)as avg\r\n"
				+ "from tbl_artist_201905 a\r\n"
				+ "join tbl_point_201905 b on a.artist_id=b.artist_id\r\n"
				+ "group by a.artist_id,a.artist_name,a.artist_gender order by t_point desc";
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			DTO dto=new DTO();
			dto.setArtist_id(rs.getString("artist_id"));
			dto.setArtist_name(rs.getString("artist_name"));
			dto.setArtist_gender(rs.getString("artist_gender"));
			dto.setT_point(rs.getInt("t_point"));
			dto.setAvg(rs.getDouble("avg"));
			list.add(dto);
		}
		return list;
	}
	
}
