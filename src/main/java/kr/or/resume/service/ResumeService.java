package kr.or.resume.service;

import java.util.ArrayList;
import java.util.HashMap;

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

	
	 public int resetCeoResume(int resumeNo, int memberNo) { 
		 int reset = dao.resetCeoResume(memberNo);
		 if(reset > 0) {
			 int ceoResume = dao.updateCeoResume(resumeNo);
			 return ceoResume; 
		 } else {
			 return 0; 			 
		 }
	 }
	 

	/*
	 * public int updateCeoResume(int resumeNo) { return
	 * dao.updateCeoResume(resumeNo); }
	 */
}
