package com.techelevator.DAO;

import java.util.List;

import com.techelevator.Project;

public interface ProjectDAO {


	public List<Project> getProjectsList(String username);

	public void updateProject(Project project, int project_id);

	public Project getProjectDetail(int project_id);
	
	void addNewProject(Project project);
	
	

}
