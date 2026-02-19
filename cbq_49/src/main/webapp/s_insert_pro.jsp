<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <%  DAO dao=new DAO();
    	DTO dto=new DTO();
    	request.setCharacterEncoding("utf-8");
    	
    	dto.setSyear(request.getParameter("syear"));
    	dto.setSclass(request.getParameter("sclass"));
    	dto.setSno(request.getParameter("sno"));
    	dto.setSname(request.getParameter("sname"));
    	dto.setBirth(request.getParameter("birth"));
    	dto.setGender(request.getParameter("gender"));
    	dto.setTel1(request.getParameter("tel1"));
    	dto.setTel2(request.getParameter("tel2"));
    	dto.setTel3(request.getParameter("tel3"));
    	int row=dao.s_insert(dto);
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