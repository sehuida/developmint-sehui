package kr.or.company.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.comment.vo.Comment;
import kr.or.company.vo.Company;
import kr.or.company.vo.CompanyInfo;

@Repository
public class CompanyDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public CompanyInfo selectCompany(String companyName) {
		return sqlSession.selectOne("company.selectCompany", companyName);
	}
	
	public int insertCompanyComment(Comment cm) {
		return sqlSession.insert("company.insertCompanyComment",cm);
	}

	public ArrayList<Comment> commentList(int companyNo) {
		List<Comment> list = sqlSession.selectList("company.commentList", companyNo);
		return (ArrayList<Comment>)list;
	}

	public int updateCompanyComment(Comment cm) {
		return sqlSession.update("contest.updateCompanyComment",cm);
	}

	public int deleteCompanyComment(Comment cm) {
		return sqlSession.delete("contest.deleteCompanyComment",cm);
	}

	public int selectCompanyNo(String companyName) {
		return sqlSession.selectOne("company.selectCompanyNo", companyName);
	}
}
