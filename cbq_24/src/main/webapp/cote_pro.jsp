<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% DAO dao=new DAO();
     String cust_no=request.getParameter("cust_no");
     List<DTO>list=dao.c_list(cust_no);
    
     
     if(list==null || list.size()==0){
    	 response.sendRedirect("cote_null.jsp");
    	 return;
     }
     response.sendRedirect("c_list.jsp?cust_no=" + cust_no);
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