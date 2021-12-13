package kr.or.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.qna.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	private QnaService service;
	
	@RequestMapping(value="/tocounsel.do")
	public String tocounsel() {
		return "qna/counsel";
	}
	
	@RequestMapping(value="/faq.do")
	public String tofaq() {
		return "faq/faqList";
	}
	
}
