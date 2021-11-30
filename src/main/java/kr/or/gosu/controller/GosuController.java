package kr.or.gosu.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.gosu.service.GosuService;



@Controller
public class GosuController {
	
	@Autowired
	private GosuService service;
	
	@RequestMapping(value="/gosuMain.do")
	public String gosuMain() {
		return "gosu/gosuMain";
	}
	@RequestMapping(value="/gosuList.do")
	public String gosuList() {
		return "gosu/gosuList";
	} 
}
