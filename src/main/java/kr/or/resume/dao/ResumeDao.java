package kr.or.resume.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;
import kr.or.resume.vo.Resume;

@Repository
public class ResumeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Resume> selectAllResume(Member m) {
		List list = sqlSession.selectList("resume.selectAllResume", m);
		return (ArrayList<Resume>)list;
	}

	public Resume selectOneResume(int resumeNo) {
		return sqlSession.selectOne("resume.selectOneresume", resumeNo);
	}

	public int insertResume(Resume r, int memberNo) {
		System.out.println("여기 resumeDao");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("r", r);
		map.put("memberNo", memberNo);
		return sqlSession.insert("resume.insertResume", map);
	}
}
