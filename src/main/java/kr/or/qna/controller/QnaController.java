package kr.or.qna.controller;

import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.annotation.SessionScope;

import kr.or.member.model.vo.Member;
import kr.or.qna.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	private QnaService service;
	
	/*
	 * @RequestMapping(value="/n_counsel.do") public String n_counsel() { return
	 * "qna/n_counsel"; }
	 */
	
	@RequestMapping(value="/n_counsel.do")
	public String tocounsel() {
		return "qna/counsel";
	}
	
	@RequestMapping(value="/faq.do")
	public String tofaq() {
		return "faq/faqList";
	}
	
}
