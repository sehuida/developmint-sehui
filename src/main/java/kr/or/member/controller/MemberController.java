package kr.or.member.controller;

import java.util.ArrayList; 

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/loginFrm.do")
	public String login() {
		return "member/login";
	}
	@RequestMapping(value="/login.do")
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
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "common/main";
	}
	@RequestMapping(value="/joinFrm.do")
	public String joinFrm() {
		return "member/join";
	}
	@ResponseBody
	@RequestMapping(value="/phoneCheck.do")
	public String idCheck(String phone) {
		Member m = service.checkPhone(phone);
		if(m == null) {
			//ajax로 페이지 이동이 없어야 하므로 ResponseBody 어노테이션을 붙여줘야 데이터 자체로 보내줌
			return "1";
		}else {
			return "0";
		}
	}
	@ResponseBody
	@RequestMapping(value="/memberIdCheck.do")
	public String memberIdCheck(String memberId) {
		Member m = service.checkId(memberId);
		if(m == null) {
			return "1";
		}else {
			return "0";
		}
	}
}
