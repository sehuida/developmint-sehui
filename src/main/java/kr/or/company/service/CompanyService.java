package kr.or.company.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.comment.vo.Comment;
import kr.or.company.dao.CompanyDao;
import kr.or.company.vo.Company;
import kr.or.company.vo.CompanyInfo;
import kr.or.company.vo.CompanyInfoComment;
import kr.or.contest.vo.ContestList;

@Service
public class CompanyService {

	@Autowired
	private CompanyDao dao;

	public /*CompanyInfoComment*/ CompanyInfo selectCompany(String companyName, int companyNo) {
		ArrayList<Comment> commentList = dao.commentList(companyNo);
		CompanyInfo companyInfo = dao.selectCompany(companyName);
		/*
		 * CompanyInfoComment list = new CompanyInfoComment(companyInfo, commentList);
		 */
		return companyInfo;
	}
	
	@Transactional
	public int insertCompanyComment(Comment cm) {
		return dao.insertCompanyComment(cm);
	}
	
	@Transactional
	public int updateCompanyComment(Comment cm) {
		return dao.updateCompanyComment(cm);
	}
	
	@Transactional
	public int deleteCompanyComment(Comment cm) {
		return dao.deleteCompanyComment(cm);
	}

	public int selectCompanyNo(String companyName) {
		return dao.selectCompanyNo(companyName);
	}
}
