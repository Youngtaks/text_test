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
	public int c_insert(DTO dto)throws Exception{
		int row=0;
		String sql="insert into tbl_customer1(code,name,birth,company)\r\n"
				+ "values(?,?,?,?)";
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, dto.getCode());
		pstmt.setString(2, dto.getName());
		pstmt.setString(3, dto.getBirth());
		pstmt.setString(4, dto.getCompany());
		row=pstmt.executeUpdate();
		return row;
	}
	public int p_insert(DTO dto)throws Exception{
		int row=0;
		String sql="insert into tbl_contract(code,product,manager) \r\n"
				+ "values (?,?,?)";
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, dto.getCode());
		pstmt.setString(2, dto.getProduct());
		pstmt.setString(3, dto.getManager());
		row=pstmt.executeUpdate();
		return row;
	}
	public List<DTO>cus_list()throws Exception{
		List<DTO>list=new ArrayList<DTO>();
		String sql="select code, name from tbl_customer1 order by code";
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			DTO dto=new DTO();
			dto.setCode(rs.getString("code"));
			dto.setName(rs.getString("name"));
			
			list.add(dto);
		}
		return list;
	}
	public List<DTO>b_list()throws Exception{
		List<DTO>list=new ArrayList<DTO>();
		String sql="select a.code,a.name,a.birth,a.company,b.product,b.manager,c.price\r\n"
				+ "from tbl_customer1 a\r\n"
				+ "join tbl_contract b on a.code=b.code\r\n"
				+ "join tbl_product1 c on b.product=c.product\r\n"
				+ "order by a.code asc";
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			DTO dto=new DTO();
			dto.setCode(rs.getString("code"));
			dto.setName(rs.getString("name"));
			dto.setBirth(rs.getString("birth"));
			dto.setCompany(rs.getString("company"));
			dto.setProduct(rs.getString("product"));
			dto.setManager(rs.getString("manager"));
			dto.setPrice(rs.getInt("price"));
			list.add(dto);
		}
		return list;
	}
	public List<DTO>t_list()throws Exception{
		List<DTO>list=new ArrayList<DTO>();
		String sql="select a.code,a.name,sum(c.price)as t_price\r\n"
				+ "from tbl_customer1 a\r\n"
				+ "join tbl_contract b on a.code=b.code\r\n"
				+ "join tbl_product1 c on b.product=c.product\r\n"
				+ "group by a.code,a.name\r\n"
				+ "order by t_price desc";
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			DTO dto=new DTO();
			dto.setCode(rs.getString("code"));
			dto.setName(rs.getString("name"));
			dto.setT_price(rs.getInt("t_price"));
			list.add(dto);
			
		}
		return list;
	}

}


