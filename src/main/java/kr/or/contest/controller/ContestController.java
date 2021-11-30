package kr.or.contest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.contest.service.ContestService;

@Controller
public class ContestController {

	@Autowired
	private ContestService service;
	
	@RequestMapping(value="/contestMain.do")
	public String contestMain() {
		return "contest/contestMain";
	}
}
