package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;
import model.MemberDTO;

@WebServlet("/Register_login")
public class Register_LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // 세션 유효성 검증
        HttpSession existingSession = request.getSession(false); 
        if (existingSession != null && existingSession.getAttribute("member") != null) {
            // 이미 로그인된 상태인 경우
            response.sendRedirect("/success?nickname=" + existingSession.getAttribute("nickname"));
            return; 
        }

        MemberDAO memberDAO = new MemberDAO();
        MemberDTO member = memberDAO.getMember(email, password);  

        if (member != null) {  
            HttpSession session = request.getSession();
            session.setAttribute("memberId", member.getMember_idx());
            session.setAttribute("nickname", member.getNickname());
            session.setAttribute("isMember", true);
            session.setMaxInactiveInterval(1800); 

            response.sendRedirect("/success?nickname=" + member.getNickname());
        } else {  
            response.sendRedirect("/register_error?error=invalid_credentials");
        }
    }
}