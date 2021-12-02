package kr.or.resume.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.resume.vo.Resume;

@Repository
public class ResumeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Resume> selectAllResume() {
		List list = sqlSession.selectList("resume.selectAllResume");
		return (ArrayList<Resume>)list;
	}
}
