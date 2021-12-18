package kr.or.qna.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.ResultMap;
import org.omg.PortableInterceptor.NON_EXISTENT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;

import kr.or.member.model.vo.Member;
import kr.or.notice.vo.Notice;
import kr.or.projectTeam.model.vo.ProjectTeamFileVO;
import kr.or.qna.service.QnaService;
import kr.or.qna.vo.Qna;
import kr.or.qna.vo.nonQna;

@Controller
public class QnaController {

	@Autowired
	private QnaService service;
	
	/*
	 * @RequestMapping(value="/n_counsel.do") public String n_counsel() { return
	 * "qna/n_counsel"; }
	 */
	
	@RequestMapping(value="/n_counsel.do")
	public String tocounsel() {
		return "qna/counsel";
	}
	
	@RequestMapping(value="/faq.do")
	public String tofaq() {
		return "faq/faq";
	}
	
	@ResponseBody
	@RequestMapping(value="/fileupload.do")
	public String uploadImage(MultipartFile file, HttpServletRequest req) {
		/*
		String contextRoot = new HttpServletRequestWrapper(req).getRealPath("/");
		String fileRoot = contextRoot + "resources/upload/notice/";
		String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자

		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
		try {
			FileOutputStream fos = new FileOutputStream(new File(fileRoot + savedFileName));
			// 업로드 속도증가를 위한 보조스트림
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			// 파일 업로드
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(fileRoot + savedFileName);
		return "/resources/upload/notice/" + savedFileName;
		*/
		
		String savePath = req.getSession().getServletContext().getRealPath("/resources/upload/qna/");
		String filename = file.getOriginalFilename();
		String onlyFilename = filename.substring(0,filename.indexOf("."));
		String extension = filename.substring(filename.indexOf("."));
		String filepath = null;
		int count=0;
		while(true) {
			if(count == 0 ) {
				filepath = onlyFilename+extension;
			}else {
				filepath = onlyFilename+"_"+count+extension;
			}
			File checkFile = new File(savePath+filepath);
			if(!checkFile.exists()) {
				break;
			}
			count++;
		}
		try {
			FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
			// 업로드 속도증가를 위한 보조스트림
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			// 파일 업로드
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/resources/upload/qna/" + filepath;
	}
	
	//비회원일경우
	@RequestMapping(value="/counsel_save1.do")
	public String insertCounsel(nonQna nq, HttpServletRequest request, Model model) {
		int result = service.insertCounselNonQna(nq);
		if(result>0) {
			model.addAttribute("msg","1:1 Q&A 신청 완료");	
		}else {
			model.addAttribute("msg","1:1 Q&A 신청 실패");
		}
		model.addAttribute("loc","/n_counsel.do");
		return "common/msg";
	}
	
	@RequestMapping(value="/counsel_save2.do")
	public String insertCounsel2(@SessionAttribute Member m, Qna q, HttpServletRequest request, MultipartFile[] Filedata, Model model) {
		ArrayList<ProjectTeamFileVO> list = new ArrayList<ProjectTeamFileVO>();
		//MultipartFile[]배열은 파일을 첨부하지 않더라도 무조건 길이가 1인 배열
		//배열의 첫번째 파일이 비어있는지 체크하는 방식으로 파일첨부 여부 확인
		if(!Filedata[0].isEmpty()) {	
			//파일을 업로드할 경로 설정
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/qna/");
			//반복문을 이요해서 파일처리(파일업로드)
			for(MultipartFile file : Filedata) {
				//파일명중복처리
				String filename = file.getOriginalFilename();
				String onlyFilename = filename.substring(0,filename.indexOf("."));//test
				String extention = filename.substring(filename.indexOf("."));//.txt
				//실제 업로드할 파일명을 저장할 변수
				String filepath = null;
				int count = 0;
				while(true) {
					if(count ==0) {
						filepath = onlyFilename+extention;//test.txt
					}else {
						filepath = onlyFilename+"_"+count+extention;	//test_3.txt
					}
					File checkFile = new File(savePath+filepath);		//java.io.File
					if(!checkFile.exists()) {//존재하지않을경우 ==>true가 되게
						break;
					}
					count++;
				}//---------------------------------------------------------------------------------
				//파일명 중복처리가 끝나면 파일업로드
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
					//업로드 속도증가를 위한 보조스트림
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					//파일 업로드
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				ProjectTeamFileVO ptfv = new ProjectTeamFileVO();
				ptfv.setFileName(filename);
				ptfv.setFilePath(filepath);
				list.add(ptfv);
			}
		}
		int result = service.insertCounselQna(m,q, list);
		if(result == -1||result != list.size()) {
			model.addAttribute("msg","등록실패");
		}else {
			model.addAttribute("msg","등록성공");
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
	
	@RequestMapping(value="/myCounsel.do")
	public String myCounsel() {
		return "qna/counselUser";
	}
	
	/*
	 * @RequestMapping(value="/adminCounsel.do") public String adminCounsel(Model
	 * model) { ArrayList<Qna> adlist = service.counselList();
	 * model.addAttribute("adlist",adlist); return "qna/counselAdmin"; }
	 */
	
	@RequestMapping(value="/adminCounsel.do")
	public String adminCounsel(Model model) {
		ArrayList<Qna> adlist = service.counselList();
		model.addAttribute("adlist",adlist);
		return "qna/counselAdmin";
	}
	
}
