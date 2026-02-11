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
			int row=0;
			String sql="INSERT INTO TBL_BUY_STOCK_202201\r\n"
					+ "					 (BUY_DATE, STOCK_ITEM_CODE, BUY_NUMBER, BUY_PRICE, DEPT_CODE)\r\n"
					+ "					 VALUES (?,?,?,?,?)";
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBuy_date());
			pstmt.setString(2, dto.getStock_item_code());
			pstmt.setInt(3, dto.getBuy_number());
			pstmt.setInt(4, dto.getBuy_price());
			pstmt.setString(5, dto.getDept_code());
			row=pstmt.executeUpdate();
			
			
			return row;
		}
		public List<DTO>j_list()throws Exception{
			String sql="select stock_item_code,\r\n"
					+ "                        stock_item_name,\r\n"
					+ "                        stock_item_market,\r\n"
					+ "                        stock_item_category,\r\n"
					+ "                        stock_item_listed_date\r\n"
					+ "                        from TBL_STOCK_ITEM_202201";
			List<DTO>list=new ArrayList<DTO>();
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DTO dto=new DTO();
				dto.setStock_item_code(rs.getString("stock_item_code"));
				dto.setStock_item_name(rs.getString("stock_item_name"));
				dto.setStock_item_market(rs.getString("stock_item_market"));
				dto.setStock_item_category(rs.getString("stock_item_category"));
				dto.setStock_item_listed_date(rs.getString("stock_item_listed_date"));
				list.add(dto);
			}
		return list;
		}
		public List<DTO>m_list()throws Exception{
			String sql=" select b.buy_date,b.stock_item_code,c.stock_item_name,\r\n"
					+ "                        b.buy_number,b.buy_price,a.dept_name\r\n"
					+ "                        from tbl_dept_202201 a\r\n"
					+ "                        join tbl_buy_stock_202201 b on a.dept_code=b.dept_code\r\n"
					+ "                        join tbl_stock_item_202201 c on b.stock_item_code=c.stock_item_code";
			List<DTO>list=new ArrayList<DTO>();
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DTO dto=new DTO();
				dto.setBuy_date(rs.getString("buy_date"));
				dto.setStock_item_code(rs.getString("stock_item_code"));
				dto.setStock_item_name(rs.getString("stock_item_name"));
				dto.setBuy_number(rs.getInt("buy_number"));
				dto.setBuy_price(rs.getInt("buy_price"));
				dto.setDept_name(rs.getString("dept_name"));
				list.add(dto);
			}
		return list;
		}
		public List<DTO>t_list()throws Exception{
			String sql="select a.dept_code,a.dept_name,sum(b.buy_number)as t_number,sum(b.buy_number*b.buy_price)as t_price\r\n"
					+ "from tbl_dept_202201 a\r\n"
					+ "join tbl_buy_stock_202201 b on a.dept_code=b.dept_code\r\n"
					+ "group by a.dept_code,a.dept_name\r\n"
					+ "order by dept_code asc";
			List<DTO>list=new ArrayList<DTO>();
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DTO dto=new DTO();
				dto.setDept_code(rs.getString("dept_code"));
				dto.setDept_name(rs.getString("dept_name"));
				dto.setT_number(rs.getInt("t_number"));
				dto.setT_price(rs.getInt("t_price"));
				list.add(dto);
			}
		return list;
		}
}
