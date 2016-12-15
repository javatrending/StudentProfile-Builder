package com.techelevator.DAO;

import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.Student;


@Component
public class JdbcStudentDao implements StudentDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcStudentDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	@Override
	public void editStudentProfile(Student student, String userName) {
		String sqlUpdateStudentProfile = "UPDATE student_profile SET firstName=?, lastName=?, courseLanguage=?, streetAddress=?, city=?, state=?, "+
										"postCode=?, email=?, phoneNumber=?, summary=?, careerExperience=?, interests=?, academicBackground=?, skills=? "
										+ "WHERE username=?";
		jdbcTemplate.update(sqlUpdateStudentProfile, student.getFirstName(), student.getLastName(), student.getCourseLanguage(), student.getStreetAddress(), 
							student.getCity(), student.getState(), student.getPostCode(), student.getEmailAddress(), student.getPhoneNumber(), 
							student.getSummary(), student.getCareerExperience(), student.getInterests(), student.getAcademicBackground(), 
							student.getSkills(), userName);
	}
	
	@Override
	public Student getAllStudentDetails(String userName) {
		Student student = new Student();
		String sqlSelectAllStudents = "SELECT * from student_profile where username=?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllStudents, userName);
		student = getStudentInfo(student, results);
		return student;
		
	}
	
	
	public Student getStudentInfo(Student student, SqlRowSet results) {
		while (results.next()) {
			student.setId(results.getInt("student_id"));
			student.setFirstName(results.getString("firstName"));
			student.setLastName(results.getString("lastName"));
			student.setUsername(results.getString("username"));
			student.setCohort(results.getString("cohort"));
			student.setCourseLanguage(results.getString("courseLanguage"));
			student.setAcademicBackground(results.getString("academicBackground"));
			student.setCareerExperience(results.getString("careerExperience"));
			student.setEmailAddress(results.getString("email"));
			student.setInterests(results.getString("interests"));
			student.setPhoneNumber(results.getString("phoneNumber"));
			student.setSkills(results.getString("skills"));
			student.setStreetAddress(results.getString("streetAddress"));
			student.setCity(results.getString("city"));
			student.setState(results.getString("state"));
			student.setPostCode(results.getInt("postCode"));
			student.setSummary(results.getString("summary"));

		}
		return student;
		
	}

	@Override
	public List<Student> getAllStudents() {
		List<Student> studentList = new ArrayList<>();
		String sqlGetAllStudents = "SELECT * from student_profile";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllStudents);
		// student = getStudentInfo(student, results);
		while (results.next()) {
			// student = getStudentInfo(student, results);
			Student student = new Student();
			student.setId(results.getInt("student_id"));
			student.setFirstName(results.getString("firstName"));
			student.setLastName(results.getString("lastName"));
			student.setUsername(results.getString("username"));
			student.setUsername(results.getString("username"));
			student.setUsername(results.getString("username"));
			student.setCohort(results.getString("cohort"));
			student.setCourseLanguage(results.getString("courseLanguage"));
			student.setAcademicBackground(results.getString("academicBackground"));
			student.setCareerExperience(results.getString("careerExperience"));
			student.setEmailAddress(results.getString("email"));
			student.setInterests(results.getString("interests"));
			student.setPhoneNumber(results.getString("phoneNumber"));
			student.setSkills(results.getString("skills"));
			student.setStreetAddress(results.getString("streetAddress"));
			student.setSummary(results.getString("summary"));
			studentList.add(student);

		}
		return studentList;
	}

	//Employer
	@Override
	public List<Student> searchStudents(String courseLanguage, String technologies, String degree, String experience) {
		List<Student> studentList = new ArrayList<>();
		List<Object> objArray = new ArrayList<>(); //to add input values(like cohort,degree etc) dynamically
		StringBuilder query = new StringBuilder();//better performance with strings
		int i = 0; //i represents whether query is appended with input value(like cohort,degree etc)
		query.append("select * from student_profile ");//this part of query remains the same
		if (courseLanguage != null && courseLanguage != "") { //checking the value of cohort whether it is not null and empty,then add to query
			query.append("where lower(courseLanguage) LIKE lower(?)");//appending cohort value to query and changing it to lowercase
			objArray.add("%"+courseLanguage+"%"); //adding cohort value to object array
			i++;
		}
		if (technologies != null && technologies != "") {//checking the value of technologies whether it is not null and empty
			if (i > 0) //means that courseLanguage is already appended to query
				query.append("and lower(skills) LIKE lower(?)");
			
			else
				query.append("where lower(skills) LIKE lower(?) ");
			objArray.add("%"+technologies+"%");
			i++;
		}
		if (degree != null && degree != "") {
			if (i > 0)
				query.append("and academicbackground =?");
			else
				query.append(" where academicbackground=?");
			objArray.add(degree);
			i++;
		}
		if (experience != null && experience != "") {
			if (i > 0)
				query.append("and lower(careerexperience) LIKE lower(?)");
			else
				query.append(" where lower(careerexperience) LIKE lower(?)");
			objArray.add("%"+experience+"%");
			i++;
		}
		if(i>0)
		query.append(" order by firstname");
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(query.toString(), objArray.toArray());// passing sql query and object array as parameters 
		while(results.next()){
			Student student = new Student();
			student.setUsername(results.getString("username"));
			student.setId(results.getInt("student_id"));
			student.setFirstName(results.getString("firstName"));
			student.setLastName(results.getString("lastName"));
			student.setCourseLanguage(results.getString("courseLanguage"));
			studentList.add(student);
		}
		return studentList;
	}

	

}
