<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% 
    	request.setCharacterEncoding("utf-8");
    String registration_code=request.getParameter("registration_code");
    DAO dao=new DAO();
    List<DTO>list=dao.p_list(registration_code);
    if(list==null||list.size()==0){
    	response.sendRedirect("player_null.jsp?registration_code="+registration_code);
    	return;
    }
    response.sendRedirect("p_list.jsp?registration_code="+registration_code);
    
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