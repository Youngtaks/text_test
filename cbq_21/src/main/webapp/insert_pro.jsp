<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% DAO dao=new DAO();
     DTO dto=new DTO();
     
     request.setCharacterEncoding("utf-8");
     
     dto.setRegistration_code(request.getParameter("registration_code"));
     dto.setGame_numbers(Integer.parseInt(request.getParameter("game_numbers")));
     dto.setAppearance(Integer.parseInt(request.getParameter("appearance")));
     dto.setHit_numbers(Integer.parseInt(request.getParameter("hit_numbers")));
     dto.setHome_runs(Integer.parseInt(request.getParameter("home_runs")));
     dto.setPut_out(Integer.parseInt(request.getParameter("put_out")));
     dto.setDouble_play(Integer.parseInt(request.getParameter("double_play")));
     dto.setError_count(Integer.parseInt(request.getParameter("error_count")));
     
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