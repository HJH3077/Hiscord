package com.ict.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.service.MyService;
import com.ict.vo.MVO;

@Controller
public class MyController {
	@Autowired
	private MyService myService;
	
	@RequestMapping("logout_main.do")
	public ModelAndView logout_mainCommand() {
		return new ModelAndView("logout_main");
	}
	
	@RequestMapping("login_main.do")
	public ModelAndView login_mainCommand() {
		return new ModelAndView("login_main");
	}
	
	@RequestMapping("login.do")
	public ModelAndView loginCommand() {
		return new ModelAndView("login");
	}
	
	@RequestMapping("login_ok.do")
	public ModelAndView loginOkCommand(MVO m_vo, HttpSession session) {
		try {
			MVO mvo = myService.selectLogin(m_vo);
			if(mvo == null) {
				return new ModelAndView("login_err");
			} else {
				session.setAttribute("mvo", mvo);
				session.setAttribute("login", "ok"); 
				// 관리자인 경우
				if(mvo.getId().equals("admin")&&mvo.getPw().equals("admin")) {
					session.setAttribute("admin", "ok");
					return new ModelAndView("user_mng");
				}
				// 관리자가 아닌 경우
				return new ModelAndView("redirect:login_main.do");
			}
		} catch (Exception e) {
		}
		return null;
	}
	
	@RequestMapping("logout.do")
	public ModelAndView logoutCommand(HttpSession session) {
		session.invalidate(); // 세션을 완전히 삭제
		return new ModelAndView("redirect:logout_main.do");
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
	
	@RequestMapping("join_ok.do")
	public ModelAndView joinOkCommand(MVO m_vo, HttpServletRequest request) {
		try {
			m_vo.setEmail(request.getParameter("email") + "@" + request.getParameter("email_domain"));
			int result = myService.insertJoin(m_vo);
			if(result > 0) {
				return new ModelAndView("redirect:login.do");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
}
