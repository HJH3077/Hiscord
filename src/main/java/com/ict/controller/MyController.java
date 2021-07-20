package com.ict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.service.MyService;

@Controller
public class MyController {
	@Autowired
	private MyService myService;
	
	@RequestMapping("logout_main.do")
	public ModelAndView mainCommand() {
		return new ModelAndView("logout_main");
	}
	
	@RequestMapping("login.do")
	public ModelAndView loginCommand() {
		return new ModelAndView("login");
	}
	
	@RequestMapping("id_find.do")
	public ModelAndView id_findCommand() {
		return new ModelAndView("id_find");
	}
	
	@RequestMapping("pw_find.do")
	public ModelAndView pw_findCommand() {
		return new ModelAndView("pw_find");
	}
	
	@RequestMapping("join.do")
	public ModelAndView joinCommand() {
		return new ModelAndView("join");
	}
}
