package kr.or.member.model.service;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.member.controller.RandomPassword;
import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.CertiVO;
import kr.or.member.model.vo.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;

	public Member selectOneMember(Member member) {
		Member m = dao.selectOneMember(member);
		return m;
	}
	
	public Member checkPhone(String phone) {
		Member m = dao.checkPhone(phone);
		return m;
	}

	public Member checkId(String memberId) {
		Member m = dao.checkId(memberId);
		return m;
	}

	public Member checkEmail(String email) {
		Member m = dao.checkEmail(email);
		return m;
	}
	
	@Transactional
	public int insertMember(Member member) {
		int result = dao.insertMember(member);
		return result;
	}

	public String findId(String email) {
		String memberId = dao.findId(email);
		return memberId;
	}
	
	public String pwCheck(Member member) {
		Member m = dao.pwCheck(member);
		if(m == null) {
			return null;
		}else {
			//임시비밀번호생성
			//String newPw = new RandomPassword().setPassword(8);
			//메일전송
			String newPw = new MailSender().mailSend2(member.getEmail());
			//리턴임시비밀번호
			return newPw;
		}
	}
	
	@Transactional
	public int resetPwMember(Member member) {
		int result = dao.resetPwMember(member);
		return result;
	}
	
	@Transactional
	public int resignMember(String memberId) {
		int result = 0;
		Member m = dao.checkId(memberId);
		result += dao.insertDelete(m);
		result += dao.resignMember(memberId);
		return result;
	}
	@Transactional
	public int insertCertification(CertiVO file) {
		return dao.insertCertification(file);
	}
	
	@Transactional
	public int updateMyInfo(Member m) {
		return dao.updateMyInfo(m);
	}

	public int updateProfile(Member m) {
		return dao.updateProfile(m);
	}

	public int changePwMember(Member m) {
		return dao.changePwMember(m);
	}
	
}
