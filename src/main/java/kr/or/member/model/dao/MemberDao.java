package kr.or.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import kr.or.gosu.vo.GosuNotice;
import kr.or.member.model.vo.CertiVO;
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

	public String findId(String email) {
		return sqlSession.selectOne("member.findId",email);
	}

	public Member pwCheck(Member member) {
		return sqlSession.selectOne("member.pwCheck",member);
	}

	public int resetPwMember(Member member) {
		return sqlSession.update("member.resetPwMember",member);
	}

	public int resignMember(String memberId) {
		return sqlSession.delete("member.resignMember",memberId);
	}

	public int insertDelete(Member m) {
		return sqlSession.insert("member.insertDelete",m);
	}
	
	public int insertCertification(CertiVO file) {
		return sqlSession.insert("member.insertCertification",file);
	}

	public int updateMyInfo(Member m) {
		return sqlSession.insert("member.updateMyInfo",m);
	}

	public int updateProfile(Member m) {
		return sqlSession.update("member.updateProfile",m);
	}

	public int changePwMember(Member m) {
		return sqlSession.update("member.changePwMember",m);
	}

	public int addCompany(Member m) {
		return sqlSession.update("member.addCompnay",m);
	}

	public int checkCompany(Member m) {
		return sqlSession.selectOne("member.checkCompany",m);
	}

	public int delProfile(Member m) {
		return sqlSession.update("member.delProfile",m);
	}

	public ArrayList<GosuNotice> gosuNoticeLists(HashMap<String, Object> map) {
		List<GosuNotice> list = sqlSession.selectList("member.gosuNoticeList",map);
		return (ArrayList<GosuNotice>)list;
	}

	public int gosuTotalCount(String memberId) {
		return sqlSession.selectOne("member.gosuTotalCount",memberId);
	}

}