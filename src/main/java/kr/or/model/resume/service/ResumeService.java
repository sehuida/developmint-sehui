package kr.or.model.resume.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.model.resume.dao.ResumeDao;

@Service
public class ResumeService {

	@Autowired
	private ResumeDao dao;
}
