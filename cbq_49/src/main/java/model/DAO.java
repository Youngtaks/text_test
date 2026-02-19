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
		public int s_insert(DTO dto)throws Exception{
			int row=0;
			String sql="insert into tbl_student_201905(syear,sclass,sno,sname,birth,gender,tel1,tel2,tel3)\r\n"
					+ "values(?,?,?,?,?,?,?,?,?)";
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSyear());
			pstmt.setString(2, dto.getSclass());
			pstmt.setString(3, dto.getSno());
			pstmt.setString(4, dto.getSname());
			pstmt.setString(5, dto.getBirth());
			pstmt.setString(6, dto.getGender());
			pstmt.setString(7, dto.getTel1());
			pstmt.setString(8, dto.getTel2());
			pstmt.setString(9, dto.getTel3());
			row=pstmt.executeUpdate();
			return row;
			
		}
		public List<DTO> y_list()throws Exception{
			List<DTO>list=new ArrayList<DTO>();
			String sql="select sclass, sno from tbl_student_201905 order by sclass";
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
		   rs=pstmt.executeQuery();
		   while(rs.next()) {
			   DTO dto=new DTO();
			  
			   dto.setSclass(rs.getString("sclass"));
			   dto.setSno(rs.getString("sno"));
			   list.add(dto);
		   }
		   return list;
			
		}
		public int p_insert(DTO dto)throws Exception{
			int row=0;
			String sql="insert into tel_score_201905(syear,sno,kor,eng,mat) values(?,?,?,?,?)";
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSyear());
			pstmt.setString(2, dto.getSno());
			pstmt.setInt(3, dto.getKor());
			pstmt.setInt(4, dto.getEng());
			pstmt.setInt(5, dto.getMat());
			row=pstmt.executeUpdate();
			return row;
		}
		public List<DTO>s_list()throws Exception{
			String sql="select a.syear,a.sclass,a.sno,a.sname\r\n"
					+ ",a.gender,b.kor,b.eng,b.mat,\r\n"
					+ "(b.kor+b.eng+b.mat)as tot,\r\n"
					+ "(b.kor+b.eng+b.mat)/3as ave\r\n"
					+ "from tbl_student_201905 a\r\n"
					+ "join tel_score_201905 b on a.syear=b.syear and a.sclass=b.sclass and a.sno=b.sno\r\n"
					+ "order by a.sclass asc,sno asc";
			List<DTO>list=new ArrayList<DTO>();
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DTO dto=new DTO();
				dto.setSyear(rs.getString("syear"));
				dto.setSclass(rs.getString("sclass"));
				dto.setSno(rs.getString("sno"));
				dto.setSname(rs.getString("sname"));
				dto.setGender(rs.getString("gender"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setTot(rs.getInt("tot"));
				dto.setAve(rs.getDouble("ave"));
				list.add(dto);
			}
			return list;
		}
		public List<DTO>p_list()throws Exception{
			String sql="select a.syear,a.sclass,b.tname,sum(c.kor)as tkor,sum(c.eng)as teng,sum(c.mat) as tmat\r\n"
					+ ",avg(c.kor) as akor,avg(c.eng) as aeng,avg(c.mat) as amat\r\n"
					+ "from tbl_student_201905 a\r\n"
					+ "join tbl_dept_201905 b on a.syear=b.syear and a.sclass=b.sclass\r\n"
					+ "join tel_score_201905 c on a.syear=c.syear and a.sclass=c.sclass and a.sno=c.sno\r\n"
					+ "group by a.syear,a.sclass,b.tname\r\n"
					+ "order by a.sclass asc";
			List<DTO>list=new ArrayList<DTO>();
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DTO dto=new DTO();
				dto.setSyear(rs.getString("syear"));
				dto.setSclass(rs.getString("sclass"));
				dto.setTname(rs.getString("tname"));
				dto.setTkor(rs.getInt("tkor"));
				dto.setTeng(rs.getInt("teng"));
				dto.setTmat(rs.getInt("tmat"));
				dto.setAkor(rs.getDouble("akor"));
				dto.setAeng(rs.getDouble("aeng"));
				dto.setAmat(rs.getDouble("amat"));
				list.add(dto);
			}
			return list;
		}
}
