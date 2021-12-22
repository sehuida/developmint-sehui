package kr.or.common;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.admin.service.AdminService;
import kr.or.admin.vo.TotalData;
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
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/main.do")
	public String main(Model model) {
		//고수에서 불러오기
		ArrayList<Gosu> g = gosuService.selectGosuList();
		//공모전에서 불러오기
		ContestList list = conService.selectContestList();
		//admin에서 불러오기
		LocalDate today = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String sToday = today.format(formatter);
		TotalData td = adminService.totaldata(sToday);
		model.addAttribute("gosuList",g);
		model.addAttribute("conlist",list);
		model.addAttribute("noticeList", td.getNoticeList());
		model.addAttribute("nonQnaList", td.getNonQnaList());
		//개발지식공유에서 불러오기
		
		//팀프로젝트에서 불러오기
		return "common/main";
	}
	
}
