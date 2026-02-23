<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% DAO dao=new DAO();
    	DTO dto=new DTO();
    	request.setCharacterEncoding("utf-8");
    	
    	dto.setPlayer_no(request.getParameter("player_no"));
    	dto.setPoint_1(Integer.parseInt(request.getParameter("point_1")));
    	dto.setPoint_2(Integer.parseInt(request.getParameter("point_2")));
    	dto.setPoint_3(Integer.parseInt(request.getParameter("point_3")));
    	dto.setPoint_4(Integer.parseInt(request.getParameter("point_4")));
    	int row=dao.update(dto);
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