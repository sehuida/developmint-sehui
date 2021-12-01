package kr.or.projectTeam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.projectTeam.model.service.ProjectTeamService;

@Controller
public class ProjectTeamController {
	@Autowired
	private ProjectTeamService service;
	
	@RequestMapping(value="/recruitTeamMember_mainPage.do")
	public String recruitTeamMember() {
		
		return "recruitCrue/recruitTeamMember_mainPage";
	}
}
