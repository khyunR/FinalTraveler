package com.example.demo;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.junit.jupiter.api.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

class DummyData {

    // JDBC 관련 기본 객체 변수들 선언
    Connection conn = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;   // executeQuery(), SELECT 결과
    int cnt = 0;           // executeUpdate(), DML 결과  
   
    // MySQL
    public static final String DRIVER = "com.mysql.cj.jdbc.Driver";  // JDBC 드라이버 클래스
    public static final String URL = "jdbc:mysql://localhost:3306/finaltraveler";  // DB 서버 정보
    public static final String USERID = "myuser111";   // DB 사용자 계정 정보
    public static final String USERPW = "1234";

    public static final String SQL_MEMBER_INSERT =
            "INSERT INTO test_member2" +
                    "(mb_id, mb_pw, mb_email) " +
                    "VALUES(?, ?, ?)";

    public static final String SQL_AUTH_INSERT =
            "INSERT INTO t_authority" +
                    "(mb_uid, auth) " +
                    "VALUES(?, ?)";

    public static final String [] USERNAMES = {"user01", "member02", "admin03"};
    public static final String [] PASSWORDS = {"pw01", "pw02", "pw03"};
    public static final String [] EMAILS = {"user01@mail.com", "member02@mail.com", "admin03@mail.com"};
   
    @Test
    void genData() {
       
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
       
        try {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(URL, USERID, USERPW);
           
            // 테스트용 dummy 데이터 만들기
//            pstmt = conn.prepareStatement(SQL_MEMBER_INSERT);
//           
//            for(int i = 0; i < USERNAMES.length; i++) {            
//                pstmt.setString(1, USERNAMES[i]);
//                pstmt.setString(2, encoder.encode(PASSWORDS[i]));
//                pstmt.setString(3, EMAILS[i]);
//                cnt += pstmt.executeUpdate();
//            }
//           
//            System.out.println(cnt + "개 의 회원 데이터가 INSERT 되었습니다");
//           
//            pstmt.close();
           
            // 권한
            pstmt = conn.prepareStatement(SQL_AUTH_INSERT);
            pstmt.setString(1, "2");
            pstmt.setString(2, "ROLE_ADMIN");
            pstmt.executeUpdate();

//            pstmt.setString(1, USERNAMES[2]);
//            pstmt.setString(2, "ROLE_MEMBER");
//            pstmt.executeUpdate();
//
//            pstmt.setString(2, "ROLE_ADMIN");
//            pstmt.executeUpdate();
           
           
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch(Exception e) {
                e.printStackTrace();
            }
        }
    }
}
