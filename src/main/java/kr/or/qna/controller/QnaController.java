package kr.or.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.qna.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	private QnaService service;
	
}
