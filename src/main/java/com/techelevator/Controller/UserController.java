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

import com.techelevator.DAO.JdbcUserDao;

@Controller
@Transactional
@SessionAttributes("currentUser")
public class UserController {
	
	private JdbcUserDao jdbcUserDao;

	@Autowired
	public UserController(JdbcUserDao jdbcUserDao) {
		this.jdbcUserDao = jdbcUserDao;
	}
	
	//change password
	
	

}

