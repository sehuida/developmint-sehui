package kr.or.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.admin.dao.AdminDao;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao dao;
}
