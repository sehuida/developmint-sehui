package kr.or.announce.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.announce.dao.AnnounceDao;
import kr.or.announce.vo.Announce;
import kr.or.announce.vo.AnnounceList;
import kr.or.announce.vo.AnnounceView;

@Service
public class AnnounceService {
	
	@Autowired
	private AnnounceDao dao;

	public int insertAnnounce(Announce a) {
		System.out.println("여기 announceService");
		return dao.insertAnnounce(a);
	}

	public Announce selectAllannounce(int memberNo) {
		return dao.selectAllAnnounce(memberNo);
	}

	public Announce selectOneAnnounce(int announceNo) {
		return dao.selectOneAnnounce(announceNo);
	}
	
	public AnnounceView selectAnnounceView(int announceNo) {
		return dao.selectAnnounceView(announceNo);
	}

	public int updateAnnounce(Announce a) {
		return dao.updateAnnounce(a);
	}

	public int deleteAnnounce(int announceNo) {
		int appResult = dao.deleteApplication(announceNo);
		if(appResult > 0) {
			System.out.println("deleteAnnounce Dao 여기 성공");
			return dao.deleteAnnounce(announceNo);
		} else {
			return 0;
		}
		
	}

	public ArrayList<AnnounceList> selectApplyAnnounce(int announceNo) {
		return dao.selectApplyAnnounce(announceNo);
	}

	/*
	 * public ArrayList<Announce> selectAllannounce(int memberNo) { return
	 * dao.selectAllAnnounce(memberNo); }
	 */
}
