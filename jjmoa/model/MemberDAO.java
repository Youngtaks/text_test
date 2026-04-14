package com.jjm.jjmoa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import com.jjm.jjmoa.util.DBManager;

public class MemberDAO {

    // 회원 가입
    public boolean register(MemberDTO member) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        boolean success = false;

        try {
            conn = DBManager.getConnection();
            String sql = "INSERT INTO tbl_member (member_idx, email, nickname, password) VALUES (member_seq.NEXTVAL, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getEmail());      
            pstmt.setString(2, member.getNickname());    
            pstmt.setString(3, member.getPassword()); 

            int result = pstmt.executeUpdate();
            success = result > 0; 
        } catch (Exception e) {
            e.printStackTrace(); 
        } finally {
        	 DBManager.close(conn, pstmt);
        }

        return success; 
    }

    // 회원 정보를 가져오기 (로그인 확인)
    public MemberDTO getMember(String email, String password) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberDTO member = null;

        try {
            conn = DBManager.getConnection(); 
            String sql = "SELECT member_idx, email, nickname, password, regdate FROM tbl_member WHERE email = ? AND password = ?"; 
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password); 
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int memberIdx = rs.getInt("member_idx");
                String nickname = rs.getString("nickname");
                String regdate = rs.getString("regdate");

                member = new MemberDTO(memberIdx, email, nickname, password, regdate);
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        } finally {
            DBManager.close(conn, pstmt, rs); 
        }

        return member; 
    }
    public boolean Nicknamecheck(String nickname) {
        String sql = "SELECT COUNT(*) FROM tbl_member WHERE nickname = ?";
        try (Connection conn = DBManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
             
            pstmt.setString(1, nickname);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false; 
    }
    public boolean Emailcheck(String email) {
        boolean isTaken = false;
        String sql = "SELECT COUNT(*) FROM tbl_member WHERE email = ?";
        
        try (Connection conn = DBManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, email);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    isTaken = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return isTaken;
    }
    public MemberDTO login(String email, String password) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberDTO member = null;

        try {
            conn = DBManager.getConnection(); 
            String sql = "SELECT member_idx, email, nickname, password, regdate FROM tbl_member WHERE email = ? AND password = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int memberIdx = rs.getInt("member_idx");
                String nickname = rs.getString("nickname");
                String regdate = rs.getString("regdate");
                member = new MemberDTO(memberIdx, email, nickname, password, regdate);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs); 
        }

        return member; 
    }
}
