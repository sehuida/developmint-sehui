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

import kr.or.member.model.vo.Member;
import kr.or.projectTeam.model.service.ProjectTeamService;
import kr.or.projectTeam.model.vo.DevelopLanguage;
import kr.or.projectTeam.model.vo.ProjectEntry;
import kr.or.projectTeam.model.vo.ProjectTeam;
import kr.or.projectTeam.model.vo.ProjectTeamApplyPageData;
import kr.or.projectTeam.model.vo.ProjectTeamFileVO;
import kr.or.projectTeam.model.vo.ProjectTeamNoticeViewData;
import kr.or.projectTeam.model.vo.projectTeamMainPageData;

@Controller
public class ProjectTeamController {
	@Autowired
	private ProjectTeamService service;
	
	@RequestMapping(value="/recruitTeamMember_mainPage.do")
	public String recruitTeamMember(Model model, int reqPage) {
		service.updateStatus();
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
			projectTeamMainPageData ptmpd = service.selectAllrecruitSelectProject(reqPmage, viewValue, checkValue, langList);
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
	
	@RequestMapping(value="/selectOneNotice.do")
	public String selectOneNotice(Model model, int projectNo, Integer memberNo) {
		service.updateStatus();
		if(memberNo == null) {
			memberNo = -1;
		}
		ProjectTeamNoticeViewData ptnvd = service.selectOneNotice(projectNo, memberNo);
		model.addAttribute("commentList", ptnvd.getList());
		model.addAttribute("pt", ptnvd.getPt());
		model.addAttribute("pdLangList", ptnvd.getPdLangList());
		model.addAttribute("memberNo", memberNo);
		return "recruitCrue/recruitTeamMember_detail";
	}
	
	@RequestMapping(value="/updateRecruitFrm.do")
	public String updateOneNoticeFrm(Model model, int projectNo, Integer memberNo) {
		ArrayList<DevelopLanguage> dlList = service.selectAllDevelopLang();
		if(memberNo == null) {
			memberNo = -1;
		}
		ProjectTeamNoticeViewData ptnvd = service.selectOneNotice(projectNo, memberNo);
		model.addAttribute("commentList", ptnvd.getList());
		model.addAttribute("pt", ptnvd.getPt());
		model.addAttribute("pdLangList", ptnvd.getPdLangList());
		model.addAttribute("memberNo", memberNo);
		model.addAttribute("dlList", dlList);
		return "recruitCrue/recruitNoticeUpdateForm";
	}
	
	
	  @RequestMapping(value="/updateRecruitNotice.do") 
	  public String updateOneNotice(HttpServletRequest request, Model model, ProjectTeam pt, int memberNo, String[] chk, int projectNo) { 
		  ArrayList<String> langList = new ArrayList<String>(Arrays.asList(chk));
	  
		  int result = service.updateRecruitTeam(pt, memberNo, langList, projectNo); 
		  if(result > 0) { 
			  model.addAttribute("title", "수정성공!");
			  model.addAttribute("msg", "수정 완료되었습니다.");
			  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "변경실패");
			  model.addAttribute("msg", "수정 실패하였습니다.");
			  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "warning");
		  }
		  return "member/swalMsg"; 
	  }
	  
	  @RequestMapping(value="/deleteRecruit.do") 
	  public String deleteOneNotice(Model model, int projectNo, int memberNo) { 
		  int result = service.deleteOneNotice(projectNo); 
		  if(result > 0) { 
			  model.addAttribute("title", "삭제 성공");
			  model.addAttribute("msg", "삭제 완료되었습니다.");
			  model.addAttribute("loc","/recruitTeamMember_mainPage.do?reqPage=1");
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "삭제 실패");
			  model.addAttribute("msg", "삭제 실패하였습니다.");
			  model.addAttribute("loc","/recruitTeamMember.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "warning");
		  }
		  return "member/swalMsg"; 
	  }
	  
	  @RequestMapping(value="/insertComment.do") 
	  public String insertComment(Model model, String commentContent, int boardNo, String memberId, int memberNo) {
		  int result = service.insertComment(commentContent, boardNo, memberId); 
		  if(result > 0) { 
			  model.addAttribute("title", "댓글 등록 성공");
			  model.addAttribute("msg", "댓글 등록 완료되었습니다.");
			  model.addAttribute("loc","/selectOneNotice.do?projectNo="+boardNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "댓글 등록 실패");
			  model.addAttribute("msg", "댓글 등록 실패하였습니다.");
			  model.addAttribute("loc","/selectOneNotice.do?projectNo="+boardNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "warning");
		  }
		  return "member/swalMsg"; 
	  }
	  
	  @RequestMapping(value="/deleteComment.do") 
	  public String deleteComment(Model model, int commentNo, int projectNo, int memberNo) {
		  int result = service.deleteComment(commentNo); 
		  if(result > 0) { 
			  model.addAttribute("title", "댓글 삭제 성공");
			  model.addAttribute("msg", "댓글 삭제 완료되었습니다.");
			  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "댓글 삭제 실패");
			  model.addAttribute("msg", "댓글 삭제 실패하였습니다.");
			  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "warning");
		  }
		  return "member/swalMsg"; 
	  }
	  
	  @RequestMapping(value="/updateComment.do") 
	  public String updateComment(Model model, int commentNo, int projectNo, int memberNo, String commentContent) {
		  int result = service.updateComment(commentNo, commentContent); 
		  if(result > 0) { 
			  model.addAttribute("title", "댓글 수정 성공");
			  model.addAttribute("msg", "댓글 수정 완료되었습니다.");
			  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "댓글 수정 실패");
			  model.addAttribute("msg", "댓글 수정 실패하였습니다.");
			  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "warning");
		  }
		  return "member/swalMsg"; 
	  }
	  
	  @RequestMapping(value="/reCommentInsert.do")   
	  public String reCommentInsert(Model model, String commentContent, int boardNo, String memberId, int memberNo, int commentNo) {
		  int result = service.reCommentInsert(commentContent, boardNo, memberId, commentNo); 
		  if(result > 0) { 
			  model.addAttribute("title", "대댓글 등록 성공");
			  model.addAttribute("msg", "대댓글 등록 완료되었습니다.");
			  model.addAttribute("loc","/selectOneNotice.do?projectNo="+boardNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "대댓글 등록 실패");
			  model.addAttribute("msg", "대댓글 등록 실패하였습니다.");
			  model.addAttribute("loc","/selectOneNotice.do?projectNo="+boardNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "warning");
		  }
		  return "member/swalMsg"; 
	  }
	  
	  @RequestMapping(value="/insertDibCount.do")   
	  public String insertDibCount(Model model, int projectNo, int memberNo) {
		  int result = service.insertDibCount(projectNo, memberNo); 
		  if(result > 0) { 
			  model.addAttribute("title", "찜 하기 성공");
			  model.addAttribute("msg", "해당 게시물을 찜했습니다!");
			  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "찜 하기 실패");
			  model.addAttribute("msg", "찜 하기에 실패하였습니다.");
			  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "warning");
		  }
		  return "member/swalMsg"; 
	  }
	  
	  @RequestMapping(value="/deleteDibCount.do")   
	  public String deleteDibCount(Model model, int projectNo, int memberNo) {
		  int result = service.deleteDibCount(projectNo, memberNo); 
		  if(result > 0) { 
			  model.addAttribute("title", "찜 취소");
			  model.addAttribute("msg", "해당 게시물에 찜한 내역을 취소했습니다.");
			  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "찜 취소 실패");
			  model.addAttribute("msg", "찜 취소하는 것에 실패하였습니다.");
			  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "warning");
		  }
		  return "member/swalMsg"; 
	  }
	  
	  @RequestMapping(value="/insertApplyProjectFrm.do")
		public String insertApplyProjectFrm(int memberNo, Model model, int projectNo) {
			ArrayList<DevelopLanguage> dlList = service.selectAllDevelopLang();
			if(memberNo > 0) {
				model.addAttribute("memberNo", memberNo);
				model.addAttribute("dlList", dlList);
				model.addAttribute("projectNo", projectNo);
				return "recruitCrue/applyTeam_writeForm";
			} else {
				model.addAttribute("title", "비회원 서비스 이용 불가");
				model.addAttribute("msg", "로그인 후 이용이 가능합니다.");
				model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
				model.addAttribute("icon", "warning");
				return "member/swalMsg";
			}
		}
	  
	  @RequestMapping(value="/insertApplyProject.do")
		public String insertApplyProject(HttpServletRequest request, Model model, ProjectEntry pta, int memberNo, String[] chk, int projectNo) {
			ArrayList<String> langList = new ArrayList<String>(Arrays.asList(chk));
			
			int result = service.insertApplyProject(pta, langList);
			if(result > 0) { 
				  model.addAttribute("title", "지원 성공");
				  model.addAttribute("msg", "성공적으로 프로젝트 지원에 성공하였습니다.");
				  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
				  model.addAttribute("icon", "success");
			  } else {
				  model.addAttribute("title", "지원 실패");
				  model.addAttribute("msg", "프로젝트 지원에 실패하였습니다.");
				  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
				  model.addAttribute("icon", "warning");
			  }
			  return "member/swalMsg"; 
		}
	  
	  @RequestMapping(value="/manageEntry.do")
		public String manageEntry(Model model, int reqPage, int viewValue, int memberNo, int projectNo) {
			
			ProjectTeamApplyPageData ptapd = service.selectAllManageEntry(reqPage, viewValue, projectNo);
			model.addAttribute("entryList", ptapd.getEntryList());
			model.addAttribute("pageNavi", ptapd.getPageNavi());
			model.addAttribute("start", ptapd.getStart());
			model.addAttribute("udLangList", ptapd.getUdLangList());
			model.addAttribute("developLangList", ptapd.getDevelopLangList());
			model.addAttribute("viewValue", viewValue);			
			model.addAttribute("availableNum", ptapd.getEntryList().get(0).getAvailableNum());
			return "recruitCrue/manageEntry";
			
		}
	 
}
