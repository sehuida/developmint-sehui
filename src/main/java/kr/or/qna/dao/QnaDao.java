package kr.or.qna.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class QnaDao {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
}
