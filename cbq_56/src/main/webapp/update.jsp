<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% DAO dao=new DAO();
    	DTO dto=new DTO();
    	request.setCharacterEncoding("utf-8");
    	
    	dto.setW_workno(request.getParameter("w_workno"));
    	dto.setP_p1(request.getParameter("p_p1"));
    	dto.setP_p2(request.getParameter("p_p2"));
    	dto.setP_p3(request.getParameter("p_p3"));
    	dto.setW_lastdate(request.getParameter("w_lastdate"));
    	dto.setW_lasttime(request.getParameter("w_lasttime"));
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