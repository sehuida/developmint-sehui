package kr.or.resume.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.resume.dao.ResumeDao;
import kr.or.resume.vo.Resume;

@Service
public class ResumeService {

	@Autowired
	private ResumeDao dao;

	public ArrayList<Resume> selectAllResume(int memberNo) {
		return dao.selectAllResume(memberNo);
	}

	public Resume selectOneResume(int resumeNo) {
		return dao.selectOneResume(resumeNo);
	}

	public int insertResume(Resume r) {
		System.out.println("여기 resumeService");
		return dao.insertResume(r);
	}

	public int selectResumeCount(int memberNo) {
		return dao.selectCountResume(memberNo);
	}
}
