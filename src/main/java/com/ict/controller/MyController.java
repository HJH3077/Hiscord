package com.ict.controller;

import java.util.List;

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
import com.ict.service.Paging;
import com.ict.service.Paging2;
import com.ict.vo.MVO;
import com.ict.vo.MailVO;
import com.ict.vo.VO;
 
@Controller
public class MyController {
	@Autowired
	private MyService myService;
	@Inject
    EmailService emailService;
	@Autowired
	private Paging paging;
	@Autowired
	private Paging2 paging2;
	
	@RequestMapping("main.do")
	public ModelAndView login_mainCommand() {
		return new ModelAndView("main");
	}
	
	@RequestMapping("login.do")
	public ModelAndView loginCommand() {
		return new ModelAndView("login");
	}
	
	@RequestMapping("login_ok.do")
	public ModelAndView loginOkCommand(MVO m_vo, HttpSession session,
			@RequestParam("cPage")String cPage){
		try {
			MVO mvo = myService.selectLogin(m_vo);
			if(mvo == null) {
				session.setAttribute("login","0");
				return new ModelAndView("login_err");
			} else {
				session.setAttribute("login_id", mvo.getId());
				session.setAttribute("login", "1");
				
				// 관리자인 경우
				if(mvo.getId().equals("admin")&&mvo.getPw().equals("admin")) {
					session.setAttribute("admin", "ok");
					return new ModelAndView("redirect:user_mng.do?cPage=" + cPage);
				}
				// 관리자가 아닌 경우
				return new ModelAndView("redirect:main.do");
			}
		} catch (Exception e) {
		}
		return null;
	}
	
	@RequestMapping("logout.do")
	public ModelAndView logoutCommand(HttpSession session) {
		session.invalidate(); // 세션을 완전히 삭제
		return new ModelAndView("redirect:main.do");
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
			return new ModelAndView("redirect:main.do");
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
			return new ModelAndView("redirect:main.do");
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
			String id = (String)session.getAttribute("login_id");
			mailvo.setReceiveMail("wnsgur0657@naver.com");
			mailvo.setSenderName(id);
			mailvo.setSenderMail("wnsgur0657@gmail.com");
			mailvo.setSubject(id + "님의 건의사항입니다.");
			mailvo.setMessage(content);
			emailService.sendMail(mailvo);
			return new ModelAndView("redirect:main.do");
		} catch (Exception e) {
			return new ModelAndView("redirect:main.do");
		}
	}
	
	@RequestMapping("setting.do")
	public ModelAndView settingCommand() {
		return new ModelAndView("setting");
	}
	
	@RequestMapping("mypage.do")
	public ModelAndView mypageCommand(HttpSession session) {
		try {
			ModelAndView mv = new ModelAndView("mypage");
			String id = (String)session.getAttribute("login_id");
			MVO mvo = myService.selectUser(id);
			String nickname = mvo.getNickname();
			String email = mvo.getEmail();
			mv.addObject("nickname", nickname);
			mv.addObject("email", email);
			return mv;
		} catch (Exception e) {
		}
		return null;
	}
	
	@RequestMapping("adjust.do")
	public ModelAndView adjustCommand(HttpSession session, @RequestParam("next_nickname")String nickname,
			@RequestParam("next_email")String email) {
		try {
			String id = (String)session.getAttribute("login_id");
			MVO mvo = new MVO();
			mvo.setId(id);
			mvo.setNickname(nickname);
			mvo.setEmail(email);
			myService.updateUser(mvo);
			return new ModelAndView("redirect:mypage.do");
		} catch (Exception e) {
		}
		return null;
	}
	
	@RequestMapping("friend.do")
	public ModelAndView friendCommand() {
		return new ModelAndView("friend");
	}
	
	@RequestMapping("chatroom2.do")
	public ModelAndView chatCommand() {
		return new ModelAndView("chatroom2");
	}
	
	// 관리자 페이지
	@RequestMapping("user_mng.do")
	public ModelAndView listCommand(@ModelAttribute("cPage")String cPage) {
		try {
			ModelAndView mv = new ModelAndView("user_mng");
			// 전체 게시물의 수
			int count = myService.selectCount();
			paging.setTotalRecord(count);

			// 전체 페이지의 수
			if (paging.getTotalRecord() <= paging.getNumPerPage()) {
				paging.setTotalPage(1);
			} else {
				// 전체 페이지의 수 계산하기
				paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
				// 나머지가 존재하면 전체 페이지 수에 +1
				if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
					paging.setTotalPage(paging.getTotalPage() + 1);
				}
			}
			// 현재 페이지 구하기
			paging.setNowPage(Integer.parseInt(cPage));
			
			// 시작번호, 끝번호
			paging.setBegin((paging.getNowPage() - 1) * paging.getNumPerPage() + 1);
			paging.setEnd((paging.getBegin() - 1) + paging.getNumPerPage());

			// 시작블록, 끝블록
			paging.setBeginBlock(
					(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
			paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

			// 주의사항 : endBlock 이 totalPage 보다 클 경우 이 경우 endBlock를 totalPage에 맞춰줌.
			if (paging.getEndBlock() > paging.getTotalPage()) {
				paging.setEndBlock(paging.getTotalPage());
			}
			List<VO> list = myService.selectUserList(paging.getBegin(), paging.getEnd());
			
			mv.addObject("list", list);
			mv.addObject("pvo", paging);
			return mv;
			
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("login_err");
		}
	}
	
	@RequestMapping("user_onelist.do")
	public ModelAndView onelistCommand(@RequestParam("id")String id, @ModelAttribute("cPage")String cPage) {
		try {
			ModelAndView mv = new ModelAndView("user_onelist");
			MVO mvo = myService.selectUser(id);
			mv.addObject("mvo", mvo);
			return mv;
		} catch (Exception e) {
		}
		return null;
	}
	
	@RequestMapping("user_update.do")
	public ModelAndView user_updateCommand(@RequestParam("nickname")String nickname,
			@RequestParam("email")String email, @ModelAttribute("id")String id, @ModelAttribute("cPage")String cPage) {
		try {
			MVO mvo = new MVO();
			mvo.setId(id);
			mvo.setNickname(nickname);
			mvo.setEmail(email);
			myService.updateUser(mvo);
			return new ModelAndView("redirect:user_onelist.do");
		} catch (Exception e) {
		}
		return null;
	}
	
	@RequestMapping(value = "chkbox_user_delete.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String chk_user_delCommand(@RequestParam("id[]")String[] id) {
		try {
			int result = 0;
			for(int i=0; i<id.length; i++) {
				result = myService.deleteUser(id[i]);
			}
			return String.valueOf(result);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	
	@RequestMapping("prohibited_word.do")
	public ModelAndView prohibitCommand(@ModelAttribute("pPage")String pPage) {
		try {
			ModelAndView mv = new ModelAndView("prohibited_word");
			// 전체 게시물의 수
			int word_count = myService.selectWordCount();
			paging2.setTotalRecord(word_count);
			// 전체 페이지의 수
			if (paging2.getTotalRecord() <= (paging2.getNumPerPage() * 4)) {
				paging2.setTotalPage(1);
			} else {
				// 전체 페이지의 수 계산하기
				paging2.setTotalPage(paging2.getTotalRecord() / (paging2.getNumPerPage() * 4));
				// 나머지가 존재하면 전체 페이지 수에 +1
				if (paging2.getTotalRecord() % (paging2.getNumPerPage() * 4) != 0) {
					paging2.setTotalPage(paging2.getTotalPage() + 1);
				}
			}
			// 현재 페이지 구하기
			paging2.setNowPage(Integer.parseInt(pPage));
			
			// 시작번호, 끝번호
			paging2.setBegin((paging2.getNowPage() - 1) * (paging2.getNumPerPage() * 4) + 1);
			paging2.setEnd((paging2.getBegin() - 1) + (paging2.getNumPerPage() * 4));

			// 시작블록, 끝블록
			paging2.setBeginBlock(
					(int) ((paging2.getNowPage() - 1) / paging2.getPagePerBlock()) * paging2.getPagePerBlock() + 1);
			paging2.setEndBlock(paging2.getBeginBlock() + paging2.getPagePerBlock() - 1);

			// 주의사항 : endBlock 이 totalPage 보다 클 경우 이 경우 endBlock를 totalPage에 맞춰줌.
			if (paging2.getEndBlock() > paging2.getTotalPage()) {
				paging2.setEndBlock(paging2.getTotalPage());
			}
			List<VO> list2 = myService.selectBanList(paging2.getBegin(), paging2.getEnd());
			mv.addObject("list2", list2);
			mv.addObject("pvo2", paging2);
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("login_err");
		}
	}
	
	@RequestMapping(value = "chkbox_word_delete.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String chk_word_delCommand(@RequestParam("word[]")String[] word) {
		try {
			int result = 0;
			for(int i=0; i<word.length; i++) {
				result = myService.deleteWord(word[i]);
			}
			return String.valueOf(result);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
}
