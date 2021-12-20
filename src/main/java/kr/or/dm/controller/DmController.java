package kr.or.dm.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.dm.model.service.DmService;
import kr.or.dm.model.vo.DirectMessage;
import kr.or.member.model.vo.Member;

@Controller
public class DmController {
	@Autowired
	private DmService service;
	
	//SessionAttribute 하면 세션에 있는 멤버를 바로 가져옴!
	@RequestMapping(value="/dmList.do")
	public String dmList(@SessionAttribute Member m,Model model) {
		ArrayList<DirectMessage> list = service.selectDmList(m.getMemberId());
		model.addAttribute("list", list);
		return "dm/dmList";
	}
	@ResponseBody
	@RequestMapping(value="/sendDm.do")
	public String sendDm(DirectMessage dm) {
		int result = service.sendDm(dm);
		if(result>0) {
			return "1";
		}else {
			return "0";
		}
	}
}
