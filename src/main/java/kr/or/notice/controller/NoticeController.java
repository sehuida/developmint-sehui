package kr.or.notice.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

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
		ArrayList<Notice> nlist = service.noticeAroundList(noticeNo);
		model.addAttribute("n",n);
		model.addAttribute("noticeNo",noticeNo);
		return "notice/noticeView";
	}
	
	@RequestMapping(value="/insertNotice.do")
	public String insertNotive(Notice n, Model model) {
		int result = service.insertNotice(n);
		return "notice/noticeList";
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadImage.do")
	public String uploadImage(MultipartFile file, HttpServletRequest req) {		
				
		String contextRoot = new HttpServletRequestWrapper(req).getRealPath("/");
		String fileRoot = contextRoot+"resources/upload/notice/";
		String originalFileName = file.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		try {
			FileOutputStream fos = new FileOutputStream(new File(fileRoot + savedFileName));
			//업로드 속도증가를 위한 보조스트림
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			//파일 업로드
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*-----------------------------------------------------------------*/
		
		return "/resources/upload/notice/"+savedFileName;
	}
}
