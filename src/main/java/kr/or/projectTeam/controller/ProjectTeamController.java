package kr.or.projectTeam.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

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
import kr.or.projectTeam.model.vo.ProjectTeam;

@Controller
public class ProjectTeamController {
	@Autowired
	private ProjectTeamService service;
	
	@RequestMapping(value="/recruitTeamMember_mainPage.do")
	public String recruitTeamMember(Model model ) {
		ArrayList<ProjectTeam> list = service.selectAllrecruitProject();
		model.addAttribute("list", list);
//		System.out.println(list.get(0).getRTitle());
		return "recruitCrue/recruitTeamMember_mainPage";
	}
	
	@RequestMapping(value="/recruitNotice_writeForm.do")
	public String recruitTeamMemberDatail(int memberNo, Model model) {
		if(memberNo > 0) {
			model.addAttribute("memberNo", memberNo);
			return "recruitCrue/recruitNotice_writeForm";
		} else {
			model.addAttribute("msg","로그인 후 이용가능합니다.");	
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
	
	@RequestMapping(value="/rUploadImage.do")
	@ResponseBody
	public String rUploadImage(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();
		 /*
			* String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		*/
				
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/attachment/projectTeam/recruitTeamNotice";
		
		String originalFileName = multipartFile.getOriginalFilename(); 	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
		// 파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		File targetFile = new File(fileRoot + savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			jsonObject.addProperty("url", "/resources/attachment/projectTeam/recruitTeamNotice"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
		
		
	}
}
