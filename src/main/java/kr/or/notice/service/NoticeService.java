package kr.or.notice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.notice.dao.NoticeDao;

@Service
public class NoticeService {

	@Autowired
	private NoticeDao dao;	
}
