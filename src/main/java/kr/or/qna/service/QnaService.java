package kr.or.qna.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.qna.dao.QnaDao;

@Service
public class QnaService {
	
	@Autowired
	private QnaDao dao;
}
