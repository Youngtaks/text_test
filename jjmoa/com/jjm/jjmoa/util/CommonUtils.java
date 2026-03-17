package com.jjm.jjmoa.util;

public class CommonUtils {
    // 플랫폼 이름을 변환하는 유틸리티 메서드
    public static String convertPlatformName(String platform) {
        if (platform.equals("worldjob")) {
            return "월드잡";
        } else if (platform.equals("saramin")) {
            return "사람인";
        }
        // 기본적으로 원래 이름 반환
        return platform;
    }

}
