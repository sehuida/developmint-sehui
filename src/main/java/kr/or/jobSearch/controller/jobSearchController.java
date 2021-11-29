package kr.or.jobSearch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class jobSearchController {

	@RequestMapping(value="/jobSearchList.do")
	public String jobSearchList() {
		return "jobSearch/jobSearchList";
	}
}
