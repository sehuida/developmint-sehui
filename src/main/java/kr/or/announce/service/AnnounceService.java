package kr.or.announce.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.announce.dao.AnnounceDao;
import kr.or.announce.vo.Announce;

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

	/*
	 * public ArrayList<Announce> selectAllannounce(int memberNo) { return
	 * dao.selectAllAnnounce(memberNo); }
	 */
}
