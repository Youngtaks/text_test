<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <%
    	DAO dao=new DAO();
    	DTO dto=new DTO();
    	request.setCharacterEncoding("utf-8");
    	
    	dto.setRegist_month(request.getParameter("regist_month"));
    	dto.setC_no(request.getParameter("c_no"));
    	dto.setClass_area(request.getParameter("class_area"));
    	dto.setTuition(Integer.parseInt(request.getParameter("tuition")));
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