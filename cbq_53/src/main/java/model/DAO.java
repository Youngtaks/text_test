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
			conn=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","track2_17","1234");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
}
	public int insert(DTO dto)throws Exception{
		String sql="insert into tbl_olympic_point(player_no,point_1,point_2,point_3,point_4)\r\n"
				+ "values(?,?,?,?,?)";
		int row=0;
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, dto.getPlayer_no());
		pstmt.setInt(2, dto.getPoint_1());
		pstmt.setInt(3, dto.getPoint_2());
		pstmt.setInt(4, dto.getPoint_3());
		pstmt.setInt(5, dto.getPoint_4());
		row=pstmt.executeUpdate();
		return row;
	}
	public int update(DTO dto)throws Exception{
		int row=0;
		String sql="update tbl_olympic_point \r\n"
				+ "set point_1=?,\r\n"
				+ " point_2=?,\r\n"
				+ " point_3=?,\r\n"
				+ " point_4=?\r\n"
				+ " where player_no=?";
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, dto.getPoint_1());
		pstmt.setInt(2, dto.getPoint_2());
		pstmt.setInt(3, dto.getPoint_3());
		pstmt.setInt(4, dto.getPoint_4());
		pstmt.setString(5, dto.getPlayer_no());
		row=pstmt.executeUpdate();
		return row;
	}
	public List<DTO>s_list() throws Exception{
		String sql="  select  a.player_no,a.name,b.point_1,b.point_2,b.point_3,b.point_4\r\n"
				+ " , (b.point_1 + b.point_2 + b.point_3 + b.point_4\r\n"
				+ "         - GREATEST(b.point_1, b.point_2, b.point_3, b.point_4)) AS tot,\r\n"
				+ "         round(((b.point_1 + b.point_2 + b.point_3 + b.point_4\r\n"
				+ "         - GREATEST(b.point_1, b.point_2, b.point_3, b.point_4))/3)*\r\n"
				+ "         (1+a.skill_level*0.01),2)as ave\r\n"
				+ " from tbl_olympic_player a \r\n"
				+ " join tbl_olympic_point b on a.player_no=b.player_no order by ave desc";
		List<DTO>list=new ArrayList<DTO>();
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			DTO dto=new DTO();
			dto.setPlayer_no(rs.getString("player_no"));
			dto.setName(rs.getString("name"));
			dto.setPoint_1(rs.getInt("point_1"));
			dto.setPoint_2(rs.getInt("point_2"));
			dto.setPoint_3(rs.getInt("point_3"));
			dto.setPoint_4(rs.getInt("point_4"));
			dto.setTot(rs.getInt("tot"));
			dto.setAve(rs.getDouble("ave"));
			list.add(dto);
		}
		return list;
	}
	public List<DTO>p_list() throws Exception{
		String sql="   select a.player_no,a.name,c.nation_name,a.birth,b.skill_name\r\n"
				+ " from tbl_olympic_player a\r\n"
				+ " join tbl_olympic_skill b on a.skill_level=b.skill_level\r\n"
				+ " join tbl_olympic_nation c on  a.nation_code=c.nation_code";
		List<DTO>list=new ArrayList<DTO>();
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			DTO dto=new DTO();
			dto.setPlayer_no(rs.getString("player_no"));
			dto.setName(rs.getString("name"));
			dto.setNation_name(rs.getString("nation_name"));
			dto.setBirth(rs.getString("birth"));
			dto.setSkill_name(rs.getString("skill_name"));
			list.add(dto);
		}
		return list;
	}
	public List<DTO>ps_list() throws Exception{
		String sql="select a.player_no,a.name,c.nation_name,d.skill_name\r\n"
				+ ", (b.point_1 + b.point_2 + b.point_3 + b.point_4\r\n"
				+ "         - GREATEST(b.point_1, b.point_2, b.point_3, b.point_4)) AS tot,\r\n"
				+ "         round(((b.point_1 + b.point_2 + b.point_3 + b.point_4\r\n"
				+ "         - GREATEST(b.point_1, b.point_2, b.point_3, b.point_4))/3)*\r\n"
				+ "         (1+a.skill_level*0.01),2)as ave\r\n"
				+ "from tbl_olympic_player a\r\n"
				+ " join tbl_olympic_point b on  a.player_no=b.player_no\r\n"
				+ " join tbl_olympic_nation c on  a.nation_code=c.nation_code\r\n"
				+ " join tbl_olympic_skill d on a.skill_level=d.skill_level";
		List<DTO>list=new ArrayList<DTO>();
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			DTO dto=new DTO();
				dto.setPlayer_no(rs.getString("player_no"));
				dto.setName(rs.getString("name"));
				dto.setNation_name(rs.getString("nation_name"));
				dto.setSkill_name(rs.getString("skill_name"));
				dto.setTot(rs.getInt("tot"));
				dto.setAve(rs.getDouble("ave"));
			list.add(dto);
		}
		return list;
	}
}
