package kr.or.qna.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.qna.dao.QnaDao;
import kr.or.qna.vo.nonQna;

@Service
public class QnaService {
	
	@Autowired
	private QnaDao dao;

	public int insertCounselNonQna(nonQna nq) {
		int result = dao.insertCountNonQna(nq);
		return result;
	}

}
