package com.jjm.jjmoa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.jjm.jjmoa.util.DBManager;
import com.jjm.jjmoa.util.HashUtil;

public class MyPageDAO {
    public MyPageDAO() {}
    private static MyPageDAO instance = new MyPageDAO();

    public static MyPageDAO getInstance() {
        return instance;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    // 닉네임 중복 검사
    public boolean isNicknameDuplicate(String nickname) {
        boolean isDuplicate = false;
        String sql = "SELECT COUNT(*) FROM tbl_member WHERE nickname = ?";

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, nickname);
            System.out.println("DB에서 닉네임 중복 조회: " + nickname); // 로그로 확인
            rs = pstmt.executeQuery();

            if (rs.next()) {
                if (rs.getInt(1) > 0) {
                    isDuplicate = true; // 중복 닉네임일 때 true
                    System.out.println("중복된 닉네임 발견");
                } else {
                    System.out.println("중복되지 않은 닉네임");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }
        return isDuplicate;
    }


    // 닉네임 및 비밀번호 업데이트 메서드 (비밀번호 해싱 적용)
    public void updateMemberInfo(String email, String nickname, String password) {
        String sql = "UPDATE tbl_member SET nickname = ?, password = ? WHERE email = ?";
        try (Connection conn = DBManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            String hashedPassword = HashUtil.hashPassword(password); // 비밀번호 해싱

            pstmt.setString(1, nickname);  // 닉네임 설정
            pstmt.setString(2, hashedPassword);  // 해싱된 비밀번호 설정
            pstmt.setString(3, email);  // 이메일로 해당 회원 찾기
            
            int rowsUpdated = pstmt.executeUpdate(); // 실행 후 업데이트된 행 수 반환
            if (rowsUpdated > 0) {
                System.out.println("닉네임과 비밀번호가 성공적으로 업데이트되었습니다.");
            } else {
                System.out.println("업데이트 실패: 회원을 찾을 수 없습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}