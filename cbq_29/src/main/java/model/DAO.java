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
	
	public Connection getConnection(){
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
		String sql="insert into  tbl_test_202005(test_date ,test_ampm,pollution , city_code,test_value) values \r\n"
				+ "(?,?,?,?,?)";
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, dto.getTest_date());
		pstmt.setString(2, dto.getTest_ampm());
		pstmt.setString(3, dto.getPollution());
		pstmt.setString(4, dto.getCity_code());
		pstmt.setInt(5, dto.getTest_value());
		
		row=pstmt.executeUpdate();
		return row;
	}
	public List<DTO>v_list()throws Exception{
		List<DTO>list=new ArrayList<DTO>();
		String sql="select b.city_code,b.city_name,a.area_code,a.area_name,b.city_tel1,b.city_tel2,b.city_tel3,b.city_admin,b.city_level\r\n"
				+ "from tbl_area_202005 a\r\n"
				+ "join tbl_city_202005 b on a.area_code=b.area_code";
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			DTO dto=new DTO();
			dto.setCity_code(rs.getString("city_code"));
			dto.setCity_name(rs.getString("city_name"));
			dto.setArea_code(rs.getString("area_code"));
			dto.setArea_name(rs.getString("area_name"));
			dto.setCity_tel1(rs.getString("city_tel1"));
			dto.setCity_tel2(rs.getString("city_tel2"));
			dto.setCity_tel3(rs.getString("city_tel3"));
			dto.setCity_admin(rs.getString("city_admin"));
			dto.setCity_level(rs.getString("city_level"));
			
			list.add(dto);
		}
		return list;
	}
	public List<DTO>c_list()throws Exception{
		String sql="select c.test_date,c.test_ampm,c.pollution,c.city_code,b.city_name,a.area_name,c.test_value\r\n"
				+ "from tbl_area_202005 a\r\n"
				+ "join tbl_city_202005 b on a.area_code=b.area_code\r\n"
				+ "join tbl_test_202005 c on b.city_code=c.city_code";
		List<DTO>list=new ArrayList<DTO>();
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			DTO dto=new DTO();
			dto.setTest_date(rs.getString("test_date"));
			dto.setTest_ampm(rs.getString("test_ampm"));
			dto.setPollution(rs.getString("pollution"));
			dto.setCity_code(rs.getString("city_code"));
			dto.setCity_name(rs.getString("city_name"));
			dto.setArea_name(rs.getString("area_name"));
			dto.setTest_value(rs.getInt("test_value"));
			list.add(dto);
		}
		return list;
	}
	public List<DTO>a_list()throws Exception{
		String sql="select b.test_date,a.city_name,trunc(sum(b.test_value)/2) as tot_test_value\r\n"
				+ "from tbl_city_202005 a\r\n"
				+ "join tbl_test_202005 b on a.city_code=b.city_code\r\n"
				+ "group by b.test_date,a.city_name";
		
		List<DTO>list=new ArrayList<DTO>();
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			DTO dto=new DTO();
			dto.setTest_date(rs.getString("test_date"));
			dto.setCity_name(rs.getString("city_name"));
			dto.setTot_test_value(rs.getInt("tot_test_value"));
			list.add(dto);
		}
		return list;
	}
}
