<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% DAO dao=new DAO();
    	DTO dto=new DTO();
    	request.setCharacterEncoding("utf-8");
    	
    	dto.setDrv_date(request.getParameter("drv_date"));
    	dto.setCar_no(request.getParameter("car_no"));
    	dto.setDrv_start(request.getParameter("drv_start"));
    	dto.setDrv_end(request.getParameter("drv_end"));
    	dto.setDept_code(request.getParameter("dept_code"));
    	dto.setDrv_money(request.getParameter("drv_money"));
    	
    	int row=dao.insert(dto);
    	response.sendRedirect("index.jsp");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>