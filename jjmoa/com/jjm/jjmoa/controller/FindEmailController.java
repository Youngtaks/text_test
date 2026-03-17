package com.jjm.jjmoa.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jjm.jjmoa.model.MemberDAO;

@WebServlet("/findEmail")
public class FindEmailController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/findEmail.jsp").forward(request, response); // 이메일 찾기 페이지로 포워드
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        // 이메일 입력값 검증
        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("error", "이메일을 입력해 주세요.");
            request.getRequestDispatcher("/jsp/findEmail.jsp").forward(request, response);
            return;
        }

        MemberDAO memberDAO = new MemberDAO();
        boolean emailExists = memberDAO.checkEmail(email);

        if (emailExists) {
            request.setAttribute("email", email);
            request.getRequestDispatcher("/jsp/emailResult.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "등록되지 않은 이메일입니다.");
            request.getRequestDispatcher("/jsp/findEmail.jsp").forward(request, response);
        }
    }
}
