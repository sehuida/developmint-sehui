package kr.or.common;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.contest.service.ContestService;
import kr.or.contest.vo.ContestList;
import kr.or.gosu.service.GosuService;
import kr.or.gosu.vo.Gosu;
import kr.or.projectTeam.model.service.ProjectTeamService;

@Controller
public class mainController {
	
	@Autowired
	private ProjectTeamService ptsService;
	
	@Autowired
	private GosuService gosuService;
	
	@Autowired
	private ContestService conService;
	
	@RequestMapping(value="/main.do")
	public String main(Model model) {
		ArrayList<Gosu> g = gosuService.selectGosuList();
		model.addAttribute("gosuList",g);
		ContestList list = conService.selectContestList();
		model.addAttribute("conlist",list);
		return "common/main";
	}
	
}
