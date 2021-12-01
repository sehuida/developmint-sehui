package kr.or.contest.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.or.contest.vo.Contest;

@Repository
public class ContestDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertContest(Contest c) {
		int result = sqlSession.insert("contest.insertContest",c);
		return result;
	}
}
