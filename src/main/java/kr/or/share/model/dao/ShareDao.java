package kr.or.share.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShareDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
