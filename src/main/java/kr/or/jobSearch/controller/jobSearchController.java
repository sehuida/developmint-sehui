package kr.or.jobSearch.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.resume.vo.Resume;

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
	
	
	
	@RequestMapping(value="/announceFrm.do")
	public String announceFrm() {
		return "jobSearch/announceFrm";
	}
	
}
		
