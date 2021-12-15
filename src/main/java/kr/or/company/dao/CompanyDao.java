package kr.or.company.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.company.vo.Company;

@Repository
public class CompanyDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Company selectCompany(int companyNo) {
		return sqlSession.selectOne("company.selectCompany", companyNo);
	}
}
