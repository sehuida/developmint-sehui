package kr.or.admin.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	
}
