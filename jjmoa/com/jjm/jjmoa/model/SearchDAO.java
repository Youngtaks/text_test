package com.jjm.jjmoa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jjm.jjmoa.util.DBManager;
import com.jjm.jjmoa.model.JobCategoryDTO;

public class SearchDAO {
	public SearchDAO() {
	}

	private static SearchDAO instance = new SearchDAO();

	public static SearchDAO getInstance() {
		return instance;
	}

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 직종 데이터 가져오기
	public List<JobCategoryDTO> selJobCategory() {
		List<JobCategoryDTO> jobCategoryList = new ArrayList<>();
		String sql = "SELECT * FROM tbl_jobcategory";

		try {
			conn = DBManager.getConnection(); // DB 연결
			pstmt = conn.prepareStatement(sql); // SQL 준비
			rs = pstmt.executeQuery(); // 쿼리 실행

			// 결과 처리
			while (rs.next()) {
				JobCategoryDTO jobCategory = new JobCategoryDTO();
				jobCategory.setJobcategory_idx(rs.getString("jobcategory_idx"));
				jobCategory.setJobcategory_name(rs.getString("jobcategory_name"));
				jobCategory.setJobcategory_code(rs.getString("jobcategory_code"));

				jobCategoryList.add(jobCategory); // 리스트에 추가
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs); // 리소스 정리
		}

		return jobCategoryList; // 직종 리스트 반환
	}

	// 플랫폼(사이트) 데이터 가져오기
	public List<String> selPublishSource() {
		List<String> publishSourceList = new ArrayList<>();
		String sql = "SELECT DISTINCT(publish_source) FROM tbl_publish";

		try {
			conn = DBManager.getConnection(); // DB 연결
			pstmt = conn.prepareStatement(sql); // SQL 준비
			rs = pstmt.executeQuery(); // 쿼리 실행

			// 결과 처리
			while (rs.next()) {
				String publishSource = rs.getString("publish_source");
				publishSourceList.add(publishSource); // 리스트에 추가
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs); // 리소스 정리
		}

		return publishSourceList; // 플랫폼 리스트 반환
	}

	// 검색 결과 데이터 가져오기
	// 검색필터(제목, 내용) 정렬순, 직종별, 플랫폼별, 인피니트 스크롤 고려
	public List<PublishDTO> selSearchResult(String searchKeyword, String sortType, String jobcategoryIdx,
	        String platform, int limit, int offset, int memberId) {

	    List<PublishDTO> searchResultList = new ArrayList<>();
	    String sql = "SELECT pb.*, jc.jobcategory_name, COUNT(sc.publish_idx) AS scrap_count, "
	            + "       IF(us.publish_idx IS NOT NULL, true, false) AS isScrap "
	            + "FROM tbl_publish pb "
	            + "LEFT JOIN tbl_jobcategory jc ON pb.jobcategory_idx = jc.jobcategory_idx "
	            + "LEFT JOIN tbl_scrap sc ON pb.publish_idx = sc.publish_idx "
	            + "LEFT JOIN (SELECT publish_idx FROM tbl_scrap WHERE member_idx = ?) us ON pb.publish_idx = us.publish_idx "
	            + "WHERE (pb.publish_name LIKE CONCAT('%', ?, '%') OR pb.content LIKE CONCAT('%', ?, '%')) "
	            + "AND pb.jobcategory_idx = IFNULL(?, pb.jobcategory_idx) "
	            + "AND pb.publish_source = IFNULL(?, pb.publish_source) "
	            + "GROUP BY pb.publish_idx, jc.jobcategory_name "
	            + "ORDER BY "
	            + "  CASE WHEN ? = 'latest' THEN pb.start_date END DESC, " // 최신순
	            + "  CASE WHEN ? = 'popular' THEN scrap_count END DESC, " // 인기순
	            + "  CASE WHEN ? = 'end_date' THEN pb.end_date END ASC " // 마감 순 (가까운 날짜 순)
	            + "LIMIT ? OFFSET ?";

	    try (Connection conn = DBManager.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

	        int paramIndex = 1;
	        if (memberId != 0) {
	            pstmt.setInt(paramIndex++, memberId); // 로그인한 사용자의 member_id
	        } else {
	            pstmt.setNull(paramIndex++, java.sql.Types.INTEGER); // 로그인하지 않은 경우
	        }
	        
	        pstmt.setString(paramIndex++, searchKeyword); // 제목/내용 검색어
	        pstmt.setString(paramIndex++, searchKeyword); // 제목/내용 검색어
	        pstmt.setString(paramIndex++, jobcategoryIdx); // 직종 (String 타입)
	        pstmt.setString(paramIndex++, platform); // 플랫폼 (String 타입)
	        pstmt.setString(paramIndex++, sortType); // 정렬 기준 ('latest', 'popular', 'end_date')
	        pstmt.setString(paramIndex++, sortType); // 정렬 기준 ('latest', 'popular', 'end_date')
	        pstmt.setString(paramIndex++, sortType); // 정렬 기준 ('latest', 'popular', 'end_date')
	        pstmt.setInt(paramIndex++, limit); // 한 번에 가져올 데이터 개수 (인피니트 스크롤용)
	        pstmt.setInt(paramIndex, offset); // 페이지 번호를 기반으로 계산한 OFFSET

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
	            publish.setScrap_count(rs.getInt("scrap_count"));
	            publish.setJobcategory_name(rs.getString("jobcategory_name"));
	            publish.setIsScrap(rs.getBoolean("isScrap"));

	            searchResultList.add(publish);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return searchResultList;
	}
	
	// 검색 결과 총개수 가져오기
	public int selSearchResultCount(String searchKeyword, String jobcategoryIdx, String platform) {
	    int totalCount = 0;
	    String sql = "SELECT COUNT(*) AS total_count "
	            + "FROM tbl_publish pb "
	            + "LEFT JOIN tbl_jobcategory jc ON pb.jobcategory_idx = jc.jobcategory_idx "
	            + "LEFT JOIN tbl_scrap sc ON pb.publish_idx = sc.publish_idx "
	            + "WHERE (pb.publish_name LIKE CONCAT('%', ?, '%') OR pb.content LIKE CONCAT('%', ?, '%')) "
	            + "AND pb.jobcategory_idx = IFNULL(?, pb.jobcategory_idx) "
	            + "AND pb.publish_source = IFNULL(?, pb.publish_source)";

	    try (Connection conn = DBManager.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        
	        // 파라미터 설정
	        pstmt.setString(1, searchKeyword); // 제목/내용 검색어
	        pstmt.setString(2, searchKeyword); // 제목/내용 검색어
	        pstmt.setString(3, jobcategoryIdx); // 직종 (String 타입)
	        pstmt.setString(4, platform); // 플랫폼 (String 타입)

	        ResultSet rs = pstmt.executeQuery();

	        // 결과 처리
	        if (rs.next()) {
	            totalCount = rs.getInt("total_count"); // 총개수 저장
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return totalCount;
	}
	

}
