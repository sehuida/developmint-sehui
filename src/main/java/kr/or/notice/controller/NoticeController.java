package kr.or.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.notice.service.NoticeService;
import kr.or.notice.vo.Notice;
import kr.or.notice.vo.NoticePageData;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	@RequestMapping(value="/noticeList.do")
	public String noticeList(int reqPage, Model model) {
		NoticePageData npd = service.selectNoticeList(reqPage);
		model.addAttribute("list",npd.getFixlist());
		model.addAttribute("pageNavi",npd.getPageNavi());
		model.addAttribute("start",npd.getStart());
		model.addAttribute("totalCount",npd.getTotalCount());
		model.addAttribute("fixPage",npd.getFixPage());
		return "notice/noticeList";
	}
	
	@RequestMapping(value="/nWriteFrm.do")
	public String nWriteFrm() {
		return "notice/nWriteFrm";
	}
	
	@RequestMapping(value="/noticehome.do")
	public String nHome() {
		return "notice/noticeHome";
	}
	
	@RequestMapping(value="/noticeView.do")
	public String noticeView(int noticeNo, Model model) {
		Notice n = service.selectOneNotice(noticeNo);
		model.addAttribute("n",n);
		return "notice/noticeView";
	}
}
