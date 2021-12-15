package kr.or.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.company.dao.CompanyDao;
import kr.or.company.vo.Company;
import kr.or.company.vo.CompanyInfo;

@Service
public class CompanyService {

	@Autowired
	private CompanyDao dao;

	public CompanyInfo selectCompany(String companyName) {
		return dao.selectCompany(companyName);
	}
}
