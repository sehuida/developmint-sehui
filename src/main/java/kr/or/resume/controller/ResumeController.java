package kr.or.resume.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.member.model.vo.Member;
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
	public String resumeManage(Model model, int memberNo) {
		ArrayList<Resume> list = service.selectAllResume(memberNo);
		model.addAttribute("list", list);
		return "resume/resumeManage";
	}
	
	@RequestMapping(value="updateResume.do")
	public String updateResume(Resume resume, Model model) {
		int resumeNo = resume.getResumeNo();
		System.out.println(resumeNo);
		Resume r = service.selectOneResume(resumeNo);
		model.addAttribute("r", r);
		return "resume/updateResume";
	}
	
	@RequestMapping(value="insertResume.do")
	public String insertResume(Resume r, int memberNo, Model model) {
		System.out.println("여기 resumeController");
		int result = service.insertResume(r, memberNo);
		if(result != 0) {
			model.addAttribute("msg","이력서 등록실패");
		} else {
			model.addAttribute("msg","이력서 등록성공");			
		}
		model.addAttribute("loc","/WEB-INF/views/resume/resumeManage.jsp");
		return "common/msg";
	}
}
