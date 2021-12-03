package kr.or.comment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.comment.dao.CommentDao;
import kr.or.comment.vo.Comment;

@Service
public class CommentService {
	
	@Autowired
	private CommentDao dao;

	public int insertContestComment(Comment cm) {
		return dao.insertContestComment(cm);
	}
}
