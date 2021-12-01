package kr.or.projectTeam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectTeamController {
	
	@RequestMapping(value="/recruitTeamMember_mainPage.do")
	public String recruitTeamMember() {
		return "recruitCrue/recruitTeamMember_mainPage";
	}
}
