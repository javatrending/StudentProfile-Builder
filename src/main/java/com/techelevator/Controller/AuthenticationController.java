package com.techelevator.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.Student;
import com.techelevator.User;
import com.techelevator.DAO.JdbcStudentDao;
import com.techelevator.DAO.JdbcUserDao;

@Controller
@SessionAttributes("currentUser")
@Transactional
public class AuthenticationController {

	private JdbcStudentDao jdbcStudentDao;
	private JdbcUserDao jdbcUserDao;

	@Autowired
	public AuthenticationController(JdbcStudentDao studentDao, JdbcUserDao jdbcUserDao) {
		this.jdbcStudentDao = studentDao;
		this.jdbcUserDao = jdbcUserDao;
	}

	@RequestMapping("/login")
	public String showLoginPage() {
		return "login";
	}

	@RequestMapping(path = "/login", method = RequestMethod.POST)
	public String login(@RequestParam String userName, @RequestParam String password, ModelMap model,
			HttpSession session) {

		String userType = jdbcUserDao.login(userName, password);
		User currentUser = new User(userName, password, userType);
		session.invalidate();
		if (userType.equals("student")) {
			model.put("currentUser", currentUser);
			return "redirect:/studentMyProfile?userName=" + userName;// Passing
																		// userName
																		// as
																		// request
																		// Parameter
		} else if (userType.equals("staff")) {
			model.put("currentUser", currentUser);
			return "redirect:/staff?userName=" + userName;
		} else if (userType.equals("employer")) {
			model.put("currentUser", currentUser);
			return "redirect:/employer?userName=" + userName;
		} else {

		}
		return "redirect:/";
	}

	@RequestMapping(path = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap model, HttpSession session) {
		model.remove("currentUser");
		session.removeAttribute("currentUser");
		return "redirect:/";
	}

	// MyProfile
	@RequestMapping("/studentMyProfile")
	public String showStudentMyProfile(@RequestParam String userName, ModelMap model, HttpSession session) {

		Student myProfile = jdbcStudentDao.getAllStudentDetails(userName);
		User currentUser = (User)model.get("currentUser");
		String userCheck = currentUser.getUserName();
//		String userCheck=(String)model.get("currentUser");
		if (userCheck != null && userCheck.equals(userName)) {
			model.addAttribute("myProfile", myProfile);
			return "studentMyProfile";
		} else {

			return "/";
		}
	}

	@RequestMapping(path = "/editStudentProfile", method = RequestMethod.GET) 
	public String editStudentProfilePage(@RequestParam String userName, ModelMap model) {
		
		User currentUser = (User)model.get("currentUser");
		String userCheck = currentUser.getUserName();
		if (userCheck != null && userCheck.equals(userName)) {
			Student editedProfile = jdbcStudentDao.getAllStudentDetails(userName);
			model.addAttribute("editedProfile", editedProfile);
			model.addAttribute("userName", userName);
			return "editStudentProfile";
		} else
			return "redirect:/";
	}

	@RequestMapping(path = "/editStudentProfile", method = RequestMethod.POST)
	
	public String showeditedProfilePage(@RequestParam String userName, ModelMap model, HttpSession session,
			@RequestParam String summary, @RequestParam String firstName, @RequestParam String lastName,
			@RequestParam String staddress, @RequestParam String city, @RequestParam String state,
			@RequestParam int postcode, @RequestParam String phno, @RequestParam String email,
			@RequestParam String lang, @RequestParam String degree, @RequestParam String exp,
			@RequestParam String skills, @RequestParam String interests) { //storing data into student object which comes from jsp page 
		
		User currentUser = (User)model.get("currentUser");
		String userCheck = currentUser.getUserName();
		if (userCheck != null && userCheck.equals(userName)){
		session.getAttribute(userName);
		Student student= new Student();
		student.setAcademicBackground(degree);
		student.setCareerExperience(exp);
		student.setCity(city);
		student.setCourseLanguage(lang);
		student.setEmailAddress(email);
		student.setFirstName(firstName);
		student.setLastName(lastName);
		student.setInterests(interests);
		student.setPostCode(postcode);
		student.setSkills(skills);
		student.setState(state);
		student.setStreetAddress(staddress);
		student.setUsername(userName);
		student.setPhoneNumber(phno);
		student.setSummary(summary);
		jdbcStudentDao.editStudentProfile(student, userName);
		model.addAttribute("userName",userName);
		model.addAttribute("currentUser", currentUser);
		return "redirect:/studentMyProfile";

	} else
	
		 return"redirect:/";
	}
}
