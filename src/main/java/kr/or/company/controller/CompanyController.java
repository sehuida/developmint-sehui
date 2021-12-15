package kr.or.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.company.service.CompanyService;
import kr.or.company.vo.Company;

@Controller
public class CompanyController {

	@Autowired
	private CompanyService service;
	
	@RequestMapping(value="/companyInfo.do")
	public String companyInfo(int companyNo) {
		Company company = service.selectCompany(companyNo);
		System.out.println("company : "+ company);
		return "jobSearch/companyInfo";
	}
}
