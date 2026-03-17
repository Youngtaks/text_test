package com.jjm.jjmoa.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jjm.jjmoa.model.MemberDAO;

@WebServlet("/check_nickname")
public class NicknameCheckController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nickname = request.getParameter("nickname");
        MemberDAO memberDAO = new MemberDAO();
        
        boolean isTaken = memberDAO.Nicknamecheck(nickname);
        response.setContentType("text/plain");
        response.getWriter().write(isTaken ? "taken" : "available");
    }
}