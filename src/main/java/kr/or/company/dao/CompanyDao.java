package kr.or.company.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.company.vo.Company;
import kr.or.company.vo.CompanyInfo;

@Repository
public class CompanyDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public CompanyInfo selectCompany(String companyName) {
		return sqlSession.selectOne("company.selectCompany", companyName);
	}
}
