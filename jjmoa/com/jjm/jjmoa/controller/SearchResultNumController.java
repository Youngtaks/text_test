package com.jjm.jjmoa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.jjm.jjmoa.model.PublishDTO;
import com.jjm.jjmoa.model.SearchDAO;

@WebServlet("/searchResultNum")
public class SearchResultNumController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchResultNumController() {
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
		
		// DAO 호출해서 검색 결과 수 가져오기
		SearchDAO searchDAO = SearchDAO.getInstance();
		int totalCount = searchDAO.selSearchResultCount(searchKeyword, jobcategoryIdx, platform);
		
		// JSON 응답으로 결과 반환
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		Gson gson = new Gson();
		String jsonResponse = gson.toJson(totalCount);
		response.getWriter().write(jsonResponse);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
