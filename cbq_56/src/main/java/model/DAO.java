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
		public List<DTO>code()throws Exception{
			String sql="select p_code,p_name from tbl_product1_2026 order by p_code";
			List<DTO>list=new ArrayList<DTO>();
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DTO dto=new DTO();
				dto.setP_code(rs.getString("p_code"));
				dto.setP_name(rs.getString("p_name"));
				list.add(dto);
			}
			return list;
		}
		public int w_insert(DTO dto)throws Exception{
			int row=0;
			String sql="insert into tbl_worklist(w_workno,p_code,w_quentity,w_workdate)\r\n"
					+ "values(?,?,?,?)";
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getW_workno());
			pstmt.setString(2, dto.getP_code());
			pstmt.setInt(3, dto.getW_quentity());
			pstmt.setString(4, dto.getW_workdate());
			row=pstmt.executeUpdate();
			return row;
		}
		public int update(DTO dto)throws Exception{
			String sql="Update tbl_process_2026\r\n"
					+ "set w_workno='',\r\n"
					+ " p_p1=?,\r\n"
					+ " p_p2=?,\r\n"
					+ "p_p3=?,\r\n"
					+ " w_lastdate=?,\r\n"
					+ " w_lasttime=?;";
			int row=0;
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getW_workno());
			pstmt.setString(2, dto.getP_p1());
			pstmt.setString(3, dto.getP_p2());
			pstmt.setString(4, dto.getP_p3());
			pstmt.setString(5, dto.getW_lastdate());
			pstmt.setString(6, dto.getW_lasttime());
			row=pstmt.executeUpdate();
			return row;
		}
		public int p_insert(DTO dto)throws Exception{
			int row=0;
			String sql="insert into tbl_process_2026(w_workno,p_p1,p_p2,p_p3,w_lastdate,w_lasttime)\r\n"
					+ "values(?,?,?,?,?,?)";
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getW_workno());
			pstmt.setString(2, dto.getP_p1());
			pstmt.setString(3, dto.getP_p2());
			pstmt.setString(4, dto.getP_p3());
			pstmt.setString(5, dto.getW_lastdate());
			pstmt.setString(6, dto.getW_lasttime());
			row=pstmt.executeUpdate();
			return row;
		}
		public List<DTO>s_list()throws Exception{
			String sql="select a.p_code,a.p_name,b.p_size,a.p_type,a.p_price\r\n"
					+ "from tbl_product1_2026 A\r\n"
					+ "join tbl_product_size b on a.p_size_code=b.p_size_code";
			List<DTO>list=new ArrayList<DTO>();
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DTO dto=new DTO();
				dto.setP_code(rs.getString("p_code"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_size(rs.getString("p_size"));
				dto.setP_type(rs.getString("p_type"));
				dto.setP_price(rs.getInt("p_price"));
				list.add(dto);
			}
			return list;
		}
		public List<DTO>w_list()throws Exception{
			String sql="select d.w_workno, a.p_code,a.p_name, c.p_size, a.p_type, d.w_quentity, d.w_workdate\r\n"
					+ "from tbl_product1_2026 a\r\n"
					+ "join tbl_worklist d\r\n"
					+ "     on a.p_code = d.p_code\r\n"
					+ "join tbl_process_2026 b\r\n"
					+ "     on d.w_workno = b.w_workno\r\n"
					+ "join tbl_product_size c\r\n"
					+ "     on a.p_size_code = c.p_size_code\r\n"
					+ "order by d.w_workno asc";
			List<DTO>list=new ArrayList<DTO>();
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DTO dto=new DTO();
				dto.setW_workno(rs.getString("w_workno"));
				dto.setP_code(rs.getString("p_code"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_size(rs.getString("p_size"));
				dto.setP_type(rs.getString("p_type"));
				dto.setW_quentity(rs.getInt("w_quentity"));
				dto.setW_workdate(rs.getString("w_workdate"));
				list.add(dto);
			}
			return list;
		}
		public List<DTO>p_list()throws Exception{
			String sql="select b.w_workno,b.p_code,c.p_name,a.p_p1,a.p_p2,a.p_p3,a.w_lastdate,to_char(TO_date(a.w_lasttime, 'HH24:MI'),'HH24:MI') as lasttime\r\n"
					+ "from tbl_process_2026 a\r\n"
					+ "join  tbl_worklist b on a.w_workno=b.w_workno\r\n"
					+ "join  tbl_product1_2026 c on b.p_code=c.p_code\r\n"
					+ "order by b.w_workno asc";
			List<DTO>list=new ArrayList<DTO>();
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DTO dto=new DTO();
				dto.setW_workno(rs.getString("w_workno"));
				dto.setP_code(rs.getString("p_code"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_p1(rs.getString("p_p1"));
				dto.setP_p2(rs.getString("p_p2"));
				dto.setP_p3(rs.getString("p_p3"));
				dto.setW_lastdate(rs.getString("w_lastdate"));
				dto.setLasttime(rs.getString("lasttime"));
				list.add(dto);
			}
			return list;
		}
}
