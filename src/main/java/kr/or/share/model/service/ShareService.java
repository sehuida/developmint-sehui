package kr.or.share.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.share.model.dao.ShareDao;
import kr.or.share.model.vo.Share;

@Service
public class ShareService {
	@Autowired
	private ShareDao dao;
	
	@Transactional
	public int insertShareBoard(Share s) {
		int result = 0;
		result += dao.insertBoard(s);
		result += dao.plusPoints(s);
		return result;
	}
}
