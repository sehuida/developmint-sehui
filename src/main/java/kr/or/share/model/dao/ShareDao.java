package kr.or.share.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.share.model.vo.Share;

@Repository
public class ShareDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertBoard(Share s) {
		return sqlSession.insert("share.insertShare",s);
	}

	public int plusPoints(Share s) {
		return sqlSession.update("share.plusPoints",s);
	}

	public ArrayList<Share> shareBoardList(HashMap<String, Object> map) {
		List<Share> list = sqlSession.selectList("share.shareList",map); 
		return (ArrayList<Share>)list;
	}

	public int shareTotalCount() {
		return sqlSession.selectOne("share.shareCount");
	}

	public ArrayList<Share> searchBoard(HashMap<String, Object> map) {
		List<Share> list = sqlSession.selectList("share.searchBoard",map); 
		return (ArrayList<Share>)list;
	}
}
