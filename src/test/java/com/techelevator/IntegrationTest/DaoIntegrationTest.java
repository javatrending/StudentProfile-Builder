package com.techelevator.IntegrationTest;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.bouncycastle.util.encoders.Base64;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SingleConnectionDataSource;

import com.techelevator.security.PasswordHasher;

public abstract class DaoIntegrationTest {
	private PasswordHasher passwordHasher;

	/*
	 * Using this particular implementation of DataSource so that every database
	 * interaction is part of the same database session and hence the same
	 * database transaction
	 */
	private static SingleConnectionDataSource dataSource;
	private JdbcTemplate template;

	/*
	 * Before any tests are run, this method initializes the datasource for
	 * testing.
	 */
	@BeforeClass
	public static void setupDataSource() {
		dataSource = new SingleConnectionDataSource();
		dataSource.setUrl("jdbc:postgresql://localhost:5432/capstone");
		dataSource.setUsername("capstone_appuser");
		dataSource.setPassword("capstone_appuser1");
		/*
		 * The following line disables autocommit for connections returned by
		 * this DataSource. This allows us to rollback any changes after each
		 * test
		 */
		dataSource.setAutoCommit(false);
	}

	/*
	 * After all tests have finished running, this method will close the
	 * DataSource
	 */
	@AfterClass
	public static void closeDataSource() throws SQLException {
		dataSource.destroy();
	}

	@Before
	public void setUp() {
		this.passwordHasher = new PasswordHasher();
		template = new JdbcTemplate(dataSource);
		clearDatabase();
	}

	/*
	 * After each test, we rollback any changes that were made to the database
	 * so that everything is clean for the next test
	 */
	@After
	public void rollback() throws SQLException {
		dataSource.getConnection().rollback();
	}

	/*
	 * This method provides access to the DataSource for subclasses so that they
	 * can instantiate a DAO for testing
	 */
	protected DataSource getDataSource() {
		return dataSource;
	}

	protected JdbcTemplate getTemplate() {
		return template;
	}

	protected void clearDatabase() {
		getTemplate().update("DELETE from app_user");
		getTemplate().update("DELETE from student_profile");
	}

	protected void addAppUsersToDatabase(String username, String password, String userType) {
		byte[] salt = passwordHasher.generateRandomSalt();
		String hashedPassword = passwordHasher.computeHash(password, salt);
		String saltString = new String(Base64.encode(salt));
		String sqlInsertUser = "INSERT INTO app_user(username, password, user_type, salt) VALUES(?,?,?,?)";
		template.update(sqlInsertUser, username, hashedPassword, userType, saltString);
	}

	protected void addStudentToDatabase(String username) {
		String sqlInsertStudent = "INSERT INTO student_profile(firstName,lastName,username,cohort,courseLanguage,streetAddress,city,state,postCode,email,phoneNumber,summary,careerExperience,interests,academicBackground,skills) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		template.update(sqlInsertStudent, "vineeta", "mandava", username, "javacohort", "java", "1901E 15th st",
				"cleveland", "OH", 44114, "vinee.mandava@gmail.com", "8778904433", "focused,hardworking",
				"developed a couple of projects in grad school", "java", "masters degree in CS", "java");
	}

	protected void addStudentsToDatabase(int numberOfStudents) {
		for (int i = 0; i < numberOfStudents; i++) {
			addAppUsersToDatabase("username" + i, "password" + i, "student");// to
																				// add
																				// values
																				// dynamically
			addStudentToDatabase("username" + i);

		}

	}

}
