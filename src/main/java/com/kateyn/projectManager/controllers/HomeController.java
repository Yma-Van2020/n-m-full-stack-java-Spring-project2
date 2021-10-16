package com.kateyn.projectManager.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.CollectionUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kateyn.projectManager.models.LoginUser;
import com.kateyn.projectManager.models.Project;
import com.kateyn.projectManager.models.User;
import com.kateyn.projectManager.services.ProjectService;
import com.kateyn.projectManager.services.UserService;


@Controller
public class HomeController {
	@Autowired
	private UserService userServ;
	
	@Autowired
	private ProjectService projServ;
	
    @GetMapping("/")
    public String index(Model model, HttpSession session) {
    	Long id = (Long) session.getAttribute("user_id");
    	if (id != null) {
    		return "redirect:/dashboard";
    	}
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
    	Long id = (Long) session.getAttribute("user_id");
    	if (id == null) {
    		return "redirect:/";
    	}
    	User user = userServ.getUserById(id);
    	List<Project> projectsUserLeads = user.getProjects();
    	List<Project> unjoinedProjects = projServ.getProjectsUserNotOnTeam(user);
    	CollectionUtils.filter(unjoinedProjects, p -> ((Project) p).getLead().getId() != id);
    	List<Project> projectsUserIsOnTeam = user.getOnProjects();
    	projectsUserIsOnTeam.addAll(projectsUserLeads);
    	
    	model.addAttribute("yourProjects",projectsUserIsOnTeam);
    	model.addAttribute("allProjects", unjoinedProjects);
    	model.addAttribute("user",user);
    	
    	
    	return "dashboard.jsp";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	
    	return "redirect:/";
    }
    
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        userServ.register(newUser, result);
        if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        session.setAttribute("user_id", newUser.getId());
        return "redirect:/dashboard";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        User user = userServ.login(newLogin, result);
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        session.setAttribute("user_id", user.getId());
        return "redirect:/dashboard";
    }
    
    @PostMapping("/users/{id}/join")
    public String join(@PathVariable("id") Long uid, @RequestParam("projId") Long projId) {

    	projServ.addToTeam(projId, uid);
    	
    	return "redirect:/dashboard";
    }
    
    @PostMapping("/users/{id}/leave")
    public String leave(@PathVariable("id") Long uid, @RequestParam("projId") Long projId) {
    	
    	projServ.removeFromTeam(projId, uid);
    	
    	return "redirect:/dashboard";
    }
}


