package com.capriberry.security;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberTests {
	@Autowired @Qualifier("BCryptPasswordEncoder")
	private PasswordEncoder encoder;
	@Autowired
	private DataSource dataSource;
	
	@Test
	public void testExist() {
		log.info(encoder);
		log.info(dataSource);
	}
	@Test
	public void testInsertMember() {
		String sql = "INSERT INTO TBL_MEMBER(USERID, USERPW, USERNAME) VALUES (?, ?, ?)";
		for(int i = 0 ; i < 100 ; i++) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = dataSource.getConnection();
				pstmt  = conn.prepareStatement(sql);
				
				pstmt.setString(2, encoder.encode("pw"+i));
				
				if(i < 80) {
					pstmt.setString(1, "user"+i);
					pstmt.setString(3, "일반사용자"+i);
				}
				else if(i < 90) {
					pstmt.setString(1, "manager"+i);
					pstmt.setString(3, "운영자"+i);
				}
				else {
					pstmt.setString(1, "admin"+i);
					pstmt.setString(3, "관리자"+i);
				}
				
				pstmt.executeUpdate();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	@Test
	public void testInsertAuth() {
		String sql = "INSERT INTO TBL_MEMBER_AUTH(USERID, AUTH) VALUES (?, ?)";
		for(int i = 0 ; i < 100 ; i++) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = dataSource.getConnection();
				pstmt  = conn.prepareStatement(sql);
				
				if(i < 80) {
					pstmt.setString(1, "user"+i);
					pstmt.setString(2, "ROLE_USER");
				}
				else if(i < 90) {
					pstmt.setString(1, "manager"+i);
					pstmt.setString(2, "ROLE_MEMBER");
				}
				else {
					pstmt.setString(1, "admin"+i);
					pstmt.setString(2, "ROLE_ADMIN");
				}
				
				pstmt.executeUpdate();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}