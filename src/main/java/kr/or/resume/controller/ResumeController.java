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
	public String resumeManage(Model model, Member m) {
		ArrayList<Resume> list = service.selectAllResume(m);
		System.out.println();
		if(list != null) {
			model.addAttribute("list", list);
			System.out.println("잘됨");		//테스트 끝나면 sout지우기
		} else {
			System.out.println("없음");
		}
		return "resume/resumeManage";
	}
	
	@RequestMapping(value="updateResume.do")
	public String updateResume(int resumeNo, Model model) {
		Resume r = service.selectOneResume(resumeNo);
		model.addAttribute("r", r);
		return "resume/updateResume";
	}
}
