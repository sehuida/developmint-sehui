package kr.or.projectTeam.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kr.or.projectTeam.model.service.ProjectTeamService;
import kr.or.projectTeam.model.vo.DevelopLanguage;
import kr.or.projectTeam.model.vo.ProjectTeam;
import kr.or.projectTeam.model.vo.ProjectTeamFileVO;
import kr.or.projectTeam.model.vo.projectTeamMainPageData;

@Controller
public class ProjectTeamController {
	@Autowired
	private ProjectTeamService service;
	
	@RequestMapping(value="/recruitTeamMember_mainPage.do")
	public String recruitTeamMember(Model model, int reqPage) {
		projectTeamMainPageData ptmpd = service.selectAllrecruitProject(reqPage);
		model.addAttribute("list", ptmpd.getList());
		model.addAttribute("pageNavi", ptmpd.getPageNavi());
		model.addAttribute("start", ptmpd.getStart());
		model.addAttribute("pdLangList", ptmpd.getPdLangList());
		model.addAttribute("developLangList", ptmpd.getDevelopLangList());
		return "recruitCrue/recruitTeamMember_mainPage";
	}
	
	@RequestMapping(value="/recruitTeamMember_mainSelectPage.do")
	public String recruitTeamMember(Model model, int reqPage, int viewValue, int checkValue, String[] langValue) {
		/*if(langValue != null && delCheckValue == 1) {
			langList.add(langValue);
			projectTeamMainPageData ptmpd = service.selectAllrecruitSelectProject(reqPage, viewValue, checkValue, langList);
		} else if(langValue != null && delCheckValue == 2) {
			langList.remove(langValue);
			projectTeamMainPageData ptmpd = service.selectAllrecruitSelectProject(reqPage, viewValue, checkValue, langList);
		}*/
		if(langValue == null) {
			projectTeamMainPageData ptmpd = service.selectAllrecruitSelectProject(reqPage, viewValue, checkValue);
			model.addAttribute("list", ptmpd.getList());
			model.addAttribute("pageNavi", ptmpd.getPageNavi());
			model.addAttribute("start", ptmpd.getStart());
			model.addAttribute("pdLangList", ptmpd.getPdLangList());
			model.addAttribute("developLangList", ptmpd.getDevelopLangList());
			model.addAttribute("viewValue", viewValue);
			model.addAttribute("checkValue", checkValue);
			model.addAttribute("selectLangList", langValue);
			return "recruitCrue/recruitTeamMember_mainPage";
		} else {
			ArrayList<String> langList = new ArrayList<String>(Arrays.asList(langValue));
			projectTeamMainPageData ptmpd = service.selectAllrecruitSelectProject(reqPage, viewValue, checkValue, langList);
			model.addAttribute("list", ptmpd.getList());
			model.addAttribute("pageNavi", ptmpd.getPageNavi());
			model.addAttribute("start", ptmpd.getStart());
			model.addAttribute("pdLangList", ptmpd.getPdLangList());
			model.addAttribute("developLangList", ptmpd.getDevelopLangList());
			model.addAttribute("viewValue", viewValue);
			model.addAttribute("checkValue", checkValue);
			model.addAttribute("selectLangList", langValue);
			return "recruitCrue/recruitTeamMember_mainPage";
		}
	}
	
	@RequestMapping(value="/recruitNotice_writeForm.do")
	public String recruitTeamMemberDatail(int memberNo, Model model) {
		ArrayList<DevelopLanguage> dlList = service.selectAllDevelopLang();
		if(memberNo > 0) {
			model.addAttribute("memberNo", memberNo);
			model.addAttribute("dlList", dlList);
			return "recruitCrue/recruitNotice_writeForm";
		} else {
			model.addAttribute("msg","로그인 후 이용가능합니다.");	
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
	
	@RequestMapping(value="/rUploadImage.do")
	@ResponseBody
	public String rUploadImage( MultipartFile file, HttpServletRequest request) {
		 /*
			* String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		*/
				
		// 내부경로로 저장
		String saveRoot = request.getSession().getServletContext().getRealPath("/resources/upload/projectTeam/editor/");
		
		String originalFileName = file.getOriginalFilename(); 	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
		// 파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		try {
			FileOutputStream fos = new FileOutputStream(new File(saveRoot + savedFileName));
			//업로드 속도증가를 위한 보조스트림
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			//파일 업로드
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "/resources/upload/projectTeam/editor/"+savedFileName;
	}
	
	@RequestMapping(value="/writeRecruitTeam.do")
	public String writeRecruitTeam(HttpServletRequest request, Model model, ProjectTeam pt, int memberNo, String[] chk) {
		ArrayList<String> langList = new ArrayList<String>(Arrays.asList(chk));
		
		int result = service.writeRecruitTeam(pt, memberNo, langList);
		if(result > 0) {
			model.addAttribute("msg", "모집공고 등록 완료되었습니다.");
		} else {
			model.addAttribute("msg", "모집공고 작성 오류[고객센터에 문의 부탁드립니다.]");
		}
		model.addAttribute("loc","/recruitTeamMember_mainPage.do?reqPage=1");
		return "common/msg";
		
	}
}
