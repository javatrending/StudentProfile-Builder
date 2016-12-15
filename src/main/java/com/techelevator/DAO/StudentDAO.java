package com.techelevator.DAO;

import java.util.List;

import com.techelevator.Student;

public interface StudentDAO {


	public Student getAllStudentDetails(String userName);
	public void editStudentProfile(Student student, String userName);

	public List<Student> getAllStudents();

	public List<Student> searchStudents(String cohort,String technologies,String degree,String experience);

}
