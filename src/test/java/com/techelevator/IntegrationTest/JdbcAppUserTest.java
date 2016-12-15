package com.techelevator.IntegrationTest;

import javax.sql.DataSource;

import org.junit.Assert;
import org.junit.Test;

import com.techelevator.DAO.JdbcUserDao;
import com.techelevator.DAO.UserDAO;
import com.techelevator.security.PasswordHasher;

import org.junit.Before;

public class JdbcAppUserTest extends DaoIntegrationTest {
	UserDAO dao;

	@Before
	public void setupDao() {
		DataSource dataSource = getDataSource();
		dao = new JdbcUserDao(dataSource, new PasswordHasher());
	}

	@Test
	public void testToCheckIfUserIsSavedOrNot() {
		dao.saveUser("vineeta", "password", "student");
		String userType = dao.login("vineeta", "password");
		Assert.assertEquals("student", userType);

	}

	@Test
	public void testToCheckIfLoginWorksOrNot() {
		dao.saveUser("junglebook", "software", "student");
		String userType = dao.login("junglebook", "password1");
		Assert.assertEquals("password not matched", userType);
	}

	@Test
	public void testToCheckUserNotFoundFunctionality() {
		dao.saveUser("narnia", "software", "student");
		String userType = dao.login("vineeta", "mandava");
		Assert.assertEquals("user not found", userType);
	}
}
