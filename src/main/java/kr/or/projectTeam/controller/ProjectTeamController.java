package kr.or.projectTeam.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.projectTeam.model.service.ProjectTeamService;
import kr.or.projectTeam.model.vo.ProjectTeam;

@Controller
public class ProjectTeamController {
	@Autowired
	private ProjectTeamService service;
	
	@RequestMapping(value="/recruitTeamMember_mainPage.do")
	public String recruitTeamMember(Model model ) {
		ArrayList<ProjectTeam> list = service.selectAllrecruitProject();
		model.addAttribute("list", list);
		System.out.println(list.get(0).getRTitle());
		return "recruitCrue/recruitTeamMember_mainPage";
	}
}
