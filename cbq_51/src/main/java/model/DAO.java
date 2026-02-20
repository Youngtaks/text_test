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
		public int s_insert(DTO dto)throws Exception{
			String sql="insert into tbl_hitter_info(registration_code,game_numbers,appearance,hit_numbers,home_runs,put_out,double_play,error_count)\r\n"
					+ "values(?,?,?,?,?,?,?,?)";
			int row=0;
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getRegistration_code());
			pstmt.setInt(2, dto.getGame_numbers());
			pstmt.setInt(3, dto.getAppearance());
			pstmt.setInt(4, dto.getHit_numbers());
			pstmt.setInt(5, dto.getHome_runs());
			pstmt.setInt(6, dto.getPut_out());
			pstmt.setInt(7, dto.getDouble_play());
			pstmt.setInt(8, dto.getError_count());
			row=pstmt.executeUpdate();
			return row;
		}
		public List<DTO>p_list(String registration_code)throws Exception{
			List<DTO>list=new ArrayList<DTO>();
			String sql="select a.registration_code,b.name,a.game_numbers\r\n"
					+ ",a.appearance,a.hit_numbers,a.home_runs,\r\n"
					+ "(((a.hit_numbers+a.home_runs)/a.appearance)*100)+a.home_runs as a_point,\r\n"
					+ "a.put_out,a.double_play,a.error_count,\r\n"
					+ "a.put_out+(a.double_play*2)-(a.error_count*5)as s_point\r\n"
					+ "from tbl_hitter_info a\r\n"
					+ "join tbl_player_info b on a.registration_code=b.registration_code\r\n"
					+ "where a.registration_code=?";
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, registration_code);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DTO dto=new DTO();
				dto.setRegistration_code(rs.getString("registration_code"));
				dto.setName(rs.getString("name"));
				dto.setGame_numbers(rs.getInt("game_numbers"));
				dto.setAppearance(rs.getInt("appearance"));
				dto.setHit_numbers(rs.getInt("hit_numbers"));
				dto.setHome_runs(rs.getInt("home_runs"));
				dto.setA_point(rs.getDouble("a_point"));
				dto.setPut_out(rs.getInt("put_out"));
				dto.setDouble_play(rs.getInt("double_play"));
				dto.setError_count(rs.getInt("error_count"));
				dto.setS_point(rs.getInt("s_point"));
				list.add(dto);
			}
			return list;
		}
		public List<DTO>m_list()throws Exception{
			List<DTO>list=new ArrayList<DTO>();
			String sql="select b.registration_code,b.name,b.birth_day,b.height,b.weight,\r\n"
					+ "(((((a.hit_numbers+a.home_runs)/a.appearance)*100)+a.home_runs)+ \r\n"
					+ "a.put_out+(a.double_play*2)-(a.error_count*5))/2 as grade\r\n"
					+ "from tbl_hitter_info a\r\n"
					+ "join tbl_player_info b on a.registration_code=b.registration_code\r\n"
					+ "order by grade desc";
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DTO dto=new DTO();
				dto.setRegistration_code(rs.getString("registration_code"));
				dto.setName(rs.getString("name"));
				dto.setBirth_day(rs.getString("birth_day"));
				dto.setHeight(rs.getInt("height"));
				dto.setWeight(rs.getInt("weight"));
				dto.setGrade(rs.getDouble("grade"));
				
				list.add(dto);
			}
			return list;
		}
}
