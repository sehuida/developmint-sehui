package kr.or.share.model.dao;

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
}
