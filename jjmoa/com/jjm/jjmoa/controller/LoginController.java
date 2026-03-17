package com.jjm.jjmoa.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

import com.jjm.jjmoa.model.MemberDAO;
import com.jjm.jjmoa.model.MemberDTO;
import com.jjm.jjmoa.util.HashUtil;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/jsp/login.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // 이메일로 회원 정보 가져오기
        MemberDAO memberDAO = new MemberDAO();
        MemberDTO member = memberDAO.getMemberByEmail(email);
        
        // 비밀번호 해시 체크
        if (member != null && HashUtil.checkPassword(password, member.getPassword())) {
     //   if (member != null) {
        HttpSession session = request.getSession();
            session.setAttribute("session_memberDTO", member);
            session.setAttribute("session_isMember", true);
            session.setMaxInactiveInterval(1800); // 30분

            // 로그인 성공 후 홈 페이지로 리다이렉트
            response.sendRedirect("/index");
        } else {
            // 로그인 실패 시 오류 페이지로 리다이렉트
            response.sendRedirect("/login_error?error=invalid_credentials");
        }
    }
}