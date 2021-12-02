package kr.or.resume.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.resume.vo.Resume;

@Repository
public class ResumeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Resume selectOneResume(Resume resume) {
		return sqlSession.selectOne("resume.selectOneResume", resume);
	}
}
