package kr.or.resume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.resume.service.ResumeService;
import kr.or.resume.vo.Resume;

@Controller
public class ResumeController {

	@Autowired
	private ResumeService service;
	
	@RequestMapping(value="resumeFrm.do")
	public String resumeFrm() {
		return "resume/resumeFrm";
	}
	
	@RequestMapping(value="resumeManage.do")
	public String resumeManage(Resume resume, Model model) {
		Resume r = service.selectOneResume(resume);
		return "resume/resumeManage";
	}
}
