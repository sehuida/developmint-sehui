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
		gradeList.add(sqlSession.selectOne("admin.bronzeCount"));
		gradeList.add(sqlSession.selectOne("admin.silverCount"));
		gradeList.add(sqlSession.selectOne("admin.goldCount"));
		gradeList.add(sqlSession.selectOne("admin.platinumCount"));
		gradeList.add(sqlSession.selectOne("admin.diamondCount"));
		gradeList.add(sqlSession.selectOne("admin.masterCount"));
		gradeList.add(sqlSession.selectOne("admin.challengerCount"));
		return gradeList;
	}

	public List<Integer> cateList() {
		List<Integer> cateList = new ArrayList<Integer>();
		cateList.add(sqlSession.selectOne("admin.projectCount"));
		cateList.add(sqlSession.selectOne("admin.shareCount"));
		cateList.add(sqlSession.selectOne("admin.resumeCount"));
		cateList.add(sqlSession.selectOne("admin.gosuCount"));
		cateList.add(sqlSession.selectOne("admin.contestCount"));
		return cateList;
	}

	
}
