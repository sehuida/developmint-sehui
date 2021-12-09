package kr.or.announce.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.announce.service.AnnounceService;
import kr.or.announce.vo.Announce;

@Controller
public class AnnounceController {
	@Autowired
	private AnnounceService service;

	@RequestMapping(value="/announceManage.do")
	public String announceManage(Model model, int memberNo) {
		ArrayList<Announce> list = service.selectAllannounce(memberNo);
		model.addAttribute("list", list);
		return "jobSearch/announceManage";
	}
	
	@RequestMapping(value="/insertAnnounce.do")
	public String insertAnnounce(Announce a, int memberNo, Model model) {
		System.out.println("여기 AnnounceController");
		System.out.println(memberNo);
		int result = service.insertAnnounce(a);
		if(result != 0) {
			model.addAttribute("msg","구인공고 등록성공");
		} else {
			model.addAttribute("msg","구인공고 등록실패");			
		}
		model.addAttribute("loc","/announceManage.do?memberNo="+memberNo);
		return "common/msg";
	}
	
	@RequestMapping(value="/applicationStatus.do")
	public String applicationStatus() {
		
		return "jobSearch/applicationStatus";
	}
	
}
