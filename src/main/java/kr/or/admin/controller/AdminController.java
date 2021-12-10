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
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String allMemberList(Model model, int reqPage, int type, int list, String id) {
		TotalMember tm = service.totalMember(reqPage,type,list,id);
		model.addAttribute("memberList", tm.getAllMemberList());
		model.addAttribute("start",tm.getStart());
		model.addAttribute("pageNavi",tm.getPageNavi());
		model.addAttribute("totalCount",tm.getTotalCountList());
		model.addAttribute("type",type);
		model.addAttribute("list",list);
		return "admin/allMemberList";
	}
	
	//신고회원목록으로 이동
	@RequestMapping(value="/reportMember.do")
	public String reportMember(Model model, int reqPage) {
		TotalMember tm = service.totalReposrtList(reqPage);
		model.addAttribute("reportList", tm.getAllReportList());
		model.addAttribute("start",tm.getStart());
		model.addAttribute("pageNavi",tm.getPageNavi());
		model.addAttribute("memberId",tm.getMemberId());
		model.addAttribute("totalCount", tm.getTotalCount());
		model.addAttribute("report5List", tm.getReport5List());
		model.addAttribute("report5ListMember", tm.getReport5ListMember());
		return "admin/reportMember";
	}
	
	//차단회원목록으로 이동
	@RequestMapping(value="/blockedMember.do")
	public String blockedMember(Model model) {
		return "admin/blockedMember";
	}
	
	//선택회원 등급 변경
	@RequestMapping(value="/chkChangeLevel.do")
	public String chkChangeLevel(Model model, String memberId, String level) {
		boolean result = service.chkChangeLevel(memberId, level);
		if(result) {
			model.addAttribute("msg","변경성공");
		}else {
			model.addAttribute("msg","변경실패");
		}
		model.addAttribute("loc","/allMemberList.do?reqPage=1&type=0&list=1");
		return "common/msg";
	}
	
	//선택회원 신고 횟수
	@ResponseBody
	@RequestMapping(value="/memberReportCount.do")
	public int memberReportCount(String id) {
		int memberReportCount = service.memberReportCount(id);
		return memberReportCount;
	}
	
	//신고 반려 처리
	@RequestMapping(value="/cancleReport.do")
	public String canselReport(Model model, int reportNo) {
		int result = service.canselReport(reportNo);
		if(result>0) {
			model.addAttribute("msg","신고 반려되었습니다.");
		}else {
			model.addAttribute("msg","처리 실패하였습니다.");
		}
		model.addAttribute("loc","/reportMember.do?reqPage=1");
		return "common/msg";
	}

	//신고 처리
	@RequestMapping(value="/reportInsert.do")
	public String reportInsert(Model model, int reportNo, String memberId) {
		int result = service.reportInsert(reportNo, memberId);
		if(result>0) {
			model.addAttribute("msg","신고 처리되었습니다.");
		}else {
			model.addAttribute("msg","처리 실패하였습니다.");
		}
		model.addAttribute("loc","/reportMember.do?reqPage=1");
		return "common/msg";
	}
	
	//허위 신고 처리
	@RequestMapping(value="/falseReport.do")
	public String falseReport(Model model, int reportNo, String memberId) {
		int result = service.falseReport(reportNo, memberId);
		if(result>0) {
			model.addAttribute("msg","허위신고로 처리되었습니다.");
		}else {
			model.addAttribute("msg","처리 실패하였습니다.");
		}
		model.addAttribute("loc","/reportMember.do?reqPage=1");
		return "common/msg";
	}
	

}
















