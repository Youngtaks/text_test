package com.jjm.jjmoa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.jjm.jjmoa.util.DBManager;

public class PublishDAO {
    public PublishDAO() {}
    private static PublishDAO instance = new PublishDAO();

    public static PublishDAO getInstance() {
        return instance;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    //  최근 공고 조회
    public List<PublishDTO> selPublishByRecent() {
        List<PublishDTO> list = new ArrayList<>();

        String sql = "SELECT * from tbl_publish pb"
        		+ " LEFT JOIN tbl_jobcategory jc"
        		+ " ON pb.jobcategory_idx = jc.jobcategory_idx"
        		+ " ORDER BY start_date DESC"
        		+ " limit 9";
    

        try {
            conn = DBManager.getConnection();  
            pstmt = conn.prepareStatement(sql); 
            rs = pstmt.executeQuery(); 
            
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
                  
                  publish.setJobcategory_name(rs.getString("jobcategory_name"));
      
                list.add(publish);  
            }
        } catch (Exception e) {
            e.printStackTrace();  
        } finally {
            DBManager.close(conn, pstmt, rs); 
        }
        return list;
    }
    
    // 요즘 뜨는 공고 조회 
    public List<PublishDTO> selPublishByScrap() {
        List<PublishDTO> list = new ArrayList<>();

        String sql = "SELECT pb.*, jc.jobcategory_name, count(sc.publish_idx) as scrap_count"
                   + " FROM tbl_publish pb"
                   + " LEFT JOIN tbl_jobcategory jc"
                   + " ON pb.jobcategory_idx = jc.jobcategory_idx"
                   + " LEFT JOIN tbl_scrap sc"
                   + " ON pb.publish_idx = sc.publish_idx"
                   + " GROUP BY pb.publish_idx, jc.jobcategory_name"
                   // + " HAVING count(sc.publish_idx) > 0"
                   + " ORDER BY scrap_count DESC"
                   + " LIMIT 9";

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

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

                // 직종명 추가
                publish.setJobcategory_name(rs.getString("jobcategory_name"));

                // 스크랩 수 추가
                publish.setScrap_count(rs.getInt("scrap_count"));

                list.add(publish);  
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return list;
    }
    
    // 곧 마감 되는 공고
    public List<PublishDTO> selPublishByDday() {
        List<PublishDTO> list = new ArrayList<>();

        String sql = "SELECT pb.*, jc.*"
                   + " FROM tbl_publish pb"
                   + " LEFT JOIN tbl_jobcategory jc"
                   + " ON pb.jobcategory_idx = jc.jobcategory_idx"
                   + " WHERE DATEDIFF(pb.end_date, CURDATE()) <= 7"
                   + " AND DATEDIFF(pb.end_date, CURDATE()) >= 0"
                   + " ORDER BY pb.end_date ASC"
                   + " LIMIT 9";

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

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

                // 직종명 추가
                publish.setJobcategory_name(rs.getString("jobcategory_name"));

                list.add(publish);  
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return list;
    }
    
    // 한개의 공고 불러오기
    public PublishDTO getPublish(int publish_idx) {
    	PublishDTO publish = new PublishDTO();
    	
    	String sql = "SELECT \n"
    			+ "    p.*, \n"
    			+ "    jc.jobcategory_name,\n"
    			+ "    CASE \n"
    			+ "        WHEN s.publish_idx IS NOT NULL THEN true \n"
    			+ "        ELSE false \n"
    			+ "    END AS isScrap\n"
    			+ "FROM \n"
    			+ "    tbl_publish p\n"
    			+ "JOIN \n"
    			+ "    tbl_jobcategory jc ON p.jobcategory_idx = jc.jobcategory_idx\n"
    			+ "LEFT JOIN \n"
    			+ "    tbl_scrap s ON p.publish_idx = s.publish_idx\n"
    			+ "WHERE \n"
    			+ "    p.publish_idx = ?";
    	try {
    		conn = DBManager.getConnection();
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setInt(1, publish_idx);
    		rs = pstmt.executeQuery();
    		
    		if (rs.next()) {
    			publish.setPublish_idx(publish_idx);
    			publish.setJobcategory_idx(Integer.parseInt(rs.getString("jobcategory_idx")));
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
	            publish.setIsScrap(rs.getBoolean("isScrap"));
//	            System.out.print("publish.isScrap : " + publish.getIsScrap()+"\n");
    			
    			// 직종명 추가
    			publish.setJobcategory_name(rs.getString("jobcategory_name"));
    		}
    	} catch (Exception e) {
    		e.printStackTrace();
    	} finally {
    		DBManager.close(conn, pstmt, rs);
    	}
    	return publish;
    }
    
    

    
    
}
