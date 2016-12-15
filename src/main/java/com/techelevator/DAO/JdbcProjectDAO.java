package com.techelevator.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.Project;

@Component
public class JdbcProjectDAO implements ProjectDAO {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcProjectDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	


	@Override
	public List<Project> getProjectsList(String username) {
		List<Project> projectList= new ArrayList<>();
		String sqlGetProjects = "SELECT *  FROM project JOIN student_profile ON student_profile.username = project.username "
								+ "WHERE student_profile.username =? ORDER BY project_id ASC";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetProjects, username);
		while(results.next()){
			Project project = new Project();
			project.setProject_id(results.getInt("project_id"));
			project.setUsername(results.getString("username"));
			project.setProjectName(results.getString("projectName"));
			project.setDescription(results.getString("description"));
			project.setProjectType(results.getString("projectType"));
			projectList.add(project);
		}
		return projectList;
	}
	
	@Override
	public Project getProjectDetail(int project_id) {
		Project project = new Project();
		String sqlGetProjectDetail = "SELECT * FROM project WHERE project_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetProjectDetail, project_id);
		while(results.next()){
			project.setProject_id(results.getInt("project_id"));
			project.setUsername(results.getString("username"));
			project.setProjectName(results.getString("projectName"));
			project.setDescription(results.getString("description"));
			project.setProjectType(results.getString("projectType"));
		}
		return project;
		
	}

	@Override
	public void updateProject(Project project, int project_id) {
		String sqlUpdateProject= "UPDATE project SET projectName =?, description =?, projectType=? WHERE project_id=?";	
		jdbcTemplate.update(sqlUpdateProject,project.getProjectName(),project.getDescription(),project.getProjectType(), project_id);
		
	}



	@Override
	public void addNewProject(Project project) {
		String sqlAddNewProject= "INSERT INTO project(username,projectName,description,projectType) VALUES(?,?,?,?)";
		jdbcTemplate.update(sqlAddNewProject,project.getUserName(),project.getProjectName(),project.getDescription(),project.getProjectType());
		
	}
	

}
