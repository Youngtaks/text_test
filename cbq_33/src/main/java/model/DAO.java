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
			String sql="insert into tbl_drive(drv_date,car_no,drv_start,drv_end,dept_code,drv_money)\r\n"
					+ " values(?,?,?,?,?,?)";
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getDrv_date());
			pstmt.setString(2, dto.getCar_no());
			pstmt.setInt(3, dto.getDrv_start());
			pstmt.setInt(4, dto.getDrv_end());
			pstmt.setString(5, dto.getDept_code());
			pstmt.setInt(6, dto.getDrv_money());
			row=pstmt.executeUpdate();
			return row;
		}
		public List<DTO>c_list()throws Exception{
			String sql="select car_no,car_model,car_company,car_date from tbl_car";
			List<DTO>list=new ArrayList<DTO>();
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DTO dto=new DTO();
				dto.setCar_no(rs.getString("car_no"));
				dto.setCar_model(rs.getString("car_model"));
				dto.setCar_company(rs.getString("car_company"));
				dto.setCar_date(rs.getString("car_date"));
				list.add(dto);
			}
			return list;
		}
		public List<DTO>j_list()throws Exception{
			String sql="select b.drv_date,b.car_no,c.car_model,b.drv_start,\r\n"
					+ "b.drv_end,a.dept_name,b.drv_money\r\n"
					+ "from tbl_dept a\r\n"
					+ "join tbl_drive b on a.dept_code=b.dept_code\r\n"
					+ "join tbl_car c on b.car_no=c.car_no";
			List<DTO>list=new ArrayList<DTO>();
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DTO dto=new DTO();
					dto.setDrv_date(rs.getString("drv_date"));
					dto.setCar_no(rs.getString("car_no"));
					dto.setCar_model(rs.getString("car_model"));
					dto.setDrv_start(rs.getInt("drv_start"));
					dto.setDrv_end(rs.getInt("drv_end"));
					dto.setDept_name(rs.getString("dept_name"));
					dto.setDrv_money(rs.getInt("drv_money"));
				list.add(dto);
			}
			return list;
		}
		public List<DTO>b_list()throws Exception{
			String sql="select a.dept_code,b.dept_name,sum(a.drv_end-a.drv_start) as t_drv,sum(a.drv_money)as t_money\r\n"
					+ "from tbl_drive a\r\n"
					+ "join tbl_dept b on a.dept_code=b.dept_code\r\n"
					+ "group by a.dept_code,b.dept_name";
			List<DTO>list=new ArrayList<DTO>();
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DTO dto=new DTO();
					dto.setDept_code(rs.getString("dept_code"));
					dto.setDept_name(rs.getString("dept_name"));
					dto.setT_drv(rs.getInt("t_drv"));
					dto.setT_money(rs.getInt("t_money"));
				list.add(dto);
			}
			return list;
			
		}
}