package com.capriberry.persistance;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	@Test
	public void testConnection() {
		try(Connection con = DriverManager.getConnection(
				"jdbc:oracle:thin:@human.lepelaka.net:1521:xe", "BOOK_EX07", "BOOK_EX07")) {
			log.info(con);
		}
		catch (SQLException e) {
			fail(e.getMessage());
		}
	}
}
