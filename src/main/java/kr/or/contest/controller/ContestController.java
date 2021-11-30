package kr.or.contest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.contest.service.ContestService;

@Controller
public class ContestController {

	@Autowired
	private ContestService service;
	
	//공모전 메인페이지 이동
	@RequestMapping(value="/contestMain.do")
	public String contestMain() {
		return "contest/contestMain";
	}
	
	//공모전 등록 페이지 이동
	@RequestMapping(value="insertContestFrm.do")
	public String insertContestFrm() {
		return "contest/insertContestFrm";
	}
}
