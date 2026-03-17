package com.jjm.jjmoa.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jjm.jjmoa.model.*;

/**
 * Servlet implementation class ViewController
 */
@WebServlet("/view")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩 설정
		request.setCharacterEncoding("UTF-8"); 
		// 로그인, 세션 
		HttpSession session = request.getSession();
	    MemberDTO session_memberDTO = (MemberDTO) session.getAttribute("session_memberDTO");
	    request.setAttribute("session_memberDTO", session_memberDTO);
	    if (session_memberDTO != null) {
	    	request.setAttribute("session_isMember", true);
	    }

	    // 받아온 publish_idx로 DB에 있는 publish를 불러온다.
		int publishIdx = Integer.parseInt(request.getParameter("publish_idx"));
		PublishDAO dao = PublishDAO.getInstance();
		PublishDTO publish = dao.getPublish(publishIdx);
		
		// publish_source의 값이 있을 때만 
		String publish_source_link = "";
		if (publish != null) {  
			if (publish.getPublish_source().equals("worldjob")) {
				publish_source_link = "https://www.worldjob.or.kr";
			}else if (publish.getPublish_source().equals("saramin")) {
				publish_source_link = "https://www.saramin.co.kr";
			}
		}
		
		// 스크랩 
		
		
		request.setAttribute("publish_source_link", publish_source_link);
		request.setAttribute("publish", publish);
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/view.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
