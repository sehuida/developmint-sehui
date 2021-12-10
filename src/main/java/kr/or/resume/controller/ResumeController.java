package kr.or.resume.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.member.model.vo.Member;
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
	
	@RequestMapping(value="/updateResumeFrm.do")
	public String updateResume(Resume resume, Model model) {
		Resume r = service.selectCeoResume(resume.getCeoResume());
		model.addAttribute("r", r);
		return "resume/updateResumeFrm";
	}
	
	@RequestMapping(value="/updateCeoResume.do")
	public String updateCeoResume(Resume r, int memberNo, Model model) {
		System.out.println(r);
		int result = service.updateCeoResume(r);
		if(result > 0) {
			model.addAttribute("msg","이력서 수정완료");
			model.addAttribute("loc", "/resumeManage.do?memberNo="+memberNo);
		} else {
			model.addAttribute("msg","이력서 수정실패");
		}
		System.out.println(r);
		return "common/msg";
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
	
	@RequestMapping(value="/ceoResumeView.do")
	public String ceoResumeView(Resume r, Model model) {
		int ceoResume = r.getCeoResume();
		Resume resume = service.selectCeoResume(ceoResume);
		Member m = service.selectOneMember(resume.getMemberNo());
		model.addAttribute("r", resume);
		model.addAttribute("m", m);		
		return "resume/ceoResumeView";
	}
	
	@RequestMapping(value="/applicationCompany.do")
	public String applicationCompany(int memberNo) {
		/* ArrayList<Resume> list = service.selectAllAnnounce(memberNo); */
		System.out.println("지원현황 페이지 resumeNo : "+memberNo);
		return "resume/applicationCompany";
	}
	
	@RequestMapping(value="/resumeView.do")
	public String resumeView(int resumeNo, Model model) {
		Resume resume = service.selectResume(resumeNo);
		Member m = service.selectOneMember(resume.getMemberNo());
		model.addAttribute("r", resume);
		model.addAttribute("m", m);
		return "resume/resumeView";
	}
	
}
