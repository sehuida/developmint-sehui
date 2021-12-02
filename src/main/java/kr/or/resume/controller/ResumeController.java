package kr.or.resume.controller;

import java.util.ArrayList;

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
	public String resumeManage(Model model) {
		ArrayList<Resume> list = service.selectAllResume();
		if(list != null) {
			model.addAttribute("list", list);
			System.out.println("잘됨");
		} else {
			System.out.println("없음");
		}
		return "resume/resumeManage";
	}
}
