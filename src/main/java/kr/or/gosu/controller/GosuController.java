package kr.or.gosu.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.gosu.service.GosuService;



@Controller
public class GosuController {
	
	@Autowired
	private GosuService service;
	
	@RequestMapping(value="/gosuMain.do")
	public String gosuMain() {
		return "gosu/gosuMain";
	}
	@RequestMapping(value="/gosuList.do")
	public String gosuList() {
		return "gosu/gosuList";
	}

	@RequestMapping(value="/gosuContent.do")
	public String gosuContent() {
		return "gosu/gosuContent";
	}
	@RequestMapping(value="/gosuWriteFrm.do")
	public String gosuWriteFrm() {
		return "gosu/gosuWriteFrm";
	}
	@RequestMapping(value="/gosuSituation.do")
	public String gosuSituation() {
		return "gosu/gosuSituation";
	}
	@RequestMapping(value="/gosuFeedback.do")
	public String gosuFeedback() {
		return "gosu/gosuFeedback";
	}
	@RequestMapping(value="/gosuTalk.do")
	public String gosuTalk() {
		return "gosu/gosuTalk";
	}
	@RequestMapping(value="/gosuNotice.do")
	public String gosuNotice() {
		return "gosu/gosuNotice";
	}
}
