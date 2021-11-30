package kr.or.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	
	@RequestMapping(value="/login.do")
	public String login() {
		return "member/login";
	}
	@RequestMapping(value="/loginFrm.do")
	public String loginFrm(Member member,HttpSession session,Model model) {
		Member m = service.selectOneMember(member);
		if(m != null) {
			session.setAttribute("m", m);
			model.addAttribute("msg","로그인성공");
		}else {
			model.addAttribute("msg","아이디 또는 비밀번호를 확인하세요");	
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
}
