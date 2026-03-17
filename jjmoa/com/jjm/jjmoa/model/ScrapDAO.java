package com.jjm.jjmoa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jjm.jjmoa.util.DBManager;
import com.jjm.jjmoa.model.JobCategoryDTO;

public class ScrapDAO {
	public ScrapDAO() {
	}

	private static ScrapDAO instance = new ScrapDAO();

	public static ScrapDAO getInstance() {
		return instance;
	}

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// 스크랩 추가 함수 
	public String insScrap(int publish_idx, int member_idx) {
	    String sql = "INSERT INTO tbl_scrap (publish_idx, member_idx) VALUES (?, ?)";
	    String result = "";

	    try {
	        conn = DBManager.getConnection(); // DB 연결
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, publish_idx); // 사용자 ID
	        pstmt.setInt(2, member_idx); // 게시물 ID

	        int rowsAffected = pstmt.executeUpdate(); // 쿼리 실행

	        if (rowsAffected > 0) {
	            result = "insert"; // 추가 성공
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
	    } finally {
	        // 리소스 정리
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    return result; // 결과 반환
	}
	
	// 스크랩 삭제 함수
	public String delScrap(int publish_idx, int member_idx) {
	    String sql = "DELETE FROM tbl_scrap WHERE publish_idx = ? AND member_idx = ?";
	    String result = "";

	    try {
	        conn = DBManager.getConnection(); // DB 연결
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, publish_idx); // 게시물 ID
	        pstmt.setInt(2, member_idx); // 사용자 ID

	        int rowsAffected = pstmt.executeUpdate(); // 쿼리 실행

	        if (rowsAffected > 0) {
	            result = "delete"; // 삭제 성공
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
	    } finally {
	        // 리소스 정리
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    return result; // 결과 반환
	}
	
	// 스크랩 상태 확인 메소드
	public boolean isScraped(long publish_idx, int member_idx) {
	    String sql = "SELECT COUNT(*) FROM tbl_scrap WHERE publish_idx = ? AND member_idx = ?";
	    boolean isScraped = false;

	    try {
	        conn = DBManager.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setLong(1, publish_idx);
	        pstmt.setInt(2, member_idx);
	        rs = pstmt.executeQuery();

	        if (rs.next() && rs.getInt(1) > 0) {
	            isScraped = true; // 스크랩 상태가 true
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        // 리소스 정리
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    return isScraped; // 스크랩 여부 반환
	}
	
	public List<PublishDTO> selScrapedPosts(int memberId) {

	    List<PublishDTO> scrapedPostList = new ArrayList<>();
	    String sql = "SELECT pb.*, jc.*, sc.scrap_idx "
	            + "FROM tbl_publish pb "
	            + "LEFT JOIN tbl_jobcategory jc ON pb.jobcategory_idx = jc.jobcategory_idx "
	            + "LEFT JOIN tbl_scrap sc ON pb.publish_idx = sc.publish_idx "
	            + "WHERE sc.member_idx = ? "
	            + "GROUP BY pb.publish_idx, jc.jobcategory_name, sc.scrap_idx "
	            + "order by sc.scrap_idx desc "; // 스크랩 등록일 기준 최신순 정렬

	    try (Connection conn = DBManager.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

	        pstmt.setInt(1, memberId); // 로그인한 사용자의 member_id 설정

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            PublishDTO publish = new PublishDTO();
	            publish.setPublish_idx(rs.getInt("publish_idx"));
	            publish.setJobcategory_idx(rs.getInt("jobcategory_idx"));
	            publish.setPublish_name(rs.getString("publish_name"));
	            publish.setContent(rs.getString("content"));
	            publish.setCareer(rs.getString("career"));
	            publish.setEducation(rs.getString("education"));
	            publish.setSalary(rs.getString("salary"));
	            publish.setLocation(rs.getString("location"));
	            publish.setLanguage_skill(rs.getString("language_skill"));
	            publish.setEmployment_type(rs.getString("employment_type"));
	            publish.setWorking_hours(rs.getString("working_hours"));
	            publish.setStart_date(rs.getString("start_date"));
	            publish.setEnd_date(rs.getString("end_date"));
	            publish.setUrl(rs.getString("url"));
	            publish.setRegdate(rs.getString("regdate"));
	            publish.setPublish_source(rs.getString("publish_source"));
	            publish.setJobcategory_name(rs.getString("jobcategory_name"));
	            
	            scrapedPostList.add(publish);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return scrapedPostList;
	}



}
