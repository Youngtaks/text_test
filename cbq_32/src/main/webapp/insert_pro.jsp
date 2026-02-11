<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <%
    	DAO dao=new DAO();
   		DTO dto=new DTO();
   		request.setCharacterEncoding("utf-8");
   		
   		dto.setT_no(request.getParameter("t_no"));
   		dto.setP_code(request.getParameter("p_code"));
   		dto.setT_type(request.getParameter("t_type"));
   		dto.setT_cnt(Integer.parseInt(request.getParameter("t_cnt")));
   		dto.setT_date(request.getParameter("t_date"));
   		dto.setC_code(request.getParameter("c_code"));
   		
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