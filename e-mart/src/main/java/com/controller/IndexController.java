package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.daoimpl.CategoryDaoImpl;
import com.daoimpl.UserDaoImpl;
import com.model.User;

@Controller
public class IndexController {

	@Autowired
	UserDaoImpl userDaoImpl;
	
	@Autowired
	CategoryDaoImpl categoryDaoImpl;
	
	@RequestMapping(value = "/")
	public String index() {
	      return "index";
	   }
	@RequestMapping(value = "/index", method= {RequestMethod.POST,RequestMethod.GET})
	public String home() {
	      return "index";
	   }
	
	@RequestMapping(value="/goToRegister", method=RequestMethod.GET)
	public ModelAndView goToRegister(){
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("user", new User());
		modelAndView.setViewName("register");
		
		return modelAndView;
		
	}
	
	@RequestMapping(value="/saveRegister", method=RequestMethod.POST)
	public ModelAndView saveRegister(@ModelAttribute("user")User user, BindingResult result){
		
		ModelAndView modelAndView = new ModelAndView();
		if(result.hasErrors()){
			
			modelAndView.setViewName("register");
		}
		else {
			
			user.setRole("ROLE_USER"); 
			userDaoImpl.insertUser(user);
			modelAndView.setViewName("index");
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/getLogin", method= RequestMethod.GET)
	public ModelAndView getLogin() {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login");
		return modelAndView;
	}
	
	@RequestMapping(value="/userLogged", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView userLogged() {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/index");
		return modelAndView;
	}
	
	@RequestMapping(value="/error", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView error() {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("error");
		return modelAndView;
	}
	
	@RequestMapping(value="/login", method= RequestMethod.GET)
	public ModelAndView doLogin() {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login");
		return modelAndView;
	}
	@ModelAttribute
	public void loadingCategory(Model model){
		model.addAttribute("catList", categoryDaoImpl.retrieve());
	}
}
