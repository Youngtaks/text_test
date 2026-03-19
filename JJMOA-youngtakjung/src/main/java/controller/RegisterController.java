package controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjm.jjmoa.util.HashUtil;

import model.MemberDAO;
import model.MemberDTO; 

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String email = request.getParameter("email");
        String nickname = request.getParameter("nickname");
        String password = request.getParameter("password");

        // 비밀번호 해시 처리
        String hashedPassword = HashUtil.hashPassword(password); 

        MemberDTO member = new MemberDTO(0, email, nickname, hashedPassword, null);
        MemberDAO memberDAO = new MemberDAO();

        boolean success = memberDAO.register(member);

        if (success) {
            String encodedNickname = URLEncoder.encode(nickname, StandardCharsets.UTF_8.toString());
            response.sendRedirect("/success?nickname=" + encodedNickname);
        } else {
            response.sendRedirect("/jsp/register_error.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("checkEmail".equals(action)) {
            String email = request.getParameter("email");
            MemberDAO memberDAO = new MemberDAO();
            boolean isTaken = memberDAO.Emailcheck(email);
            response.setContentType("text/plain");
            response.getWriter().write(isTaken ? "taken" : "available");
            return;
        }
        RequestDispatcher rd = request.getRequestDispatcher("jsp/register.jsp");
        rd.forward(request, response);
    }
}