package kr.or.member.controller;

import java.util.ArrayList; 

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.member.model.service.MailSender;
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
	@RequestMapping(value="/join.do")
	public String join(Member member,HttpSession session) {
		int result = service.insertMember(member);
		if(result>0) {
			Member m = service.selectOneMember(member);
			session.setAttribute("m", m);
		}
		return "common/main";
	}
	
	@RequestMapping(value="/login.do")
	public String loginFrm(Member member,HttpSession session,Model model) {
		Member m = service.selectOneMember(member);
		if(m != null) {
			session.setAttribute("m", m);
			return "common/main";
		}else {
			model.addAttribute("msg","아이디/비밀번호를 다시 확인해주세요");
			model.addAttribute("loc","/loginFrm.do");
			return "common/msg";
		}
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
	@ResponseBody
	@RequestMapping(value="/emailCheck.do")
	public String emailCheck(String email) {
		Member m = service.checkEmail(email);
		if(m == null) {
			return "1";
		}else {
			return "0";
		}
	}
	@ResponseBody
	@RequestMapping(value="/sendMail.do")
	public String sendMail(String email) {
		String result = new MailSender().mailSend(email);
		return result;
	}
	@RequestMapping(value="/findId.do")
	public String findId() {
		return "member/findId";
	}
	@ResponseBody
	@RequestMapping(value="/idFind.do")
	public String idFind(String email) {
		String memberId = service.findId(email);
		return memberId;
	}
	
	@ResponseBody
	@RequestMapping(value="/findPw.do")
	public String findPw(Member member) {
		String m = service.pwCheck(member);
		if(m == null) {
			//ajax로 페이지 이동이 없어야 하므로 ResponseBody 어노테이션을 붙여줘야 데이터 자체로 보내줌
			return "1";
		}else {
			member.setMemberPw(m);
			int result = service.resetPwMember(member);
			if(result>0) {
				return m;				
			}else {
				return "1";
			}
		}
	}
	@RequestMapping(value="/mypage.do")
	public String myPage() {
		return "member/mypage";
	}
	@RequestMapping(value="/updateInfoFrm.do")
	public String updateInfoFrm() {
		return "member/updateInfoFrm";
	}
	@ResponseBody
	@RequestMapping(value="/resignMember.do")
	public String resginMember(String memberId,HttpSession session) {
		int result = service.resignMember(memberId);
		if(result>1) {
			session.invalidate();
			return "1";
		}else {
			return "0";
		}
	}
	@RequestMapping(value="/certification.do")
	public String certification() {
		return "member/certification";
	}
}
