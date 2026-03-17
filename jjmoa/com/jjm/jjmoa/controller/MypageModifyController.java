package com.jjm.jjmoa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jjm.jjmoa.model.MemberDTO;
import com.jjm.jjmoa.model.MyPageDAO;

/**
 * Servlet implementation class IndexController
 */
@WebServlet("/mypagemodify")
public class MypageModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageModifyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
	     MemberDTO session_memberDTO = (MemberDTO) session.getAttribute("session_memberDTO");
	    request.setAttribute("session_memberDTO", session_memberDTO);
	    
		request.getRequestDispatcher("/jsp/mypage_modify.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // 인코딩 설정
	    request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");

	    HttpSession session = request.getSession();
	    MemberDTO session_memberDTO = (MemberDTO) session.getAttribute("session_memberDTO");

	    String email = session_memberDTO.getEmail();
	    String nickname = request.getParameter("nickname");
	   
	    String password = request.getParameter("passwd");

	    MyPageDAO dao = new MyPageDAO();
	    System.out.println(nickname);
	    String sessionNickname = session_memberDTO.getNickname();
	    if(!nickname.equals(sessionNickname) && dao.isNicknameDuplicate(nickname)) {
	        request.setAttribute("errorMsg", "중복된 닉네임이 있습니다.");
	        request.getRequestDispatcher("/jsp/mypage_modify.jsp").forward(request, response);
	        return;
	    }
	    
        // 닉네임과 비밀번호 업데이트
        dao.updateMemberInfo(email, nickname, password);
        
        // 세션에 있는 회원 정보도 업데이트
        session_memberDTO.setNickname(nickname);
        session.setAttribute("session_memberDTO", session_memberDTO);  // 세션에 업데이트된 정보 저장
        response.sendRedirect("mypage");
	        
	
	}
	
}