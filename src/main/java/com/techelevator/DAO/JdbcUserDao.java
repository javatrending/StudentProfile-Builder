package com.techelevator.DAO;

import javax.sql.DataSource;

import org.bouncycastle.util.encoders.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.security.PasswordHasher;

@Component
public class JdbcUserDao implements UserDAO {
	
	private JdbcTemplate jdbcTemplate;
	private PasswordHasher passwordHasher;

	@Autowired
	public JdbcUserDao(DataSource dataSource, PasswordHasher passwordHasher) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.passwordHasher = passwordHasher;
	}

	@Override
	public void saveUser(String userName, String password, String userType) {
		byte[] salt = passwordHasher.generateRandomSalt();
		String hashedPassword = passwordHasher.computeHash(password, salt);
		String saltString = new String(Base64.encode(salt));
		jdbcTemplate.update("INSERT INTO app_user(username, password, user_type, salt) VALUES (?, ?, ?, ?)", userName, hashedPassword, userType, saltString);
		if(userType.equals("student")) {
			jdbcTemplate.update("INSERT INTO student_profile(username) VALUES (?)", userName);			
		}else if(userType.equals("employer")) {
			jdbcTemplate.update("INSERT INTO employer(username) VALUES (?)", userName);
		}else 
			jdbcTemplate.update("INSERT INTO staff(username) VALUES (?)", userName);
		}
	
	@Override
	public String login(String username, String password) {
		String sqlLogin = "SELECT * "+
						"FROM app_user "+
						"WHERE username = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlLogin, username);
		String userType=null;
		if(results.next()) {
			String storedSalt = results.getString("salt");
			String storedPassword = results.getString("password");
			String hashedPassword = passwordHasher.computeHash(password, Base64.decode(storedSalt));
			
				if (storedPassword.equals(hashedPassword)) {
					userType=results.getString("user_type");

					return userType;
				} else {
					return "password not matched";
			}	
		} else {
			return "user not found";
		}
				
	}
	
	
	
	@Override
	public boolean searchForUsernameAndPassword(String userName, String password) {
		String sqlSearchForUser = "SELECT * "+
							      "FROM app_user "+
							      "WHERE username = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, password);
		if(results.next()) {
			String storedSalt = results.getString("salt");
			String storedPassword = results.getString("password");
			String hashedPassword = passwordHasher.computeHash(password, Base64.decode(storedSalt));
			return storedPassword.equals(hashedPassword);
		} else {
			return false;
		}
	}
	
//	@Override
//	public String searchForUserType(String userName, String password) {
//		String sqlSearchForUser = "SELECT * "+
//			      "FROM app_user "+
//			      "WHERE username =? "+
//			      "AND password =?";
//		SqlRowSet results=jdbcTemplate.queryForRowSet(sqlSearchForUser,userName,password);
//		String  userType=null;
//		
//		if(results.next()){
//			userType=results.getString("user_type");
//		}
//
//		return userType;
//	}
	
	

}
