<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jjm.jjmoa.model.MemberDAO" %>
<%@ page import="com.jjm.jjmoa.model.MemberDTO"%>
<%
    request.setCharacterEncoding("UTF-8");
    MemberDAO dao = new MemberDAO();
    String email = request.getParameter("email");
    String nickname = request.getParameter("nickname");
    String password = request.getParameter("password");
    MemberDTO member = new MemberDTO(email, nickname, password);
    
    boolean success = dao.register(member); 

    if (success) {
        response.sendRedirect("success.jsp"); 
    } else { 
%>
        <script>
            alert("회원가입에 실패했습니다. 다시 시도해주세요.");
            history.back(); 
        </script>
<%
    }
%>