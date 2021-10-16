package com.kateyn.projectManager.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kateyn.projectManager.models.Project;
import com.kateyn.projectManager.models.User;
import com.kateyn.projectManager.repos.ProjectRepo;

@Service
public class ProjectService {
	@Autowired
	private ProjectRepo projRepo;
	
	@Autowired
	private UserService userServ;
	
	public Project getProjectById(Long id) {
		Optional<Project> optB = projRepo.findById(id);
		if (optB.isPresent()) {
			return optB.get();
		} else return null;
	}
	
	public Project saveProject(Project b) {
		return projRepo.save(b);
	}
	
	public List<Project> getAllProjects(){
		return projRepo.findAll();
	}
	
	public List<Project> getProjectsUserIsOnTeam(User user){
		return projRepo.findAllByProjectTeam(user);
	}
	
	public List<Project> getProjectsUserNotOnTeam(User user){
		return projRepo.findAllByProjectTeamNotContains(user);
	}
	
	public void delete(Long id) {
		projRepo.deleteById(id);
	}
	
	public Project addToTeam(Long projectId, Long userId) {
		Project project = getProjectById(projectId);
		User user = userServ.getUserById(userId);
		
		project.getProjectTeam().add(user);
		return saveProject(project);
		
	}
	
	public Project removeFromTeam(Long projectId, Long userId) {
		Project project = getProjectById(projectId);
		User user = userServ.getUserById(userId);
		
		project.getProjectTeam().remove(user);
		return saveProject(project);
		
	}
	

}