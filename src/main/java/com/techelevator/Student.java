package com.techelevator;

public class Student {
	private int id;
	private String firstName;
	private String lastName;
	private String username;
	private String cohort;
	private String courseLanguage;
	private String streetAddress;
	private String city;
	private String state;
	private int postCode;
	private String emailAddress;
	private String phoneNumber;
	private String summary;
	private String careerExperience;
	private String interests;
	private String academicBackground;
	private String skills;
	

	public Student(String firstName, String lastName, String cohort, String courseLanguage) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.cohort = cohort;
		this.courseLanguage = courseLanguage;
	}
	
	public Student(){
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getCareerExperience() {
		return careerExperience;
	}

	public void setCareerExperience(String careerExperience) {
		this.careerExperience = careerExperience;
	}

	public String getInterests() {
		return interests;
	}

	public void setInterests(String interests) {
		this.interests = interests;
	}

	public String getAcademicBackground() {
		return academicBackground;
	}

	public void setAcademicBackground(String academicBackground) {
		this.academicBackground = academicBackground;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getCohort() {
		return cohort;
	}

	public String getCourseLanguage() {
		return courseLanguage;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public void setCohort(String cohort) {
		this.cohort = cohort;
	}
	public void setCourseLanguage(String courseLanguage) {
		this.courseLanguage = courseLanguage;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getPostCode() {
		return postCode;
	}
	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}
