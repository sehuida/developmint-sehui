package kr.or.gosu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.or.gosu.vo.Gosu;
import kr.or.gosu.vo.GosuPhoto;
import kr.or.gosu.vo.GosuProject;

import org.mybatis.spring.SqlSessionTemplate;
@Repository
public class GosuDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertGosu(Gosu g) {
		
		return sqlSession.insert("gosu.insertGosu",g);
	}

	public int insertGPhoto(GosuPhoto gph) {
		return sqlSession.insert("gosu.insertGPhoto",gph);
	}

	public int insertGProject(GosuProject gpr) {
		return sqlSession.insert("gosu.insertGProject",gpr);
	}
}
