package kr.or.admin.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.admin.service.AdminService;
import kr.or.admin.vo.TotalData;
import kr.or.admin.vo.TotalMember;

@Controller
public class AdminController {

	@Autowired
	private AdminService service; 
	
	
	//관리자 페이지로 이동
	@RequestMapping(value="/adminPage.do")
	public String adminPage() {
		return "admin/adminPage";
	}
	
	//대시보드로 이동
	@RequestMapping(value="/dashboard.do")
	public String dashboard(Model model) {
		//오늘 날짜 전송
		LocalDate today = LocalDate.now();
		model.addAttribute("today",today);
		//오늘 날짜 String으로 변환
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String sToday = today.format(formatter);
		//통계자료
		TotalData td = service.totaldata(sToday);
		
		model.addAttribute("todayTotalMember",td.getTodayTotalMember());
		model.addAttribute("todayJoinMember",td.getTodayJoinMember());
		model.addAttribute("todayOutMember",td.getTodayOutMember());
		model.addAttribute("todayTotalContent",td.getTodayTotalContent());
		model.addAttribute("dateList",td.getDateList());
		model.addAttribute("joinList",td.getJoinList());
		model.addAttribute("outList",td.getOutList());
		model.addAttribute("gradeList",td.getGradeList());
		model.addAttribute("cateList",td.getCateList());
		return "admin/dashboard";
	}
	
	//전체회원리스트 목록으로 이동
	@RequestMapping(value="/allMemberList.do")
	public String allMemberList(Model model, int reqPage, int type, String list) {
		TotalMember tm = service.totalMember(reqPage,type,list);
		model.addAttribute("memberList", tm.getAllMemberList());
		model.addAttribute("start",tm.getStart());
		model.addAttribute("pageNavi",tm.getPageNavi());
		return "admin/allMemberList";
	}
	
	//신고회원목록으로 이동
	@RequestMapping(value="/reportMember.do")
	public String reportMember(Model model) {
		return "admin/reportMember";
	}
	
	//차단회원목록으로 이동
	@RequestMapping(value="/blockedMember.do")
	public String blockedMember(Model model) {
		return "admin/blockedMember";
	}
	
	
}
