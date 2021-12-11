package kr.or.admin.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.comment.vo.Report;
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

	public int todayTotalContent(String sToday) {
		return sqlSession.selectOne("admin.todayTotalContent", sToday);
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

	public ArrayList<Report> allReportList(Map<String, Object> map) {
		List<Report> list = sqlSession.selectList("admin.allReportList",map);
		return (ArrayList<Report>)list;
	}

	public int reportCount() {
		return sqlSession.selectOne("admin.reportCount");
	}

	public List<String> memberIdList(Map<String, Object> map) {
		List<String> list = sqlSession.selectList("admin.memberIdList", map);
		return list;
	}

	public int memberReportCount(String id) {
		return sqlSession.selectOne("admin.memberReportCount",id);
	}

	public int canselReport(int reportNo) {
		return sqlSession.update("admin.canselReport", reportNo);
	}

	public int reportInsert(int reportNo) {
		return sqlSession.update("admin.reportInsert", reportNo);
	}

	public int falseReport(int reportNo) {
		return sqlSession.update("admin.falseReport", reportNo);
	}

	public int memberGradeChange1(Map<String, Object> map) {
		return sqlSession.update("admin.memberGradeChange1", map);
	}

	public int memberGradeChange2(String memberId) {
		return sqlSession.update("admin.memberGradeChange2", memberId);
	}

	public ArrayList<Report> report5List() {
		List<Report> list = sqlSession.selectList("admin.report5List");
		return (ArrayList<Report>)list;
	}

	public List<String> report5ListMember() {
		List<String> list = sqlSession.selectList("admin.report5ListMember");
		return list;
	}

	public int yesterDayTotalMember(String ydate) {
		return sqlSession.selectOne("admin.yesterDayTotalMember", ydate);
	}

	public int yesterDayTotalBoard(String ydate) {
		return sqlSession.selectOne("admin.yesterDayTotalBoard", ydate);
	}
	
	public ArrayList<Member> allblockedList(Map<String, Object> map) {
		List<Member> list = sqlSession.selectList("admin.allblockedList",map);
		return (ArrayList<Member>)list;
	}

	public int totalBlockedCount(Map<String, Object> map) {
		return sqlSession.selectOne("admin.totalBlockedCount", map);
	}
	
	public List<String> blockedMemberId(Map<String, Object> map) {
		return sqlSession.selectList("admin.blockedMemberId",map);
	}

	public List<String> lastReportDate(String memberId) {
		return sqlSession.selectList("admin.lastReportDate",memberId);
	}

	public ArrayList<Report> memberReportView(String id) {
		List<Report> list = sqlSession.selectList("admin.memberReportView",id);
		return (ArrayList<Report>)list;
	}
	


	

}







