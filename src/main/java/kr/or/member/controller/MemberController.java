package kr.or.member.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.or.member.model.service.MailSender;
import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.CertiVO;
import kr.or.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/loginFrm.do")
	public String login() {
		return "member/login";
	}
	@RequestMapping(value="/join.do")
	public String join(Member member,HttpSession session) {
		int result = service.insertMember(member);
		if(result>0) {
			Member m = service.selectOneMember(member);
			session.setAttribute("m", m);
		}
		return "common/main";
	}
	
	@RequestMapping(value="/login.do")
	public String loginFrm(Member member,HttpSession session,Model model) {
		Member m = service.selectOneMember(member);
		if(m != null) {
			session.setAttribute("m", m);
			return "common/main";
		}else {
			model.addAttribute("msg","아이디/비밀번호를 다시 확인해주세요");
			model.addAttribute("loc","/loginFrm.do");
			return "common/msg";
		}
	}
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "common/main";
	}
	@RequestMapping(value="/joinFrm.do")
	public String joinFrm() {
		return "member/join";
	}
	@ResponseBody
	@RequestMapping(value="/phoneCheck.do")
	public String idCheck(String phone) {
		Member m = service.checkPhone(phone);
		if(m == null) {
			//ajax로 페이지 이동이 없어야 하므로 ResponseBody 어노테이션을 붙여줘야 데이터 자체로 보내줌
			return "1";
		}else {
			return "0";
		}
	}
	@ResponseBody
	@RequestMapping(value="/memberIdCheck.do")
	public String memberIdCheck(String memberId) {
		Member m = service.checkId(memberId);
		if(m == null) {
			return "1";
		}else {
			return "0";
		}
	}
	@ResponseBody
	@RequestMapping(value="/emailCheck.do")
	public String emailCheck(String email) {
		Member m = service.checkEmail(email);
		if(m == null) {
			return "1";
		}else {
			return "0";
		}
	}
	@ResponseBody
	@RequestMapping(value="/sendMail.do")
	public String sendMail(String email) {
		String result = new MailSender().mailSend(email);
		return result;
	}
	@RequestMapping(value="/findId.do")
	public String findId() {
		return "member/findId";
	}
	@ResponseBody
	@RequestMapping(value="/idFind.do")
	public String idFind(String email) {
		String memberId = service.findId(email);
		return memberId;
	}
	
	@ResponseBody
	@RequestMapping(value="/findPw.do")
	public String findPw(Member member) {
		String m = service.pwCheck(member);
		if(m == null) {
			//ajax로 페이지 이동이 없어야 하므로 ResponseBody 어노테이션을 붙여줘야 데이터 자체로 보내줌
			return "1";
		}else {
			member.setMemberPw(m);
			int result = service.resetPwMember(member);
			if(result>0) {
				return m;				
			}else {
				return "1";
			}
		}
	}
	@RequestMapping(value="/mypage.do")
	public String myPage() {
		return "member/mypage";
	}
	@RequestMapping(value="/updateInfoFrm.do")
	public String updateInfoFrm() {
		return "member/updateInfoFrm";
	}
	@RequestMapping(value="/updateMyInfo.do")
	public String updateMyInfo(Member m,Model model,HttpSession session) {
		int result = service.updateMyInfo(m);
		if(result>0) {
			model.addAttribute("title", "변경성공!");
			model.addAttribute("msg", "회원 정보가 변경되었습니다.");
			model.addAttribute("loc", "/mypage.do");
			model.addAttribute("icon", "success");
			Member member = service.checkId(m.getMemberId());
			session.setAttribute("m", member);
		}else {
			model.addAttribute("title", "변경실패");
			model.addAttribute("msg", "회원 정보가 변경실패하셨습니다.");
			model.addAttribute("loc", "/mypage.do");
			model.addAttribute("icon", "warning");
		}
		return "member/swalMsg";
	}
	
	@ResponseBody
	@RequestMapping(value="/resignMember.do")
	public String resginMember(String memberId,HttpSession session) {
		int result = service.resignMember(memberId);
		if(result>0) {
			session.invalidate();
			return "1";
		}else {
			return "0";
		}
	}
	@RequestMapping(value="/certification.do")
	public String certification() {
		return "member/certification";
	}
	
	@RequestMapping(value="/certificationWrite.do")
	public String certification(int memberNo,MultipartFile files,HttpServletRequest request,Model model) {
		CertiVO file = new CertiVO();
		if(!files.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/certification/");
			String filename = files.getOriginalFilename();
			String onlyFilename = filename.substring(0,filename.indexOf("."));
			String extention = filename.substring(filename.indexOf("."));
			String filepath = null;
			int count=0;
			while(true) {
				if(count == 0 ) {
					filepath = onlyFilename+extention;
				}else {
					filepath = onlyFilename+"_"+count+extention;
				}
				File checkFile = new File(savePath+filepath);
				if(!checkFile.exists()) {
					break;
				}
				count++;
			}
			try {
				//중복처리가 끝난 파일명(filepath)로 파일을 업로드
				FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
				//업로드 속도증가를 위한 보조스트림
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				//파일업로드
				byte[] bytes = files.getBytes();
				bos.write(bytes);
				bos.close();
				
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			file.setFilepath(filepath);
			file.setMemberNo(memberNo);
		}
		int result = service.insertCertification(file);
		if(result>0) {
			model.addAttribute("msg", "등록성공");
		}else {
			model.addAttribute("msg","등록실패");		
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}
	@ResponseBody
	@RequestMapping("/uploadProfile.do")
	public String uploadProfile(MultipartFile files,String memberId,HttpServletRequest request,Model model) {
		Member m = new Member();
		if(!files.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/member/");
			String filename = files.getOriginalFilename();
			String onlyFilename = filename.substring(0,filename.indexOf("."));
			String extention = filename.substring(filename.indexOf("."));
			String filepath = null;
			int count=0;
			while(true) {
				if(count == 0 ) {
					filepath = onlyFilename+extention;
				}else {
					filepath = onlyFilename+"_"+count+extention;
				}
				File checkFile = new File(savePath+filepath);
				if(!checkFile.exists()) {
					break;
				}
				count++;
			}
			try {
				//중복처리가 끝난 파일명(filepath)로 파일을 업로드
				FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
				//업로드 속도증가를 위한 보조스트림
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				//파일업로드
				byte[] bytes = files.getBytes();
				bos.write(bytes);
				bos.close();
				
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			m.setFilepath(filepath);
			m.setMemberId(memberId);
		}
		int result = service.updateProfile(m);
		if(result>0) {
			return "1";
		}else {
			return "0";
		}
	}
	@RequestMapping(value ="/changePwFrm.do")
	public String changePwFrm() {
		return "member/changePwFrm";
	}
	@ResponseBody
	@RequestMapping(value ="/checkPw.do")
	public String checkPw(Member m) {
		Member member = service.selectOneMember(m);
		if(member != null) {
			return "1";
		}else {
			return "0";
		}
	}
	@RequestMapping(value="/chanePw.do")
	public String chanePw(Member m,HttpSession session) {
		int result = service.changePwMember(m);
		if(result>0) {
			session.invalidate();
			return "common/main";
		}else {
			return "member/changePwFrm";
		}
	}
}
