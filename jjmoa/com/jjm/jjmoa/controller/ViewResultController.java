package com.jjm.jjmoa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.jjm.jjmoa.model.MemberDTO;
import com.jjm.jjmoa.model.PublishDAO;
import com.jjm.jjmoa.model.PublishDTO;
import com.jjm.jjmoa.model.ScrapDAO;

/**
 * Servlet implementation class ViewResultController
 */
@WebServlet("/viewResult")
public class ViewResultController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewResultController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		// 요청 파라미터 받기
		int publish_idx = Integer.parseInt(request.getParameter("publishIdx"));
		
		//  세션
		HttpSession session = request.getSession();
		MemberDTO session_memberDTO = (MemberDTO) session.getAttribute("session_memberDTO");
		int memberId = 0;
		if(session_memberDTO != null) {
			memberId = session_memberDTO.getMember_idx();
		}
		PublishDAO publishDAO = PublishDAO.getInstance();
		ScrapDAO scrapDAO = ScrapDAO.getInstance();
		PublishDTO publishDTO = publishDAO.getPublish(publish_idx);
		
		
		// JSON 응답으로 결과 반환
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		Gson gson = new Gson();
		String jsonResponse = gson.toJson(publishDTO);
		response.getWriter().write(jsonResponse);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
