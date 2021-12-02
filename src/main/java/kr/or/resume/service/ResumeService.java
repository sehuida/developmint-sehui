package kr.or.resume.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.resume.dao.ResumeDao;
import kr.or.resume.vo.Resume;

@Service
public class ResumeService {

	@Autowired
	private ResumeDao dao;

	public Resume selectOneResume(Resume resume) {
		return dao.selectOneResume(resume);
	}
}
