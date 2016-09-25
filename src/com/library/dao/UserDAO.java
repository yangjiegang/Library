package com.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.bean.User;

@Repository
public class UserDAO {
	@Autowired
	JdbcTemplate jdbcTemplate;

	public Boolean login(String userName, String password){
		String sql = "select password from userinfo where username=? and password=?";
		Boolean isExist = false;
		List<?> pwdList = jdbcTemplate.queryForList(sql, new Object[]{userName, password});
		if (pwdList.size()>=1) {
			isExist=true;
		}
		return isExist;
	}
	
	public Boolean register(final User newUser){
		final String sql = "INSERT INTO userinfo(userName, password, gender, level) VALUES(?,?,?,?) ";
		Boolean isSuccess = false;
		Integer i = jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				// TODO 自动生成的方法存根
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, newUser.getUserName());//index starts with 1
				pstmt.setString(2, newUser.getPassword());
				pstmt.setBoolean(3, newUser.getGender());				
				pstmt.setInt(4, 2);
				return pstmt;
			}
		});
		if (i==1) {
			isSuccess=true;
		}
		return isSuccess;
	}
}
