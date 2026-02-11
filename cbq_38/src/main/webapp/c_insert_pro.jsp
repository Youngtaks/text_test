<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% 
    	DAO dao=new DAO();
    	DTO dto=new DTO();
    	request.setCharacterEncoding("utf-8");
    	
    	dto.setCode(request.getParameter("code"));
    	dto.setName(request.getParameter("name"));
    	dto.setBirth(request.getParameter("birth"));
    	dto.setCompany(request.getParameter("company"));
    	
    	int row=dao.c_insert(dto);
    	response.sendRedirect("c_insert.jsp");
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