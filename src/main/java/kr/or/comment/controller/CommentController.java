package kr.or.comment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.comment.service.CommentService;
import kr.or.comment.vo.Comment;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService service;
	
	@RequestMapping(value="/insertContestComment.do")
	public String insertContestComment(Comment cm, Model model) {
		int result = service.insertContestComment(cm);
		if(result>0) {
			model.addAttribute("msg","댓글등록 완료");	
		}else {
			model.addAttribute("msg","댓글등록 실패");
		}
		model.addAttribute("loc","/contestView.do?contestNo="+cm.getBoardNo());
		return "common/msg";
	}
}
