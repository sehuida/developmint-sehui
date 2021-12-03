package kr.or.jobSearch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class jobSearchController {

	@RequestMapping(value="/jobSearchList.do")
	public String jobSearchList() {
		return "jobSearch/jobSearchList";
	}
	
	@RequestMapping(value="/companyInfo.do")
	public String companyInfo() {
		return "jobSearch/companyInfo";
	}
	
	@RequestMapping(value="/announceManage.do")
	public String announceManage() {
		return "jobSearch/announceManage";
	}
	
	@RequestMapping(value="/announceFrm.do")
	public String announceFrm() {
		return "jobSearch/announceFrm";
	}
}
