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
import com.jjm.jjmoa.model.PublishDTO;
import com.jjm.jjmoa.model.ScrapDAO;
import com.jjm.jjmoa.model.SearchDAO;

@WebServlet("/searchResult")
public class SearchResultController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchResultController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 요청 파라미터 받기
		String searchKeyword = request.getParameter("searchKeyword");
		String sortType = request.getParameter("sortType");
		String jobcategoryIdx = request.getParameter("jobcategoryIdx");
	    if (jobcategoryIdx == null || jobcategoryIdx.trim().isEmpty()) {
	        jobcategoryIdx = null; // 빈 문자열을 null로 처리
	    }
		String platform = request.getParameter("platform");
		  if (platform == null || platform.trim().isEmpty()) {
		        platform = null; // 빈 문자열을 null로 처리
		    }
		int limit = Integer.parseInt(request.getParameter("limit"));
		int offset = Integer.parseInt(request.getParameter("offset"));
		
		//  세션
		HttpSession session = request.getSession();
		MemberDTO session_memberDTO = (MemberDTO) session.getAttribute("session_memberDTO");
		int memberId = 0;
		if(session_memberDTO != null) {
			memberId = session_memberDTO.getMember_idx();
		}
		
		// DAO 호출해서 검색 결과 가져오기
		SearchDAO searchDAO = SearchDAO.getInstance();
		ScrapDAO scrapDAO = ScrapDAO.getInstance();
		List<PublishDTO> searchResults = searchDAO.selSearchResult(searchKeyword, sortType, jobcategoryIdx, platform,
				limit, offset, memberId);
		
//		if (session_memberDTO != null) {
			/*
			// 스크랩 표시
			for (PublishDTO publish : searchResults) {
				boolean isScrap = scrapDAO.isScraped(publish.getPublish_idx(), session_memberDTO.getMember_idx());
				publish.setIsScrap(isScrap);
			}
			*/
			// 속도 이슈로 코드 수정 
			
//		}

		// JSON 응답으로 결과 반환
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		Gson gson = new Gson();
		String jsonResponse = gson.toJson(searchResults);
		response.getWriter().write(jsonResponse);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
