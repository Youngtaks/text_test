package com.jjm.jjmoa.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jjm.jjmoa.model.MemberDTO;
import com.jjm.jjmoa.model.PublishDTO;
import com.jjm.jjmoa.model.ScrapDAO;
import com.jjm.jjmoa.model.SearchDAO;
import com.jjm.jjmoa.util.DBManager;

/**
 * Servlet implementation class IndexController
 */
@WebServlet("/mypage")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
	     
		 /* 테스트용 - 세션생성 
		 MemberDTO member = new MemberDTO();
		 member.setEmail("test123@test123");
		 member.setMember_idx(42);
		 member.setRegdate("2024-10-24 09:59:27");
		 
		 member.setNickname("test123");
		 member.setPassword("de27ad6167310d667c33d6e6f3fd2050eaa4941bc5cf5a2c820c5a35f3a292a0");
		 
         session.setAttribute("session_memberDTO", member);
         session.setAttribute("session_isMember", true);
         session.setMaxInactiveInterval(1800); // 30분
         */
		 
		 MemberDTO session_memberDTO = (MemberDTO) session.getAttribute("session_memberDTO");
	     ScrapDAO scrapDAO = ScrapDAO.getInstance();
	        if (session_memberDTO != null) {
	            int memberId = session_memberDTO.getMember_idx();

	            // 사용자가 스크랩한 공고 목록 조회
	            List<PublishDTO> scrapedPosts = scrapDAO.selScrapedPosts(memberId);

	            // 조회된 공고 리스트를 request 객체에 설정하여 JSP로 전달
	            request.setAttribute("scrapedPosts", scrapedPosts);
	        }
		 
		 request.setAttribute("session_memberDTO", session_memberDTO);
	    
	     request.getRequestDispatcher("/jsp/mypage.jsp").forward(request, response);
	    }   

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
