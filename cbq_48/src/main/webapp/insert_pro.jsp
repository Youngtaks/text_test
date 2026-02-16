<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% DAO dao=new DAO();
    	DTO dto=new DTO();
    	request.setCharacterEncoding("utf-8");
    	
    	dto.setStudentid(request.getParameter("studentid"));
    	dto.setSubjectcode(request.getParameter("subjectcode"));
    	dto.setMid(Integer.parseInt(request.getParameter("mid")));
    	dto.setFinal_exam(Integer.parseInt(request.getParameter("final_exam")));
    	dto.setReport(Integer.parseInt(request.getParameter("report")));
    	dto.setAttend(Integer.parseInt(request.getParameter("attend")));
    	dto.setEtc(Integer.parseInt(request.getParameter("etc")));
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