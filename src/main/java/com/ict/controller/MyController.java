package com.ict.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.email.EmailService;
import com.ict.service.MyService;
import com.ict.vo.MVO;
import com.ict.vo.MailVO;

@Controller
public class MyController {
	@Autowired
	private MyService myService;
	@Inject
    EmailService emailService;
	
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
			// 이미 로그인 한 경우
			if(session.getAttribute("login") == "ok") {
				return new ModelAndView("redirect:login_main.do");
			}
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
	
	@RequestMapping("id_find_ok.do")
	public ModelAndView id_findokCommand(@RequestParam("name")String name, @RequestParam("email")String email,
			@ModelAttribute MailVO mailvo) {
		try {
			String id = myService.selectIdfind(email, name);
			mailvo.setReceiveMail(email);
			mailvo.setSenderName("Hiscord 관리자");
			mailvo.setSenderMail("wnsgur0657@gmail.com");
			mailvo.setSubject("Hiscord 아이디 찾기 답변입니다.");
			mailvo.setMessage(name + "고객님의 id는 [" + id + "] 입니다.");
			emailService.sendMail(mailvo);
			return new ModelAndView("redirect:login.do");
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("redirect:logout_main.do");
		}
	}
	
	@RequestMapping("pw_find.do")
	public ModelAndView pw_findCommand() {
		return new ModelAndView("pw_find");
	}
	
	@RequestMapping("pw_find_ok.do")
	public ModelAndView pw_findokCommand(@RequestParam("name")String name, @RequestParam("email")String email,
			@RequestParam("id")String id, @ModelAttribute MailVO mailvo) {
		try {
			String pw = myService.selectPwfind(id, name, email);
			mailvo.setReceiveMail(email);
			mailvo.setSenderName("Hiscord 관리자");
			mailvo.setSenderMail("wnsgur0657@gmail.com");
			mailvo.setSubject("Hiscord 비밀번호 찾기 답변입니다.");
			mailvo.setMessage(name + "고객님의 pw는 [" + pw + "] 입니다.");
			emailService.sendMail(mailvo);
			return new ModelAndView("redirect:login.do");
		} catch (Exception e) {
			return new ModelAndView("redirect:logout_main.do");
		}
	}
	
	@RequestMapping("join.do")
	public ModelAndView joinCommand() {
		return new ModelAndView("join");
	}
	
	@RequestMapping(value = "idchk.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String idchkCommand(@RequestParam("id") String id){
		try {
			MVO mvo = myService.selectIdchk(id);
			if(mvo==null) {
				return "0";
			}else {
				return "1";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
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
	
	@RequestMapping("suggestion.do")
	public ModelAndView suggestionCommand() {
		return new ModelAndView("suggestion");
	}
	
	@RequestMapping("suggestion_ok.do")
	public ModelAndView suggestion_okCommand(@ModelAttribute MailVO mailvo, @RequestParam("content")String content,
			HttpSession session) {
		try {
			MVO mvo = (MVO)session.getAttribute("mvo");
			mailvo.setReceiveMail("wnsgur0657@naver.com");
			mailvo.setSenderName(mvo.getId());
			mailvo.setSenderMail("wnsgur0657@gmail.com");
			mailvo.setSubject(mvo.getId() + "님의 건의사항입니다.");
			mailvo.setMessage(content);
			emailService.sendMail(mailvo);
			return new ModelAndView("redirect:login_ok.do");
		} catch (Exception e) {
			return new ModelAndView("redirect:logout_main.do");
		}
	}
	
	@RequestMapping("setting.do")
	public ModelAndView settingCommand() {
		return new ModelAndView("setting");
	}
	
	@RequestMapping("mypage.do")
	public ModelAndView mypageCommand() {
		return new ModelAndView("mypage");
	}
	
	@RequestMapping("friend.do")
	public ModelAndView friendCommand() {
		return new ModelAndView("friend");
	}
	
	@RequestMapping("chatroom2.do")
	public ModelAndView chatCommand() {
		return new ModelAndView("chatroom2");
	}
}
