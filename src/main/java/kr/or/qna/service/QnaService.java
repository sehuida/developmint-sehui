package kr.or.qna.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.member.model.vo.Member;
import kr.or.projectTeam.model.vo.ProjectTeamFileVO;
import kr.or.qna.dao.QnaDao;
import kr.or.qna.vo.Qna;
import kr.or.qna.vo.nonQna;

@Service
public class QnaService {
	
	@Autowired
	private QnaDao dao;

	public int insertCounselNonQna(nonQna nq) {
		int result = dao.insertCountNonQna(nq);
		return result;
	}

	@Transactional
	public int insertCounselQna(Member m, Qna q, ArrayList<ProjectTeamFileVO> list) {
		System.out.println("insert 전 :"+q.getQnaNo());
		int result1 = dao.insertCounselQna(q);
		System.out.println("insert 후 :"+q.getQnaNo());
		System.out.println("멤버 넘버"+m.getMemberNo());
		int result = 0;
		if(result1>0) {
			for(ProjectTeamFileVO ptfv : list) {
				ptfv.setMemberNo(m.getMemberNo());
				ptfv.setBoardNo(q.getQnaNo());
				System.out.println("파일"+ptfv.getFileName());
				System.out.println("파일"+ptfv.getFilePath());
				result += dao.insertFile(ptfv);
			}
		}else {
			return -1;
		}
		return result;
	}

}
