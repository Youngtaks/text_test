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
		public  int insert(DTO dto)throws Exception{
			int row=0;
			String sql="INSERT INTO tbl_inout (t_no, p_code, t_type, t_cnt, t_date, c_code) \r\n"
					+ "VALUES (?,?,?,?,?,?)";
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getT_no());
			pstmt.setString(2, dto.getP_code());
			pstmt.setString(3, dto.getT_type());
			pstmt.setInt(4, dto.getT_cnt());
			pstmt.setString(5, dto.getT_date());
			pstmt.setString(6, dto.getC_code());
			row=pstmt.executeUpdate();
			return row;
		}
		public List<DTO>p_list()throws Exception{
			List<DTO>list=new ArrayList<DTO>();
			String sql="select p_code,p_name,p_size,p_incost,p_outcost from tbl_product";
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DTO dto=new DTO();
				dto.setP_code(rs.getString("p_code"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_size(rs.getInt("p_size"));
				dto.setP_incost(rs.getInt("p_incost"));
				dto.setP_outcost(rs.getInt("p_outcost"));
				list.add(dto);
				
			}
			return list;
		}
		public List<DTO>n_list()throws Exception{
			List<DTO>list=new ArrayList<DTO>();
			String sql="select b.t_no,b.p_code,a.p_name,b.t_type,b.t_cnt,c.c_name,b.t_date\r\n"
					+ "from tbl_product a \r\n"
					+ "join tbl_inout b on a.p_code=b.p_code\r\n"
					+ "join tbl_company c on b.c_code=c.c_code";
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DTO dto=new DTO();
				dto.setT_no(rs.getString("t_no"));
				dto.setP_code(rs.getString("p_code"));
				dto.setP_name(rs.getString("p_name"));
				dto.setT_type(rs.getString("t_type"));
				dto.setT_cnt(rs.getInt("t_cnt"));
				dto.setC_name(rs.getString("c_name"));
				dto.setT_date(rs.getString("t_date"));
				list.add(dto);
				
			}
			return list;
		}
		public List<DTO>m_list()throws Exception{
			List<DTO>list=new ArrayList<DTO>();
			String sql="select a.p_code,a.p_name,sum(b.t_cnt)as tot_cnt,sum(b.t_cnt*(a.p_outcost-a.p_incost))as t_price\r\n"
					+ "from tbl_product a\r\n"
					+ "join tbl_inout b on a.p_code=b.p_code\r\n"
					+ "WHERE b.t_type = 'O'\r\n"
					+ "group by a.p_code,a.p_name\r\n"
					+ "order by a.p_code asc";
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DTO dto=new DTO();
				dto.setP_code(rs.getString("p_code"));
				dto.setP_name(rs.getString("p_name"));
				dto.setTot_cnt(rs.getInt("tot_cnt"));
				dto.setT_price(rs.getInt("t_price"));
				list.add(dto);
				
			}
			return list;
		}
}
