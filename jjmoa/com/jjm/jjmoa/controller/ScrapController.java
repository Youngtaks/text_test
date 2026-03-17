package com.jjm.jjmoa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.jjm.jjmoa.model.MemberDTO;
import com.jjm.jjmoa.model.ScrapDAO;

@WebServlet("/scrap")
public class ScrapController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ScrapController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 결과값
		String result = ""; 
		
	    // 로그인, 세션 
		HttpSession session = request.getSession();
	     MemberDTO session_memberDTO = (MemberDTO) session.getAttribute("session_memberDTO");
	     request.setAttribute("session_memberDTO", session_memberDTO);
	    if (session_memberDTO == null) {
	    	result = "notMember";
			// JSON 응답으로 결과 반환
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			Gson gson = new Gson();
			String jsonResponse = gson.toJson(result);
			response.getWriter().write(jsonResponse);
	    } else {
	    	// 요청 파라미터 받기
	    	String scrapType = request.getParameter("scrapType");
	    	String param_publish_idx = request.getParameter("publish_idx");
	    	int publish_idx = Integer.parseInt(param_publish_idx);
	    	int member_idx = session_memberDTO.getMember_idx();
	    	
	    	// DAO 호출해서 검색 결과 수 가져오기
	    	ScrapDAO scrapDAO = ScrapDAO.getInstance();
	    	if (scrapType.equals("insert")) {			
	    		result = scrapDAO.insScrap(publish_idx, member_idx);
	    	} else if (scrapType.equals("delete")) { 
	    		result = scrapDAO.delScrap(publish_idx, member_idx);
	    	}
	    	
	    	// JSON 응답으로 결과 반환
	    	response.setContentType("application/json");
	    	response.setCharacterEncoding("UTF-8");
	    	Gson gson = new Gson();
	    	String jsonResponse = gson.toJson(result);
	    	response.getWriter().write(jsonResponse);
	    	
	    }
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
