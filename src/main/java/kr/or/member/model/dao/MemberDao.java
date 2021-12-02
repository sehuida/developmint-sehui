package kr.or.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectOneMember(Member member) {
		return sqlSession.selectOne("member.selectOneMember",member);
	}

	public Member checkPhone(String phone) {
		return sqlSession.selectOne("member.checkPhone",phone);
	}

	public Member checkId(String memberId) {
		return sqlSession.selectOne("member.checkId",memberId);
	}

	public Member checkEmail(String email) {
		return sqlSession.selectOne("member.checkEmail",email);
	}

	public int insertMember(Member member) {
		return sqlSession.insert("member.insertMember",member);
	}
	
	
}