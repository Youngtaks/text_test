<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% DAO dao=new DAO(); 
    	DTO dto=new DTO();
    	
    	request.setCharacterEncoding("utf-8");
    	dto.setV_jumin(request.getParameter("v_jumin"));
    	dto.setV_name(request.getParameter("v_name"));
    	dto.setM_no(request.getParameter("m_no"));
    	dto.setV_time(request.getParameter("v_time"));
    	dto.setV_area(request.getParameter("v_area"));
    	dto.setV_confirm(request.getParameter("v_confirm"));
    	
    	dao.insert(dto);
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