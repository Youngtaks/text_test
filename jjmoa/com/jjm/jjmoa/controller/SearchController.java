package com.jjm.jjmoa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jjm.jjmoa.model.JobCategoryDTO;
import com.jjm.jjmoa.model.MemberDTO;
import com.jjm.jjmoa.model.SearchDAO;

@WebServlet("/search")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // 로그인, 세션 
		HttpSession session = request.getSession();
	     MemberDTO session_memberDTO = (MemberDTO) session.getAttribute("session_memberDTO");
	     request.setAttribute("session_memberDTO", session_memberDTO);
	    if (session_memberDTO != null) {
	    	request.setAttribute("session_isMember", true);
	    }
	    
	    SearchDAO searchDAO = SearchDAO.getInstance();
	    
	    // 직종 데이터 가져오기
	    List<JobCategoryDTO> jobCategoryList = searchDAO.selJobCategory(); 
	    request.setAttribute("jobCategoryList", jobCategoryList);
	    
	    // 플랫폼 데이터 가져오기
	    List<String> publishSourceList = searchDAO.selPublishSource(); 
	    request.setAttribute("publishSourceList", publishSourceList);
	    
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/search.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
