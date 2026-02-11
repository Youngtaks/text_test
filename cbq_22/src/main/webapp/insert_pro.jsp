<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% DAO dao=new DAO();
    	DTO dto=new DTO();
    	
    	request.setCharacterEncoding("utf-8");
    	dto.setResv_no(request.getParameter("resv_no"));
    	dto.setCust_no(request.getParameter("cust_no"));
    	dto.setResv_date(request.getParameter("resv_date"));
    	dto.setCourt_no(request.getParameter("court_no"));
    	
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