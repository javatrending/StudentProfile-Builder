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

import com.techelevator.User;
import com.techelevator.DAO.JdbcUserDao;

@Controller
@SessionAttributes("currentUser")
@Transactional
public class StaffController {
	private JdbcUserDao jdbcUserDao;

	@Autowired
	public StaffController(JdbcUserDao jdbcUserDao) {
		this.jdbcUserDao = jdbcUserDao;
	}
	
	
	@RequestMapping(path="/staff", method=RequestMethod.GET)
	public String showStaffPage(ModelMap model, @RequestParam String userName){
		
		User currentUser = (User)model.get("currentUser");
		String userCheck = currentUser.getUserName();
		
		if(userCheck != null && userCheck.equals(userName)) {
			return "staff";
		} else
		return "/";
		
	}
	
	
	@RequestMapping(path="/createUser",method=RequestMethod.GET)
	public String displayCreateUserForm(ModelMap model, @RequestParam String userName) {
		
		User currentUser = (User)model.get("currentUser");
		String userCheck = currentUser.getUserName();
		
		if(userCheck != null && userCheck.equals(userName)) {
			return "createUser";
		} else
		return "/createUser";
	}
	
	@RequestMapping(path="/createUser", method=RequestMethod.POST)
	public String createNewUser(ModelMap model, @RequestParam String userName, @RequestParam String password, @RequestParam String userType, HttpSession session) {
		
		
		User currentUser = (User)model.get("currentUser");
		String userCheck = currentUser.getUserName();
		
		if(userCheck != null) {
			jdbcUserDao.saveUser(userName, password, userType);
			session.setAttribute("msg",userName+" was created successfully");
			return "redirect:/createUser?userName="+userCheck;
		} else
		
		return "/homePage";
			
	}
	
	
	

}
