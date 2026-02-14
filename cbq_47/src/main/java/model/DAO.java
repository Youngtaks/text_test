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
			String sql="insert into tbl_class_202202(regist_month,c_no,class_area,tuition)\r\n"
					+ "values(?,?,?,?)";
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getRegist_month());
			pstmt.setString(2, dto.getC_no());
			pstmt.setString(3, dto.getClass_area());
			pstmt.setInt(4, dto.getTuition());
			row=pstmt.executeUpdate();
			return row;
		}
		public String nvl()throws Exception{
			String nvl="";
			String sql="select nvl(to_number(max(regist_month)),0)+1 as nvl from tbl_class_202202";
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				nvl=rs.getString("nvl");
			}
			return nvl;
		}
		public List<DTO>t_list()throws Exception{
			String sql="select teacher_code,teacher_name,class_name,class_price,teacher_regist_date\r\n"
					+ "from tbl_teacher_202201";
			List<DTO>list=new ArrayList<DTO>();
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DTO dto=new DTO();
				dto.setTeacher_code(rs.getString("teacher_code"));
				dto.setTeacher_name(rs.getString("teacher_name"));
				dto.setClass_name(rs.getString("class_name"));
				dto.setClass_price(rs.getInt("class_price"));
				dto.setTeacher_regist_date(rs.getString("teacher_regist_date"));
				list.add(dto);
			}
			return list;
		}
		public List<DTO>c_list()throws Exception{
			String sql="select a.regist_month,a.c_no,b.c_name,c.class_name,a.class_area,a.tuition,b.grade\r\n"
					+ "from tbl_class_202202 a\r\n"
					+ "join tbl_member_202202 b on a.c_no=b.c_no\r\n"
					+ "join tbl_teacher_202202 c on a.teacher_code=c.teacher_code";
			List<DTO>list=new ArrayList<DTO>();
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DTO dto=new DTO();
					dto.setRegist_month(rs.getString("regist_month"));
					dto.setC_no(rs.getString("c_no"));
					dto.setC_name(rs.getString("c_name"));
					dto.setClass_name(rs.getString("class_name"));
					dto.setClass_area(rs.getString("class_area"));
					dto.setTuition(rs.getInt("tuition"));
					dto.setGrade(rs.getString("grade"));
				list.add(dto);
			}
			return list;
		}
		public List<DTO>p_list()throws Exception{
			String sql="select a.teacher_code,a.class_name,a.teacher_name,sum(b.tuition) as s_tuition\r\n"
					+ "from tbl_teacher_202201 a\r\n"
					+ "join tbl_class_202201 b on a.teacher_code=b.teacher_code\r\n"
					+ "group by a.teacher_code,a.class_name,a.teacher_name\r\n"
					+ "order by a.teacher_code asc";
			List<DTO>list=new ArrayList<DTO>();
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DTO dto=new DTO();
				dto.setTeacher_code(rs.getString("teacher_code"));
				dto.setClass_name(rs.getString("class_name"));
				dto.setTeacher_name(rs.getString("teacher_name"));
				dto.setS_tuition(rs.getInt("s_tuition"));
				list.add(dto);
			}
			return list;
		}
		
}