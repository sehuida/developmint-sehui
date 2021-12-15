package kr.or.gosu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.or.gosu.vo.Gosu;
import kr.or.gosu.vo.GosuFeedback;
import kr.or.gosu.vo.GosuNotice;
import kr.or.gosu.vo.GosuPhoto;
import kr.or.gosu.vo.GosuProject;
import kr.or.gosu.vo.GosuRequest;
import kr.or.gosu.vo.GosuRequestCost;
import kr.or.gosu.vo.GosuRequestCount;
import kr.or.gosu.vo.GosuRequestProject;
import kr.or.gosu.vo.GosuRequestProjectSub;
import kr.or.gosu.vo.GosuReview;
import kr.or.gosu.vo.GosuTalk;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
@Repository
public class GosuDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertGosu(Gosu g) {
		
		return sqlSession.insert("gosu.insertGosu",g);
	}

	public int insertGPhoto(GosuPhoto gph) {
		return sqlSession.insert("gosu.insertGPhoto",gph);
	}

	public int insertGProject(GosuProject gpr) {
		return sqlSession.insert("gosu.insertGProject",gpr);
	}

	public ArrayList<Gosu> selectGosuList() {
		List<Gosu> list = sqlSession.selectList("gosu.gosuList");
		return (ArrayList<Gosu>)list;
	}

	public String selectGosuId(int gosuNo) {
		return sqlSession.selectOne("gosu.getGosuId",gosuNo);
	}

	public String selectGosuImg(int gosuNo) {
		return sqlSession.selectOne("gosu.getGosuImg",gosuNo);
	}

	public Gosu selectGosuOne(int ggosuNo) {
		return sqlSession.selectOne("gosu.selectGosuOne",ggosuNo);
	}

	public ArrayList<GosuProject> selectGosuProject(int gNo) {
		List<GosuProject> list = sqlSession.selectList("gosu.selectGosuProjectList",gNo);
		return (ArrayList<GosuProject>)list;
	}

	public ArrayList<GosuPhoto> selectGosuPhoto(int gNo) {
		List<GosuPhoto> list = sqlSession.selectList("gosu.selectGosuPhotoList",gNo);
		return (ArrayList<GosuPhoto>)list;
	}

	public int insertGosuNotice(GosuNotice gNotice) {
		return sqlSession.insert("gosu.insertGosuNotice",gNotice);
	}

	public GosuNotice selectGosuNoticeOne(int gnoticeNo) {
		return sqlSession.selectOne("gosu.selectGosuNoticeOne",gnoticeNo);
	}

	public ArrayList<GosuNotice> selectGosuNoticeList() {
		List<GosuNotice> list = sqlSession.selectList("gosu.selectGosuNoticeList");
		return (ArrayList<GosuNotice>)list;
	}

	public String selectGosuImg(String writeId) {
		return sqlSession.selectOne("gosu.getGosuImg2",writeId);
	}

	public ArrayList<GosuNotice> selectGosuNoticeList2() {
		List<GosuNotice> list = sqlSession.selectList("gosu.selectGosuNoticeList2");
		return (ArrayList<GosuNotice>)list;
	}

	public ArrayList<Gosu> selectNewGosuList() {
		List<Gosu> list = sqlSession.selectList("gosu.selectNewGosuList");
		return (ArrayList<Gosu>)list;
	}

	public int selectGosuCount() {
		return sqlSession.selectOne("gosu.selectGosuCount");
	}

	public GosuProject selectGProject(int pNo) {
		return sqlSession.selectOne("gosu.selectGProject",pNo);
	}

	public int insertGosuFeedback(GosuFeedback gf) {
		return sqlSession.insert("gosu.insertGosuFeedback",gf);
	}

	public GosuFeedback selectFeedbackOne(int fbNo) {
		return sqlSession.selectOne("gosu.selectFeedbackOne",fbNo);
	}

	public ArrayList<GosuFeedback> selectGosuFeedbackList(String memberId) {
		List<GosuFeedback> list = sqlSession.selectList("gosu.selectGosuFeedbackList",memberId);
		return (ArrayList<GosuFeedback>)list;
	}

	public String selectGosuId2(int ggosuNo) {
		return sqlSession.selectOne("gosu.getGosuId2",ggosuNo);
	}

	public int insertGosuTalk(GosuTalk gt) {
		return sqlSession.insert("gosu.insertGosuTalk",gt);
	}

	public int updateFeedbackNum(int feedbackNo) {
		return sqlSession.update("gosu.updateFeedbackNum",feedbackNo);
	}

	public ArrayList<GosuTalk> selectGosuTalk(int fbNo) {
		List<GosuTalk> list = sqlSession.selectList("gosu.selectGosuTalkList",fbNo);
		return (ArrayList<GosuTalk>)list;
	}

	public ArrayList<GosuFeedback> selectGosuFeedbackList2(String memberId) {
		List<GosuFeedback> list = sqlSession.selectList("gosu.selectGosuFeedbackList2",memberId);
		return (ArrayList<GosuFeedback>)list;
	}

	public int talkStop(int feedbackNo) {
		return sqlSession.update("gosu.talkStop",feedbackNo);
	}

	public String selectMemberId(int feedbackNo) {
		return sqlSession.selectOne("gosu.selectMemberId",feedbackNo);
	}

	public Gosu selectgosuWriteList(String gosuId) {
		return sqlSession.selectOne("gosu.selectgosuWriteList",gosuId);
	}

	public int insertGosuRequest(GosuRequest gr) {
		return sqlSession.insert("gosu.insertGosuRequest",gr);
	}

	public ArrayList<GosuRequest> selectMemberRequestList() {
		List<GosuRequest> list = sqlSession.selectList("gosu.selectMemberRequestList");
		return (ArrayList<GosuRequest>)list;
	}

	public GosuRequest selectGosuRequestContent(int mrn) {
		return sqlSession.selectOne("gosu.selectGosuRequestContent",mrn);
	}

	public int gosuRequestCostInsert(GosuRequestCost grc) {
		return sqlSession.insert("gosu.gosuRequestCostInsert",grc);
	}

	public ArrayList<GosuRequestCost> selectGosuRequestCostList(String memberId) {
		List<GosuRequestCost> list = sqlSession.selectList("gosu.selectGosuRequestCostList",memberId);
		return (ArrayList<GosuRequestCost>)list;
	}

	public GosuRequestCost selectRequestNoGosuNo(GosuRequestCost grc) {
		return sqlSession.selectOne("gosu.selectRequestNoGosuNo",grc);
	}

	public GosuRequestCost selectGosuRequestCost(int costNo) {
		return sqlSession.selectOne("gosu.selectGosuRequestCost",costNo);
	}

	public int selectRequestCount() {
		return sqlSession.selectOne("gosu.selectRequestCount");
	}

	public int insertGosuRequestProjectSub(GosuRequestProjectSub grps) {
		return sqlSession.insert("gosu.insertGosuRequestProjectSub",grps);
	}

	public ArrayList<GosuRequestProject> selectGosuRequestProjectOne(int rpsNo) {
		List<GosuRequestProject> list = sqlSession.selectList("gosu.selectGosuRequestProjectOne",rpsNo);
		return (ArrayList<GosuRequestProject>)list;
	}

	public GosuRequestProjectSub selectGosuRequestProjectSub(int rpsNo) {
		return sqlSession.selectOne("gosu.selectGosuRequestProjectSub",rpsNo);
	}

	public ArrayList<GosuRequestProjectSub> selectGosuRequestProjectSubList(int memberNo) {
		List<GosuRequestProjectSub> list = sqlSession.selectList("gosu.selectGosuRequestProjectSubList",memberNo);
		return (ArrayList<GosuRequestProjectSub>)list;
	}

	public ArrayList<GosuRequestProjectSub> selectGosuRequestProjectSubList2(int memberNo) {
		List<GosuRequestProjectSub> list = sqlSession.selectList("gosu.selectGosuRequestProjectSubList2",memberNo);
		return (ArrayList<GosuRequestProjectSub>)list;
	}

	public int insertGosuRequestProject(GosuRequestProject grp) {
		return sqlSession.insert("gosu.insertGosuRequestProject",grp);
	}

	public int talkStop2(int requestProjectSubNo) {
		return sqlSession.update("gosu.talkStop2",requestProjectSubNo);
	}

	public int insetReviewOne(GosuReview greview) {
		return sqlSession.insert("gosu.insetReviewOne",greview);
	}

	public GosuReview selectGosuReviewOne(GosuReview gr) {
		return sqlSession.selectOne("gosu.selectGosuReviewOne",gr);
	}

	public ArrayList<GosuReview> selectGosuReviewList(int ggsouNo) {
		List<GosuReview> list = sqlSession.selectList("gosu.selectGosuReviewList",ggsouNo);
		return (ArrayList<GosuReview>)list;
	}


	public int selectReviewCount(int ggsouNo) {
		return sqlSession.selectOne("gosu.selectReviewCount",ggsouNo);
	}

	public int selectReviewAvg(int ggsouNo) {
		return sqlSession.selectOne("gosu.selectReviewAvg",ggsouNo);
	}


}
