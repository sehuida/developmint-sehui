package kr.or.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.company.service.CompanyService;
import kr.or.company.vo.Company;
import kr.or.company.vo.CompanyInfo;

@Controller
public class CompanyController {

	@Autowired
	private CompanyService service;
	
	@RequestMapping(value="/companyInfo.do")
	public String companyInfo(String companyName, Model model) {
		//회사명으로 company정보 가져오기
		CompanyInfo company = service.selectCompany(companyName);
		model.addAttribute("com", company);
		System.out.println("company : "+ company);
		return "jobSearch/companyInfo";
	}
}
