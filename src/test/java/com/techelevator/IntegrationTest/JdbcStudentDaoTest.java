package com.techelevator.IntegrationTest;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.techelevator.Student;
import com.techelevator.DAO.JdbcStudentDao;
import com.techelevator.DAO.StudentDAO;

public class JdbcStudentDaoTest extends DaoIntegrationTest {
	StudentDAO dao;

	@Before
	public void setupDao() {
		DataSource dataSource = getDataSource();
		dao = new JdbcStudentDao(dataSource);
	}

	@Test
	public void testToGetAllStudents() {
		addStudentsToDatabase(5);
		List<Student> studentList = dao.getAllStudents();
		Assert.assertEquals(5, studentList.size());
	}

	@Test
	public void testToGetAllStudentDetailsByUserName() {
		addAppUsersToDatabase("vineeta", "password", "student");
		addStudentToDatabase("vineeta");
		Student student = dao.getAllStudentDetails("vineeta");
		Assert.assertEquals("vineeta", student.getFirstName());
	}

	@Test
	public void testToGetAllStudentDetailsById() {
		addAppUsersToDatabase("vineeta", "password", "student");
		addStudentToDatabase("vineeta");
		Student student = dao.getAllStudentDetails("vineeta");
		String username=student.getUsername();
		student = dao.getAllStudentDetails(username);
		Assert.assertEquals("mandava", student.getLastName());
	}
	

}
