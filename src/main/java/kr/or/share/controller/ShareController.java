package kr.or.share.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.share.model.service.ShareService;

@Controller
public class ShareController {
	@Autowired
	private ShareService service;
	
	@RequestMapping(value="/shareList.do")
	public String shareList() {
		return "share/shareList";
	}
	@RequestMapping(value="/shareWriteFrm.do")
	public String shareWriteFrm() {
		return "share/shareWriteFrm";
	}
}
