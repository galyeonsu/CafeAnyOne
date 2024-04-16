package util;

import java.security.SecureRandom;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.log4j.Log4j;

@Log4j
public class TokenManager {
    private static final long EXPIRATION_TIME = 180; // 초
    private static final Map<String, TokenInfo> tokenStore = new HashMap<>();

    // 토큰 생성 및 저장
    public static String generateToken(String userId) {
        String token = generateRandomToken(); 
        long expirationTime = System.currentTimeMillis() + EXPIRATION_TIME * 1000;

        // 토큰과 만료 시간, 사용자 ID를 저장
        TokenInfo tokenInfo = new TokenInfo(token, expirationTime, userId);
        tokenStore.put(token, tokenInfo);

        return token;
    }

    // 토큰의 유효성 체크
    public static boolean isTokenValid(String token ) {
        TokenInfo tokenInfo = tokenStore.get(token);

        // 토큰이 존재하고 유효한지 체크
        return tokenInfo != null && tokenInfo.getExpirationTime() >= System.currentTimeMillis();
    }
    
    // 토큰 제거
    public static void deleteToken(String token) {
    	tokenStore.remove(token);
    }

    // 해당 토큰의 사용자 ID 가져옴
    public static String getTokenUserId(String token) {
        TokenInfo tokenInfo = tokenStore.get(token);

        // 토큰이 유효하다면 사용자 ID 반환
        if (tokenInfo != null && tokenInfo.getExpirationTime() >= System.currentTimeMillis()) {
            return tokenInfo.getUserId();
        }
        return null;
    }

    // 토큰 정보 클래스
    @Data
    @AllArgsConstructor
    private static class TokenInfo {
        private String token;
        private long expirationTime;
        private String userId;
    }

    public static void main(String[] args) {
        // 토큰 생성
        String token = TokenManager.generateToken("galgal5");
        log.info(token);

        // 토큰의 유효성 체크
        boolean isValid = TokenManager.isTokenValid("030307");
        log.info("Token is valid: " + isValid);

        // 토큰의 사용자 ID 가져오기
        String userId = TokenManager.getTokenUserId(token);
        log.info("User ID from token: " + userId);
    }
    
    private static String generateRandomToken() {
    	SecureRandom secureRandom = new SecureRandom();
        byte[] tokenBytes = new byte[64];
        secureRandom.nextBytes(tokenBytes);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(tokenBytes);
    }

}




