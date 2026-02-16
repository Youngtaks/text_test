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
			String sql="insert into tbl_grade_202205(studentid,subjectcode,mid,final_exam,report,attend,etc)\r\n"
					+ "values(?,?,?,?,?,?,?)";
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getStudentid());
			pstmt.setString(2, dto.getSubjectcode());
			pstmt.setInt(3, dto.getMid());
			pstmt.setInt(4, dto.getFinal_exam());
			pstmt.setInt(5, dto.getReport());
			pstmt.setInt(6, dto.getAttend());
			pstmt.setInt(7, dto.getEtc());
			row=pstmt.executeUpdate();
			return row;
		}
		public String nvl()throws Exception{
			String nvl="";
			String sql="select to_char(nvl(max(to_number(studentid)),0)+1) as nvl from tbl_grade_202205";
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				nvl=rs.getString("nvl");
				
			}
			return nvl;
		}
			public List<DTO>s_list()throws Exception{
				
				String sql="select c.studentid,c.studentname,c.jumin,b.subjectname,b.classifiaction,\r\n"
						+ "b.professorname,a.mid,a.final_exam,a.report,a.attend,a.etc,\r\n"
						+ "(a.mid*0.3)+(a.final_exam*0.3)+(a.report*0.2)+(a.attend*0.1)+(a.etc*0.1) as tot\r\n"
						+ "from tbl_grade_202205 a\r\n"
						+ "join tbl_subject_202205 b on a.subjectcode=b.subjectcode\r\n"
						+ "join tbl_student_202205 c on a.studentid=c.studentid";
				List<DTO>list=new ArrayList<DTO>();
				conn=getConnection();
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					DTO dto=new DTO();
					dto.setStudentid(rs.getString("studentid"));
					dto.setStudentname(rs.getString("studentname"));
					dto.setJumin(rs.getString("jumin"));
					dto.setSubjectname(rs.getString("subjectname"));
					dto.setClassifiaction(rs.getString("classifiaction"));
					dto.setProfessorname(rs.getString("professorname"));
					dto.setMid(rs.getInt("mid"));
					dto.setFinal_exam(rs.getInt("final_exam"));
					dto.setReport(rs.getInt("report"));
					dto.setAttend(rs.getInt("attend"));
					dto.setEtc(rs.getInt("etc"));
					dto.setTot(rs.getDouble("tot"));
					list.add(dto);
				}
				return list;
			}
}
