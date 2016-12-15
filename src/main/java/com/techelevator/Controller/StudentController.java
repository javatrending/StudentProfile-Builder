package com.techelevator.Controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.techelevator.Project;
import com.techelevator.Student;
import com.techelevator.User;
import com.techelevator.DAO.JdbcProjectDAO;
import com.techelevator.DAO.JdbcStudentDao;

@Controller
@Transactional
@SessionAttributes("currentUser")
public class StudentController {

	private JdbcStudentDao jdbcStudentDao;
	private JdbcProjectDAO jdbcProjectDAO;
	

	@Autowired
	public StudentController(JdbcStudentDao jdbcStudentDao, JdbcProjectDAO jdbcProjectDao) {
		this.jdbcStudentDao = jdbcStudentDao;
		this.jdbcProjectDAO  = jdbcProjectDao;
		
		
	}

	@RequestMapping("/studentProfile")
	public String showStudentProfilePage(ModelMap model, @RequestParam String userName) {
		Student student = jdbcStudentDao.getAllStudentDetails(userName);
		List<Project> projectList= jdbcProjectDAO.getProjectsList(userName);
		model.addAttribute("projectList",projectList);
		model.addAttribute("student", student);
		return "studentProfile";
		
	}

	@RequestMapping("/authStudentProfile")
	public String showAuthStudentProfilePage(ModelMap model, @RequestParam String userName) {
		
		User currentUser = (User)model.get("currentUser");
		String userCheck = currentUser.getUserName();
		
		if(userCheck != null) {
		Student student = jdbcStudentDao.getAllStudentDetails(userName);
		model.addAttribute("student", student);
		return "authStudentProfile";
	}
		return "/login";
	}
	
	@RequestMapping("/studentList")
	public String showListOfStudents(ModelMap model) {
		List<Student> studentList = jdbcStudentDao.getAllStudents();
		model.addAttribute("studentList", studentList);
		return "studentList";		
	}
	
	@RequestMapping("/authStudentList")
	public String showAuthStudentList(ModelMap model) {
		
		User currentUser = (User)model.get("currentUser");
		String userCheck = currentUser.getUserName();
		
		if(userCheck != null) {
			List<Student> studentList = jdbcStudentDao.getAllStudents();
			model.addAttribute("studentList", studentList);
			return"authStudentList";	
		}
		return "/login";
	}
	
	@RequestMapping("/studentPortfolio") 
	public String showStudentPortfolioPage(ModelMap model, @RequestParam String userName) {
		
		User currentUser = (User)model.get("currentUser");
		String userCheck = currentUser.getUserName();
		if(userCheck != null ) {
			List<Project> projectList = jdbcProjectDAO.getProjectsList(userName);
			Student student = jdbcStudentDao.getAllStudentDetails(userName);
			model.addAttribute("projectList", projectList);
			model.addAttribute("student", student);
			model.addAttribute("userName",userName);
			return "studentPortfolio";	
		}
		return "/";
	}
	
	@RequestMapping("/editStudentPortfolio")
	public String showPortfolioEditForm(@RequestParam int project_id, ModelMap model) {
		
		User currentUser = (User)model.get("currentUser");
		String userCheck = currentUser.getUserName();
		if(userCheck != null) {
		Project project= jdbcProjectDAO.getProjectDetail(project_id);
		model.addAttribute("project", project);
		return "editStudentPortfolio";
	}
		return "/";
	}
	
	@RequestMapping(path = "/editStudentPortfolio", method=RequestMethod.POST) 
	public String showEditedPortfolioPage(@RequestParam int project_id, @RequestParam String userName, ModelMap model, HttpSession session,
										@RequestParam String projectType, @RequestParam String projectName, 
										@RequestParam String description) {
		
		User currentUser = (User)model.get("currentUser");
		String userCheck = currentUser.getUserName();
		if(userCheck != null && userCheck.equals(userName)) {
		Project project= new Project();
		project.setProjectName(projectName);
		project.setDescription(description);
		project.setProjectType(projectType);
		jdbcProjectDAO.updateProject(project, project_id);
		model.addAttribute("project", project);
		return "redirect:/studentPortfolio?userName="+userName;
	}
		return "/";
	}
	
	@RequestMapping(path="/addProject",method=RequestMethod.GET) 
	public String showAddProjectPage(@RequestParam String userName,ModelMap model){
		model.addAttribute("userName",userName);
		return "addProject";
		}
	
	@RequestMapping(path="/addProject",method=RequestMethod.POST)
	public String postNewlyAddedProject(@RequestParam String userName,@RequestParam String projectName,
										@RequestParam String projectType,@RequestParam String description,ModelMap model){
		Project project= new Project();
		project.setDescription(description);
		project.setProjectName(projectName);
		project.setProjectType(projectType);
		project.setUsername(userName);
		
		jdbcProjectDAO.addNewProject(project);
		model.addAttribute("userName",userName);
		return"redirect:/studentPortfolio";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
