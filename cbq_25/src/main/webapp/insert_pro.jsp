<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
	<% DAO dao=new DAO();
		DTO dto=new DTO();
		
		dto.setTest_date(request.getParameter("test_date"));
		dto.setTest_ampm(request.getParameter("test_ampm"));
		dto.setPollution(request.getParameter("pollution"));
		dto.setCity_code(request.getParameter("city_code"));
		dto.setTest_value(Integer.parseInt(request.getParameter("test_value")));
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