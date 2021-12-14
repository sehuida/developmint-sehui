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
import kr.or.contest.vo.ContestMemberList;
import kr.or.member.model.vo.CertiVO;
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

	public List<Integer> concelReportNo(String id) {
		return sqlSession.selectList("admin.concelReportNo",id);
	}

	public int cancelReportMember(int no) {
		return sqlSession.update("admin.cancelReportMember", no);
	}

	public int changeType(String id) {
		return sqlSession.update("admin.changeType", id);
	}

	public ArrayList<Contest> contestList(Map<String, Object> map) {
		List<Contest> list = sqlSession.selectList("admin.contestList",map);
		return (ArrayList<Contest>)list;
	}

	public int totalContestCount() {
		return sqlSession.selectOne("admin.totalContestCount");
	}

	public Contest enrollContestView(int contestNo) {
		return sqlSession.selectOne("contest.contestView", contestNo);
	}

	public int contestOK(int contestNo) {
		return sqlSession.update("admin.contestOK", contestNo);
	}

	public int contestNO(int contestNo) {
		return sqlSession.update("admin.contestNO", contestNo);
	}

	public ArrayList<Contest> contestDateList(Map<String, Object> map) {
		List<Contest> list = sqlSession.selectList("admin.contestDateList",map);
		return (ArrayList<Contest>)list;
	}

	public int totalContestDateCount(String date) {
		return sqlSession.selectOne("admin.totalContestDateCount",date);
	}

	public ArrayList<ContestMemberList> searchContestMember(int contestNo) {
		List<ContestMemberList> list = sqlSession.selectList("admin.searchContestMember",contestNo);
		return (ArrayList<ContestMemberList>)list;
	}

	public int MemberEnrollContest(Map<String, Object> map) {
		return sqlSession.update("admin.MemberEnrollContest",map);
	}

	public Integer contestMemberCount(int contestNo) {
		return sqlSession.selectOne("admin.contestMemberCount",contestNo);
	}

	public ArrayList<ContestMemberList> enrollMemberList(int contestNo) {
		List<ContestMemberList> list = sqlSession.selectList("admin.enrollMemberList",contestNo);
		return (ArrayList<ContestMemberList>)list;
	}

	public ArrayList<CertiVO> certiList(Map<String, Object> map) {
		List<CertiVO> list = sqlSession.selectList("admin.certiList",map);
		return (ArrayList<CertiVO>)list;
	}

	public int totalcertiMemberCount() {
		return sqlSession.selectOne("admin.totalcertiMemberCount");
	}

	public Member memberInfoList(int memberNo) {
		return sqlSession.selectOne("admin.memberInfoList",memberNo);
	}
	


	

}






