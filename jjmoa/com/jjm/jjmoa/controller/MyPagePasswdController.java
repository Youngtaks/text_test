package com.jjm.jjmoa.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jjm.jjmoa.model.MemberDTO;
import com.jjm.jjmoa.util.HashUtil;

@WebServlet("/mypagepasswd")
public class MyPagePasswdController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MyPagePasswdController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        MemberDTO session_memberDTO = (MemberDTO) session.getAttribute("session_memberDTO");

        RequestDispatcher rd = request.getRequestDispatcher("/jsp/mypage_passwd.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        MemberDTO session_memberDTO = (MemberDTO) session.getAttribute("session_memberDTO");

        if (session_memberDTO == null) {
            response.sendRedirect("login");
            return;
        }

        // 비밀번호 파라미터 받기
        String inputPassword = request.getParameter("passwd");

        // 비밀번호가 입력되지 않았을 때
        if (inputPassword == null || inputPassword.length() == 0) {
            request.setAttribute("errorMessage", "비밀번호를 입력해 주세요.");
            request.getRequestDispatcher("/jsp/mypage_passwd.jsp").forward(request, response);
            return;
        }

        // 비밀번호가 맞는지 확인
        if (HashUtil.checkPassword(inputPassword, session_memberDTO.getPassword())) {
            // 비밀번호가 맞으면 mypage_modify.jsp로 이동
            response.sendRedirect("/mypagemodify");
        } else {
        	 // 비밀번호가 틀렸을 때
            request.setAttribute("errorMessage", "※ 잘못된 비밀번호입니다. 비밀번호를 재입력한 후 다시 시도해 주세요.");
            request.getRequestDispatcher("/jsp/mypage_passwd.jsp").forward(request, response);
        }
    }
}
