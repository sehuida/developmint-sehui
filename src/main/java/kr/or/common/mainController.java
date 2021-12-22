package kr.or.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.projectTeam.model.service.ProjectTeamService;

@Controller
public class mainController {
	
	@Autowired
	private ProjectTeamService ptsService;
	
	@RequestMapping(value="/main.do")
	public String main(Model model) {
		return "common/main";
	}
	
}
