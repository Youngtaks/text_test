<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*"%>
    <% DAO dao=new DAO();
    	DTO dto=new DTO();
    	request.setCharacterEncoding("utf-8");
    	dto.setArtist_id(request.getParameter("artist_id"));
    	dto.setArtist_name(request.getParameter("artist_name"));
    	
    	String y=request.getParameter("artist_year");
    	String m=request.getParameter("artist_month");
    	String d=request.getParameter("artist_day");
    	dto.setArtist_birth(y+m+d);
    	dto.setArtist_gender(request.getParameter("artist_gender"));
    	dto.setTalent(request.getParameter("talent"));
    	dto.setAgency(request.getParameter("agency"));
    	
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