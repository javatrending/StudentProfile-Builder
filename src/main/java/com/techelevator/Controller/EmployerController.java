package com.techelevator.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.Student;
import com.techelevator.DAO.StudentDAO;

@Controller
@SessionAttributes("currentUser")
public class EmployerController {
	private StudentDAO dao;
	
	@Autowired
	public EmployerController(StudentDAO dao){
		this.dao=dao;
	}
	
	@RequestMapping("/employer")
	public String showEmployerPage() {
		return "employer";
	}

	@RequestMapping(path = "/employer", method = RequestMethod.GET)
	public String showUpdatedEmployerPage(@RequestParam(required=false) String courseLanguage, @RequestParam(required=false) String degree,
			@RequestParam(required=false) String technologies, @RequestParam(required=false) String experience, ModelMap model) {
		
		if(model.get("currentUser") != null) {
			
			List<Student> studentList=dao.searchStudents(courseLanguage, technologies, degree, experience);
			model.addAttribute("studentList",studentList);
			model.addAttribute("courseLanguage", courseLanguage);
			model.addAttribute("degree", degree);
			model.addAttribute("technologies", technologies);
			model.addAttribute("experience", experience);
			return "employer";
		}else 
			return "redirect:/login";

	}

}
