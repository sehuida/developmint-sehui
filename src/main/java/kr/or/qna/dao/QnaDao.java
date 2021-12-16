package kr.or.qna.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.qna.vo.nonQna;

@Repository
public class QnaDao {

	@Autowired
	private SqlSessionTemplate sqlsession;

	public int insertCountNonQna(nonQna nq) {
		return sqlsession.insert("qna.insertCounselNonQna",nq);
	}
	
}
