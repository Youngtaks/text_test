package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login_error")
public class Login_ErrorController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String error = request.getParameter("error");
        String errorMessage = "";

        if ("invalid_credentials".equals(error)) {
            errorMessage = "이메일 또는 비밀번호가 잘못되었습니다.";
        }

        request.setAttribute("errorMessage", errorMessage);
        request.getRequestDispatcher("/jsp/login_error.jsp").forward(request, response);
    }
}
