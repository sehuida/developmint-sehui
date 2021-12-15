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
		/* ArrayList<Announce> list = service.selectAllannounce(memberNo); */
		Announce announce = service.selectAllannounce(memberNo);
		System.out.println("announce : " +announce);
		model.addAttribute("a", announce);
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
	
	@RequestMapping(value="/updateAnnounceFrm.do")
	public String updateAnnounceFrm(int announceNo, Model model) {
		Announce announce = service.selectOneAnnounce(announceNo);
		model.addAttribute("a", announce);
		return "jobSearch/updateAnnounceFrm";
	}
	
	@RequestMapping(value="/updateAnnounce.do")
	public String updateAnnounce(Model model, Announce a) {
		int result = service.updateAnnounce(a);
		if(result > 0) {
			model.addAttribute("msg","구인공고 수정완료");
		} else {
			model.addAttribute("msg","구인공고 수정실패");
		}
		model.addAttribute("loc", "/announceManage.do?memberNo="+a.getMemberNo());
		return "common/msg";
		
	}
	
	@RequestMapping(value="/deleteAnnounce.do")
	public String deleteAnnounce(Announce a, Model model) {
		int result = service.deleteAnnounce(a.getAnnounceNo());
		if(result > 0) {
			model.addAttribute("msg","구인공고가 삭제되었습니다.");
		} else {
			model.addAttribute("msg","구인공고 삭제 에러");			
		}
		model.addAttribute("loc","/announceManage.do?memberNo="+a.getMemberNo());
		return "common/msg";
	}
	
	
}
