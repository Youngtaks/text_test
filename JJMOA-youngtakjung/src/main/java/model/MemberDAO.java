package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.jjm.jjmoa.util.DBManager;
import com.jjm.jjmoa.util.HashUtil;
import com.jjm.jjmoa.model.MemberDTO;

public class MemberDAO {

    // 회원 가입
    public boolean register(MemberDTO member) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        boolean success = false;

        try {
            conn = DBManager.getConnection();
            String sql = "INSERT INTO tbl_member (email, nickname, password) VALUES ( ?, ?, ?)"; 
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
            String sql = "SELECT member_idx, email, nickname, password, regdate FROM tbl_member WHERE email = ? AND password = ?"; // 테이블의 컬럼 이름 확인
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
            String sql = "SELECT member_idx, email, nickname, password, regdate FROM tbl_member WHERE email = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String hashedPassword = rs.getString("password");
                if (HashUtil.checkPassword(password, hashedPassword)) {
                    int memberIdx = rs.getInt("member_idx");
                    String nickname = rs.getString("nickname");
                    String regdate = rs.getString("regdate");
                    member = new MemberDTO(memberIdx, email, nickname, hashedPassword, regdate);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs); 
        }

        return member; 
    }
    public MemberDTO getlogin(String email, String password) {
        MemberDTO member = null;
        String sql = "SELECT * FROM tbl_member WHERE email = ? AND password = ?";

        try (Connection conn = DBManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                member = new MemberDTO();
                member.setMember_idx(rs.getInt("member_idx"));
                member.setEmail(rs.getString("email"));
                member.setNickname(rs.getString("nickname"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return member;
    }
    // 이메일로 회원 정보 가져오기
    public MemberDTO getMemberByEmail(String email) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberDTO member = null;

        try {
            conn = DBManager.getConnection();
            String sql = "SELECT member_idx, email, nickname, password, regdate FROM tbl_member WHERE email = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int memberIdx = rs.getInt("member_idx");
                String nickname = rs.getString("nickname");
                String Pass = rs.getString("password");
                String regdate = rs.getString("regdate");

                member = new MemberDTO(memberIdx, email, nickname, Pass, regdate);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }

        return member;
    }
    // 이메일로 닉네임 찾기
    public boolean checkEmail(String email) {
        boolean exists = false;
        String sql = "SELECT COUNT(*) FROM tbl_member WHERE email = ?"; 

        try (Connection conn =DBManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                exists = rs.getInt(1) > 0; 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return exists;
    }
 // 이메일과 닉네임으로 사용자 확인
    public boolean checkUser(String email, String nickname) {
        boolean exists = false;  
        String sql = "SELECT COUNT(*) FROM tbl_member WHERE email = ? AND nickname = ?";

        try (Connection conn = DBManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, email);
            pstmt.setString(2, nickname);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                exists = rs.getInt(1) > 0; 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return exists; 
    }

    // 비밀번호 업데이트
    public boolean updatePassword(String newPassword,String email) {
        String hashedPassword = HashUtil.hashPassword(newPassword);
        String sql = "UPDATE tbl_member SET password = ? WHERE email = ?";
        try (Connection conn = DBManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, hashedPassword);
            pstmt.setString(2, email);
            int rows = pstmt.executeUpdate();
            return rows > 0; 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
    
