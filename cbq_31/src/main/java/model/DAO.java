package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
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
		String sql="INSERT INTO TBL_CLASS_202201 (REGIST_MONTH, C_NO, CLASS_AREA,TEACHER_CODE,TUITION)\r\n"
				+ 				 "VALUES (?,?,?,?,?)";
		int row=0;
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, dto.getRegist_month());
		pstmt.setString(2, dto.getC_no());
		pstmt.setString(3, dto.getClass_area());
		pstmt.setString(4, dto.getTeacher_code());
		pstmt.setInt(5, dto.getTuition());
		row=pstmt.executeUpdate();
		return row;
		
	}
	public List<DTO>c_list()throws Exception{
		List<DTO>list=new ArrayList<DTO>();
		String sql="select b.regist_month,b.c_no,c.c_name,a.class_name,a.teacher_name,b.class_area,b.tuition\r\n"
				+ "from tbl_teacher_202201 a\r\n"
				+ "join tbl_class_202201 b on  a.teacher_code=b.teacher_code\r\n"
				+ "join tbl_member_202201 c on  b.c_no=c.c_no";
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			DTO dto=new DTO();
			dto.setRegist_month(rs.getString("regist_month"));
			dto.setC_no(rs.getString("c_no"));
			dto.setC_name(rs.getString("c_name"));
			dto.setClass_name(rs.getString("class_name"));
			dto.setTeacher_name(rs.getString("teacher_name"));
			dto.setClass_area(rs.getString("class_area"));
			dto.setTuition(rs.getInt("tuition"));
			list.add(dto);
		}
		return list;
	}
	public List<DTO>t_list()throws Exception{
		List<DTO>list=new ArrayList<DTO>();
		String sql="select teacher_code,class_name,teacher_name,class_price,teacher_regist_date from tbl_teacher_202201";
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			DTO dto=new DTO();
			dto.setTeacher_code(rs.getString("teacher_code"));
			dto.setClass_name(rs.getString("class_name"));
			dto.setTeacher_name(rs.getString("teacher_name"));
			dto.setClass_price(rs.getInt("class_price"));
			dto.setTeacher_regist_date(rs.getString("teacher_regist_date"));
			list.add(dto);
		}
		return list;
	}
	public List<DTO>tc_list()throws Exception{
		List<DTO>list=new ArrayList<DTO>();
		String sql="select b.teacher_code,a.teacher_name,a.class_name,sum(b.tuition) as tot\r\n"
				+ "from tbl_teacher_202201 a\r\n"
				+ "join tbl_class_202201 b on a.teacher_code=b.teacher_code\r\n"
				+ "group by b.teacher_code,a.teacher_name,a.class_name";
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			DTO dto=new DTO();
			dto.setTeacher_code(rs.getString("teacher_code"));
			dto.setTeacher_name(rs.getString("teacher_name"));
			dto.setClass_name(rs.getString("class_name"));
			dto.setTot(rs.getInt("tot"));
			list.add(dto);
		}
		return list;
	}
}
