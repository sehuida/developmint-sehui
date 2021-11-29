package kr.or.admin.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.admin.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService service; 
	
	/*
	 나중에 헤더에 이동경로 추가 예정
	@RequestMapping(value="/adminPage.do")
	public String adminPage() {
		return "admin/adminPage";
	}
	*/
	
	@RequestMapping(value="/dashboard.do")
	public String dashboard(Model model) {
		//오늘 날짜 전송
		LocalDate today = LocalDate.now();
		model.addAttribute("today",today);
		return "admin/dashboard";
	}
	
}
