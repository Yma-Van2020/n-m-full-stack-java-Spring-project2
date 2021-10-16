package com.kateyn.projectManager.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.kateyn.projectManager.models.Project;
import com.kateyn.projectManager.models.User;
import com.kateyn.projectManager.services.ProjectService;
import com.kateyn.projectManager.services.UserService;

@Controller
public class ProjectController {
	@Autowired
	private ProjectService projServ;
	
	@Autowired
	private UserService userServ;
	

	@GetMapping("/projects/new")
	public String newProject(@ModelAttribute("project") Project project, HttpSession session, Model model) {
    	Long id = (Long) session.getAttribute("user_id");
    	if (id == null) {
    		return "redirect:/";
    	}
    	User lead = userServ.getUserById(id);
    	model.addAttribute("lead", lead);
    	
    	return "new_project.jsp";
	}
	
	@GetMapping("/projects/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model, HttpSession session) {
    	Long uuid = (Long) session.getAttribute("user_id");
    	if (uuid == null) {
    		return "redirect:/";
    	}
		Project proj = projServ.getProjectById(id);
		if (proj.getLead().getId().equals(uuid)) {
			model.addAttribute("project", proj);
			
			return "edit_project.jsp";			
		}return "redirect:/dashboard";
	}
	
	@GetMapping("/projects/{id}")
	private String showProject(@PathVariable("id") Long id, HttpSession session, Model model) {
    	Long uuid = (Long) session.getAttribute("user_id");
    	if (uuid == null) {
    		return "redirect:/";
    	}
    	model.addAttribute("uuid",uuid);
    	model.addAttribute("project", projServ.getProjectById(id));
    	
    	return "show_project.jsp";
	}
	
	@PostMapping("/projects/create")
	private String createProject(@Valid @ModelAttribute("project") Project project, BindingResult result, HttpSession session) {
    	Long uuid = (Long) session.getAttribute("user_id");
    	if (uuid == null) {
    		return "redirect:/";
    	}
    	if (result.hasErrors()) {
    		
        	
    		return "new_project.jsp";
    	} else {
    		projServ.saveProject(project);
    		
    		return "redirect:/dashboard";
    	}
    	
	}
	
	@PutMapping("/projects/{id}/edit")
	private String createProject(@PathVariable("id") Long id, @Valid @ModelAttribute("project") Project project, BindingResult result, HttpSession session, Model model) {
    	Long uuid = (Long) session.getAttribute("user_id");
    	if (uuid == null) {
    		return "redirect:/";
    	}
    	if (result.hasErrors()) {
        	
    		return "edit_project.jsp";
    	} else {
    		projServ.saveProject(project);
    		
    		return "redirect:/dashboard";
    	}
    	
	}
	
	
	
	@DeleteMapping("/projects/{id}")
	private String showProject(@PathVariable("id") Long id, HttpSession session) {
		Long uuid = (Long) session.getAttribute("user_id");
		Project project = projServ.getProjectById(id);
		if (project.getLead().getId().equals(uuid)) {
			projServ.delete(id);			
		}
		
		return "redirect:/dashboard";
	}
	


}