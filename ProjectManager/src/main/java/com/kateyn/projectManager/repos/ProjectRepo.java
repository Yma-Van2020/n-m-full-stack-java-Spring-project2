package com.kateyn.projectManager.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kateyn.projectManager.models.Project;
import com.kateyn.projectManager.models.User;

@Repository
public interface ProjectRepo extends CrudRepository<Project, Long>{
	List<Project> findAll();
	List<Project> findAllByProjectTeam(User user);
	List<Project> findAllByProjectTeamNotContains(User user);

}