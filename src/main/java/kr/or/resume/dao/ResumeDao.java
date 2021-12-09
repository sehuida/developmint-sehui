package kr.or.resume.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.resume.vo.Resume;

@Repository
public class ResumeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Resume> selectAllResume(int memberNo) {
		List list = sqlSession.selectList("resume.selectAllResume", memberNo);
		return (ArrayList<Resume>)list;
	}

	public Resume selectOneResume(int resumeNo) {
		return sqlSession.selectOne("resume.selectOneresume", resumeNo);
	}

	public int insertResume(Resume r) {
		System.out.println("여기 resumeDao");
		/*
		 * HashMap<String, Object> map = new HashMap<String, Object>(); map.put("r", r);
		 * map.put("memberNo", memberNo);
		 */
		return sqlSession.insert("resume.insertResume", r);
	}

	public int selectCountResume(int memberNo) {
		return sqlSession.selectOne("resume.selectCountResume", memberNo);
	}

	public int resetCeoResume(int memberNo) { 
		return sqlSession.update("resume.resetCeoResume", memberNo); 
	}
	
	public int updateCeoResume(int resumeNo) {
		return sqlSession.update("resume.updateCeoResume", resumeNo); 
	}

	public Resume selectCeoResume(int ceoResume) {
		return sqlSession.selectOne("resume.selectCeoResume", ceoResume);
	}

	public int updateCeoResume(Resume r) {
		System.out.println("여기 dao resume : " + r);
		return sqlSession.update("resume.updateResume", r);
	}
	 
}
