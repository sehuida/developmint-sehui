package kr.or.gosu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.or.gosu.vo.Gosu;
import kr.or.gosu.vo.GosuPhoto;
import kr.or.gosu.vo.GosuProject;

import java.util.ArrayList;
import java.util.List;

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

	public ArrayList<Gosu> selectGosuList() {
		List<Gosu> list = sqlSession.selectList("gosu.gosuList");
		return (ArrayList<Gosu>)list;
	}

	public String selectGosuId(int gosuNo) {
		return sqlSession.selectOne("gosu.getGosuId",gosuNo);
	}

	public String selectGosuImg(int gosuNo) {
		return sqlSession.selectOne("gosu.getGosuImg",gosuNo);
	}

	public Gosu selectGosuOne(int ggosuNo) {
		return sqlSession.selectOne("gosu.selectGosuOne",ggosuNo);
	}

	public ArrayList<GosuProject> selectGosuProject(int gNo) {
		List<GosuProject> list = sqlSession.selectList("gosu.selectGosuProjectList",gNo);
		return (ArrayList<GosuProject>)list;
	}

	public ArrayList<GosuPhoto> selectGosuPhoto(int gNo) {
		List<GosuPhoto> list = sqlSession.selectList("gosu.selectGosuPhotoList",gNo);
		return (ArrayList<GosuPhoto>)list;
	}

}
