package kr.or.share.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShareController {
	
	@RequestMapping(value="/shareList.do")
	public String shareList() {
		return "share/shareList";
	}
}
