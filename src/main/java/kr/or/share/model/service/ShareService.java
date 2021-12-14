package kr.or.share.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.share.model.dao.ShareDao;

@Service
public class ShareService {
	@Autowired
	private ShareDao dao;
}
