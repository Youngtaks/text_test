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
			String sql="insert into tbl_test_202005(test_date,test_ampm,pollution,city_code,test_value)\r\n"
					+ "values(?,?,?,?,?)";
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTest_date());
			pstmt.setString(2, dto.getTest_ampm());
			pstmt.setString(3, dto.getPollution());
			pstmt.setString(4, dto.getCity_code());
			pstmt.setInt(5,dto.getTest_value());
			row=pstmt.executeUpdate();
			return row;
		}
		public String nvl()throws Exception{
			String sql="select  to_char(nvl(max(to_number(test_date)),0)+1)as nvl from tbl_test_202005";
			String nvl="";
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				nvl=rs.getString("nvl");
			}
			return nvl;
		}
		 public List<DTO>a_list()throws Exception{
			 String sql="select a.city_code,a.city_name,a.area_code,b.area_name,a.city_tel1,a.city_tel2,a.city_tel3,a.city_admin,a.city_level\r\n"
			 		+ "from tbl_city_202005 a\r\n"
			 		+ "join tbl_area_202005 b on a.area_code=b.area_code\r\n"
			 		+ "order by a.city_code asc";
			 List<DTO>list=new ArrayList<DTO>();
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
		 public List<DTO>s_list()throws Exception{
			 String sql="select b.test_date,b.test_ampm,b.pollution,b.city_code,a.city_name,c.area_name,b.test_value\r\n"
			 		+ "from tbl_city_202005 a \r\n"
			 		+ "join tbl_test_202005 b on a.city_code=b.city_code\r\n"
			 		+ "join tbl_area_202005 c on a.area_code=c.area_code";
			 List<DTO>list=new ArrayList<DTO>();
			 conn=getConnection();
			 pstmt=conn.prepareStatement(sql);
			 rs=pstmt.executeQuery();
			 while(rs.next()) {
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
		 public List<DTO>p_list()throws Exception{
			 String sql="select a.test_date,b.city_name,round(avg(a.test_value)) as ave\r\n"
			 		+ "from tbl_test_202005 a\r\n"
			 		+ "join tbl_city_202005 b on a.city_code=b.city_code\r\n"
			 		+ "group by a.test_date,b.city_name";
			 List<DTO>list=new ArrayList<DTO>();
			 conn=getConnection();
			 pstmt=conn.prepareStatement(sql);
			 rs=pstmt.executeQuery();
			 while(rs.next()) {
				 DTO dto=new DTO();
				 	dto.setTest_date(rs.getString("test_date"));
				 	dto.setCity_name(rs.getString("city_name"));
				 	dto.setAve(rs.getInt("ave"));
				 list.add(dto);
			 }
			 return list;
		 }
}
