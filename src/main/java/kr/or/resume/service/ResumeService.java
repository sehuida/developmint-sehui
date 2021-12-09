package kr.or.resume.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.vo.Member;
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

	
	 public Resume resetCeoResume(int resumeNo, int memberNo) { 
		 int reset = dao.resetCeoResume(memberNo);
		 if(reset > 0) {
			 int ceoResume = dao.updateCeoResume(resumeNo);
			 if(ceoResume > 0) {
				 Resume resume = dao.selectCeoResume(ceoResume);
				 return resume; 
			 } else {
				 return null;
			 }
		 } else {
			 return null;
		 }
	 }

	public Resume selectCeoResume(int ceoResume) {
		return dao.selectCeoResume(ceoResume);
	}

	public int updateCeoResume(Resume r) {
		return dao.updateCeoResume(r);
	}

	public Member selectOneMember(int memberNo) {
		return dao.selectOneMember(memberNo);
	}

	/*	지원한 회사 리스트 가져오기
	 * public ArrayList<Resume> selectAllAnnounce(int memberNo) { return
	 * dao.selectAllAnnounce(memberNo); }
	 */
	 

	/*
	 * public int updateCeoResume(int resumeNo) { return
	 * dao.updateCeoResume(resumeNo); }
	 */
}
