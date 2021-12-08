package kr.or.admin.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.contest.vo.Contest;
import kr.or.member.model.vo.Member;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int todayTotalMember() {
		return sqlSession.selectOne("admin.todayTotalMember");
	}

	public int todayJoinMember(String sToday) {
		return sqlSession.selectOne("admin.todayJoinMember", sToday);
	}

	public int todayOutMember(String sToday) {
		return sqlSession.selectOne("admin.todayOutMember", sToday);
	}

	public int todayTotalContent() {
		return sqlSession.selectOne("admin.todayTotalContent");
	}

	public List<Integer> gradeList() {
		List<Integer> gradeList = new ArrayList<Integer>();
		gradeList.add((Integer)sqlSession.selectOne("admin.bronzeCount"));
		gradeList.add((Integer)sqlSession.selectOne("admin.silverCount"));
		gradeList.add((Integer)sqlSession.selectOne("admin.goldCount"));
		gradeList.add((Integer)sqlSession.selectOne("admin.platinumCount"));
		gradeList.add((Integer)sqlSession.selectOne("admin.diamondCount"));
		gradeList.add((Integer)sqlSession.selectOne("admin.masterCount"));
		gradeList.add((Integer)sqlSession.selectOne("admin.challengerCount"));
		return gradeList;
	}

	public List<Integer> cateList() {
		List<Integer> cateList = new ArrayList<Integer>();
		cateList.add((Integer)sqlSession.selectOne("admin.projectCount"));
		cateList.add((Integer)sqlSession.selectOne("admin.shareCount"));
		cateList.add((Integer)sqlSession.selectOne("admin.resumeCount"));
		cateList.add((Integer)sqlSession.selectOne("admin.gosuCount"));
		cateList.add((Integer)sqlSession.selectOne("admin.contestCount"));
		return cateList;
	}

	public ArrayList<Member> allMemberList(Map<String, Object> map) {
		List<Member> list = sqlSession.selectList("admin.allMemberList",map);
		return (ArrayList<Member>)list;
	}

	public int allMemberCount(Map<String, Object> map) {
		return sqlSession.selectOne("admin.allMemberCount", map);
	}

	public List<Integer> totalCountList() {
		List<Integer> totalList = new ArrayList<Integer>();
		totalList.add((Integer)sqlSession.selectOne("admin.todayTotalMember"));
		totalList.add((Integer)sqlSession.selectOne("admin.totalUser"));
		totalList.add((Integer)sqlSession.selectOne("admin.totalGosu"));
		totalList.add((Integer)sqlSession.selectOne("admin.totalCompany"));
		return totalList;
	}

	public int chkChangeLevel(Map<String, Object> map) {
		return sqlSession.update("admin.chkChangeLevel", map);
	}

	
}
