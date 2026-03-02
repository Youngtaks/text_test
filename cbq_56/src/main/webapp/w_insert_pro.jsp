<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% DAO dao=new DAO();
    	DTO dto=new DTO();
    	request.setCharacterEncoding("utf-8");
    	
    	dto.setW_workno(request.getParameter("w_workno"));
    	dto.setP_code(request.getParameter("p_code"));
    	dto.setW_quentity(Integer.parseInt(request.getParameter("w_quentity")));
    	dto.setW_workdate(request.getParameter("w_workdate"));
    	int row=dao.w_insert(dto);
    	response.sendRedirect("w_list.jsp");
    
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