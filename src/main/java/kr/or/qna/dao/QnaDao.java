package kr.or.qna.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDao {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
}
