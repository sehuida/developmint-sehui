package kr.or.comment.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.comment.vo.Comment;

@Repository
public class CommentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertContestComment(Comment cm) {
		return sqlSession.insert("comment.insertContestComment",cm);
	}
}
