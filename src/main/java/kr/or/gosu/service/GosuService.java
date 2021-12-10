package kr.or.gosu.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.gosu.dao.GosuDao;
import kr.or.gosu.vo.Gosu;
import kr.or.gosu.vo.GosuFeedback;
import kr.or.gosu.vo.GosuNotice;
import kr.or.gosu.vo.GosuPhoto;
import kr.or.gosu.vo.GosuProject;
import kr.or.gosu.vo.GosuTalk;

@Service
public class GosuService {
	@Autowired
	private GosuDao dao;


	@Transactional
	public int insertGosu(Gosu g, ArrayList<GosuPhoto> photoList, ArrayList<GosuProject> projectList) {
		System.out.println(g.getGgsouNo());
		int gosuResult = dao.insertGosu(g); 
		System.out.println(g.getGgsouNo());
		int photoResult = 0;
		int projectResult = 0;
		
		if(gosuResult >0) {
			for(GosuPhoto gph : photoList) {
				gph.setGgsouNo(g.getGgsouNo());
				photoResult += dao.insertGPhoto(gph);
			}	
			for(GosuProject gpr : projectList) {
				gpr.setGgsouNo(g.getGgsouNo());
				projectResult  += dao.insertGProject(gpr);
			}
		}else {
			return -1;
		}
		return projectResult;
	}


	public ArrayList<Gosu> selectGosuList() {
		ArrayList<Gosu> list = dao.selectGosuList();
		for(Gosu g : list) {
			int gosuNo = g.getGsouNo();
		
			g.setGosuId(dao.selectGosuId(gosuNo));
			g.setGosuImg(dao.selectGosuImg(gosuNo));
		}
		return list;
	}


	public Gosu selectGosuOne(int ggosuNo) {
		Gosu gosu = dao.selectGosuOne(ggosuNo);
		gosu.setGosuId(dao.selectGosuId(gosu.getGsouNo()));
		gosu.setGosuImg(dao.selectGosuImg(gosu.getGsouNo()));
		return gosu;
	}


	public ArrayList<GosuProject> selectGosuProject(int gNo) {
		ArrayList<GosuProject> gList = dao.selectGosuProject(gNo);
		return gList;
	}


	public ArrayList<GosuPhoto> selectGosuPhoto(int gNo) {
		ArrayList<GosuPhoto> gList = dao.selectGosuPhoto(gNo);
		return gList;
	}


	public int insertGosuNotice(GosuNotice gNotice) {
		int result = dao.insertGosuNotice(gNotice); 
		return result;
	}


	public GosuNotice selectGosuNoticeOne(int gnoticeNo) {
		GosuNotice gNotice = dao.selectGosuNoticeOne(gnoticeNo);
		gNotice.setWriteImg(dao.selectGosuImg(gNotice.getWriteId()));
		return gNotice;
	}


	public ArrayList<GosuNotice> selectGosuNoticeList() {
		ArrayList<GosuNotice> list = dao.selectGosuNoticeList();
		return list;
	}


	public ArrayList<GosuNotice> selectGosuNoticeList2() {
		ArrayList<GosuNotice> list = dao.selectGosuNoticeList2();
		return list;
	}


	public ArrayList<Gosu> selectNewGosuList() {
		ArrayList<Gosu> list = dao.selectNewGosuList();
		return list;
	}


	public int selectGosuCount() {
		int gosuCount = dao.selectGosuCount();
		return gosuCount;
	}


	public GosuProject selectGProject(int pNo) {
		GosuProject gList = dao.selectGProject(pNo);
		return gList;
	}


	public int insertGosuFeedback(GosuFeedback gf) {
		int result = dao.insertGosuFeedback(gf); 
		return result;
	}


	public GosuFeedback selectFeedbackOne(int fbNo) {
		GosuFeedback gosuFeedback = dao.selectFeedbackOne(fbNo);
		return gosuFeedback;
	}


	public ArrayList<GosuFeedback> selectGosuFeedbackList(String memberId) {
		ArrayList<GosuFeedback> list = dao.selectGosuFeedbackList(memberId);
		for(GosuFeedback g : list) {
			int ggosuNo = g.getGgosuNo();
			g.setGosuId(dao.selectGosuId2(ggosuNo));
		}
		return list;
	}


	public int insertGosuTalk(GosuTalk gt) {
		int result = dao.insertGosuTalk(gt); 
		GosuFeedback gosuFeedback = dao.selectFeedbackOne(gt.getFeedbackNo());
		if(gosuFeedback.getFeedbackNum()==1) {
			int feedbackNumResult = dao.updateFeedbackNum(gt.getFeedbackNo());
		}
		return result;
	}


	public ArrayList<GosuTalk> selectGosuTalk(int fbNo) {
		ArrayList<GosuTalk> list = dao.selectGosuTalk(fbNo);
		for(GosuTalk g : list) {
			String writer = g.getWriter();
			g.setGosuImg(dao.selectGosuImg(writer));
		}
		return list;
	}


	public ArrayList<GosuFeedback> selectGosuFeedbackList2(String memberId) {
		ArrayList<GosuFeedback> list = dao.selectGosuFeedbackList2(memberId);
		
		return list;
	}


	public int talkStop(int feedbackNo) {
		int result = dao.talkStop(feedbackNo);
		return result;
	}

	
}
