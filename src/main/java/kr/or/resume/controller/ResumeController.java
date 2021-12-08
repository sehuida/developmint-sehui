package kr.or.resume.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.resume.service.ResumeService;
import kr.or.resume.vo.Resume;

@Controller
public class ResumeController {

	@Autowired
	private ResumeService service;

	
	 @RequestMapping(value="/resumeFrm.do") 
	 public String resumeFrm() { 
		 return "resume/resumeFrm"; 
	 }
	 
	@RequestMapping(value="/resumeManage.do")
	public String resumeManage(Model model, int memberNo) {
		ArrayList<Resume> list = service.selectAllResume(memberNo);
		if(!list.isEmpty()) {
			int count = service.selectResumeCount(memberNo);			
			model.addAttribute("count", count);
		}
		model.addAttribute("list", list);
		return "resume/resumeManage";
	}
	
	@RequestMapping(value="/updateResume.do")
	public String updateResume(Resume resume, Model model) {
		int resumeNo = resume.getResumeNo();
		System.out.println(resumeNo);
		Resume r = service.selectOneResume(resumeNo);
		model.addAttribute("r", r);
		return "resume/updateResume";
	}
	
	@RequestMapping(value="/insertResume.do")
	public String insertResume(Resume r, int memberNo, Model model) {
		System.out.println("여기 resumeController");
		System.out.println(r);
		int result = service.insertResume(r);
		if(result != 0) {
			model.addAttribute("msg","이력서 등록성공");
		} else {
			model.addAttribute("msg","이력서 등록실패");			
		}
		model.addAttribute("loc","/resumeManage.do?memberNo="+memberNo);
		return "common/msg";
	}
	
	@RequestMapping(value="/ceoResume.do")
	@ResponseBody
	public Resume ceoResume(int resumeNo, int memberNo) {
		Resume resume = service.resetCeoResume(resumeNo, memberNo);
		
		return resume;
	}
	
	
	
}
